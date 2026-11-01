import 'dart:async';

import 'package:flutter/foundation.dart';

import '../models/shadow_mvp_models.dart';
import 'pacer_calculator.dart';
import 'pacer_models.dart';

class PacerController extends ChangeNotifier {
  PacerController({
    required this.passage,
    int initialWpm = PacerCalculator.defaultWpm,
    PacerMode initialMode = PacerMode.sentenceFocus,
    this.enableAudioRecording = false,
  })  : _wpm = initialWpm,
        _mode = initialMode {
    _recalculateTimings();
  }

  final ShadowPassage passage;
  final bool enableAudioRecording;
  bool _isDisposed = false;

  int _wpm;
  PacerMode _mode;
  PacerStatus _status = PacerStatus.idle;

  int _currentIndex = 0;
  double _sentenceProgress = 0.0;
  int _sentenceElapsedMs = 0;
  int _totalElapsedMs = 0;
  int _countdownSeconds = 3;
  bool _showTranslation = true;
  String? _recordedAudioPath;
  String? _errorMessage;

  Timer? _tickerTimer;
  Timer? _countdownTimer;
  late PacerPassageTiming _timingPlan;

  // Getters
  int get wpm => _wpm;
  PacerMode get mode => _mode;
  PacerStatus get status => _status;
  int get currentIndex => _currentIndex;
  double get sentenceProgress => _sentenceProgress;
  int get sentenceElapsedMs => _sentenceElapsedMs;
  int get totalElapsedMs => _totalElapsedMs;
  int get countdownSeconds => _countdownSeconds;
  bool get showTranslation => _showTranslation;
  String? get recordedAudioPath => _recordedAudioPath;
  String? get errorMessage => _errorMessage;
  PacerPassageTiming get timingPlan => _timingPlan;

  bool get isRunning => _status == PacerStatus.running;
  bool get isPaused => _status == PacerStatus.paused;
  bool get isCompleted => _status == PacerStatus.completed;
  bool get isCountdown => _status == PacerStatus.countdown;
  bool get isIdle => _status == PacerStatus.idle;

  PacerSentenceTiming get currentSentenceTiming =>
      _timingPlan.sentenceTimings[_currentIndex];
  ShadowPassageSentence get currentSentence => currentSentenceTiming.sentence;

  int get totalSentences => passage.sentences.length;

  /// Continuous progress (0.0 -> 1.0) across the entire passage.
  double get overallProgress {
    final totalMs = _timingPlan.totalDurationMs;
    if (totalMs <= 0) return 0.0;
    if (_status == PacerStatus.completed) return 1.0;
    if (_status == PacerStatus.idle) return 0.0;
    final currentStartMs = currentSentenceTiming.startMs;
    final currentAbsoluteMs = currentStartMs + _sentenceElapsedMs;
    return (currentAbsoluteMs / totalMs).clamp(0.0, 1.0);
  }

  void _recalculateTimings() {
    _timingPlan = PacerCalculator.calculatePassageTiming(
      passage: passage,
      wpm: _wpm,
    );
  }

  void setMode(PacerMode newMode) {
    if (_mode == newMode) return;
    _mode = newMode;
    if (_status == PacerStatus.completed) {
      _status = PacerStatus.idle;
      _currentIndex = 0;
      _sentenceElapsedMs = 0;
      _sentenceProgress = 0.0;
    }
    _safeNotifyListeners();
  }

  void toggleTranslation() {
    _showTranslation = !_showTranslation;
    _safeNotifyListeners();
  }

  void setWpm(int newWpm) {
    final clamped = newWpm.clamp(PacerCalculator.minWpm, PacerCalculator.maxWpm);
    if (_wpm == clamped) return;
    _wpm = clamped;
    _recalculateTimings();

    if (_status == PacerStatus.completed) {
      _status = PacerStatus.idle;
      _currentIndex = 0;
      _sentenceElapsedMs = 0;
      _sentenceProgress = 0.0;
    } else {
      final curDuration = currentSentenceTiming.durationMs;
      if (curDuration > 0) {
        _sentenceProgress = (_sentenceElapsedMs / curDuration).clamp(0.0, 1.0);
      }
    }
    _safeNotifyListeners();
  }

  /// Start practice immediately without countdown.
  Future<void> start() async {
    _tickerTimer?.cancel();
    _countdownTimer?.cancel();
    _currentIndex = 0;
    _sentenceElapsedMs = 0;
    _sentenceProgress = 0.0;
    _totalElapsedMs = 0;
    _errorMessage = null;
    _beginPractice();
  }

  void _beginPractice() {
    _status = PacerStatus.running;
    _startTicker();
    _safeNotifyListeners();
  }

  void _safeNotifyListeners() {
    if (!_isDisposed) {
      notifyListeners();
    }
  }

  void _startTicker() {
    _tickerTimer?.cancel();
    const intervalMs = 16; // ~60fps smooth ticker for continuous scroll & progress
    _tickerTimer = Timer.periodic(const Duration(milliseconds: intervalMs), (_) {
      if (_status != PacerStatus.running) return;

      _sentenceElapsedMs += intervalMs;
      _totalElapsedMs += intervalMs;

      final currentTargetDuration = currentSentenceTiming.durationMs;
      _sentenceProgress =
          (_sentenceElapsedMs / currentTargetDuration).clamp(0.0, 1.0);

      if (_sentenceElapsedMs >= currentTargetDuration) {
        _onSentenceFinished();
      } else {
        _safeNotifyListeners();
      }
    });
  }

  void _onSentenceFinished() {
    if (_currentIndex < totalSentences - 1) {
      _currentIndex++;
      _sentenceElapsedMs = 0;
      _sentenceProgress = 0.0;
      _safeNotifyListeners();
    } else {
      finish();
    }
  }

  void pause() {
    if (_status != PacerStatus.running) return;
    _status = PacerStatus.paused;
    _tickerTimer?.cancel();
    _safeNotifyListeners();
  }

  void resume() {
    if (_status != PacerStatus.paused) return;
    _status = PacerStatus.running;
    _startTicker();
    _safeNotifyListeners();
  }

  void togglePlayPause() {
    if (isRunning) {
      pause();
    } else if (isPaused) {
      resume();
    } else if (isIdle || isCompleted) {
      start();
    }
  }

  void nextSentence() {
    if (_currentIndex < totalSentences - 1) {
      _currentIndex++;
      _sentenceElapsedMs = 0;
      _sentenceProgress = 0.0;
      if (_status == PacerStatus.completed) {
        _status = PacerStatus.idle;
      }
      _safeNotifyListeners();
    } else {
      finish();
    }
  }

  void previousSentence() {
    if (_status == PacerStatus.completed) {
      _status = PacerStatus.idle;
    }
    if (_currentIndex > 0) {
      _currentIndex--;
      _sentenceElapsedMs = 0;
      _sentenceProgress = 0.0;
      _safeNotifyListeners();
    } else {
      _sentenceElapsedMs = 0;
      _sentenceProgress = 0.0;
      _safeNotifyListeners();
    }
  }

  void jumpToSentence(int index) {
    if (index < 0 || index >= totalSentences) return;
    if (_currentIndex == index && _status != PacerStatus.completed) return;
    if (_status == PacerStatus.completed) {
      _status = PacerStatus.idle;
    }
    _currentIndex = index;
    _sentenceElapsedMs = 0;
    _sentenceProgress = 0.0;
    _safeNotifyListeners();
  }

  Future<void> finish() async {
    _tickerTimer?.cancel();
    _countdownTimer?.cancel();
    _status = PacerStatus.completed;
    _sentenceProgress = 1.0;
    _safeNotifyListeners();
  }

  Future<void> reset() async {
    _tickerTimer?.cancel();
    _countdownTimer?.cancel();
    _status = PacerStatus.idle;
    _currentIndex = 0;
    _sentenceElapsedMs = 0;
    _sentenceProgress = 0.0;
    _totalElapsedMs = 0;
    _countdownSeconds = 3;
    _safeNotifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    _tickerTimer?.cancel();
    _countdownTimer?.cancel();
    super.dispose();
  }
}
