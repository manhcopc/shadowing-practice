import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

import '../models/shadow_mvp_models.dart';
import 'pacer_calculator.dart';
import 'pacer_models.dart';

class PacerController extends ChangeNotifier {
  PacerController({
    required this.passage,
    int initialWpm = PacerCalculator.defaultWpm,
    PacerMode initialMode = PacerMode.sentenceFocus,
    this.enableAudioRecording = true,
  })  : _wpm = initialWpm,
        _mode = initialMode {
    _recalculateTimings();
  }

  final ShadowPassage passage;
  final bool enableAudioRecording;
  AudioRecorder? _recorder;
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

  PacerSentenceTiming get currentSentenceTiming => _timingPlan.sentenceTimings[_currentIndex];
  ShadowPassageSentence get currentSentence => currentSentenceTiming.sentence;

  int get totalSentences => passage.sentences.length;

  void _recalculateTimings() {
    _timingPlan = PacerCalculator.calculatePassageTiming(
      passage: passage,
      wpm: _wpm,
    );
  }

  void setMode(PacerMode newMode) {
    if (_mode == newMode) return;
    _mode = newMode;
    notifyListeners();
  }

  void toggleTranslation() {
    _showTranslation = !_showTranslation;
    notifyListeners();
  }

  void setWpm(int newWpm) {
    if (_wpm == newWpm) return;
    _wpm = newWpm.clamp(PacerCalculator.minWpm, PacerCalculator.maxWpm);
    _recalculateTimings();

    // Re-adjust sentence progress if running/paused
    final curDuration = currentSentenceTiming.durationMs;
    if (curDuration > 0) {
      _sentenceProgress = (_sentenceElapsedMs / curDuration).clamp(0.0, 1.0);
    }
    notifyListeners();
  }

  /// Start practice with a 3-second countdown and audio recording.
  Future<void> start() async {
    _status = PacerStatus.countdown;
    _countdownSeconds = 3;
    _currentIndex = 0;
    _sentenceElapsedMs = 0;
    _sentenceProgress = 0.0;
    _totalElapsedMs = 0;
    _errorMessage = null;
    notifyListeners();

    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      _countdownSeconds--;
      if (_countdownSeconds <= 0) {
        timer.cancel();
        await _beginPractice();
      } else {
        notifyListeners();
      }
    });
  }

  Future<void> _beginPractice() async {
    await _startRecording();
    _status = PacerStatus.running;
    _startTicker();
    notifyListeners();
  }

  AudioRecorder _getRecorder() => _recorder ??= AudioRecorder();

  Future<void> _startRecording() async {
    if (!enableAudioRecording) return;
    try {
      final recorder = _getRecorder();
      final status = await Permission.microphone.request();
      final hasPermission = status.isGranted || await recorder.hasPermission();
      if (!hasPermission) {
        _errorMessage = 'Microphone permission not granted (practice will continue without voice capture).';
        _safeNotifyListeners();
        return;
      }

      final tempDir = await getTemporaryDirectory();
      final path = '${tempDir.path}/pacer-${DateTime.now().millisecondsSinceEpoch}.m4a';
      await recorder.start(
        const RecordConfig(encoder: AudioEncoder.aacLc),
        path: path,
      );
      _recordedAudioPath = path;
    } catch (e) {
      debugPrint('Recording error: $e');
    }
  }

  Future<void> _stopRecording() async {
    if (!enableAudioRecording || _recorder == null) return;
    try {
      if (await _recorder!.isRecording()) {
        final path = await _recorder!.stop();
        if (path != null) {
          _recordedAudioPath = path;
        }
      }
    } catch (e) {
      debugPrint('Stop recording error: $e');
    }
  }

  void _safeNotifyListeners() {
    if (!_isDisposed) {
      notifyListeners();
    }
  }

  void _startTicker() {
    _tickerTimer?.cancel();
    const intervalMs = 50; // Smooth 20fps ticker for progress bar
    _tickerTimer = Timer.periodic(const Duration(milliseconds: intervalMs), (_) {
      if (_status != PacerStatus.running) return;

      _sentenceElapsedMs += intervalMs;
      _totalElapsedMs += intervalMs;

      final currentTargetDuration = currentSentenceTiming.durationMs;
      _sentenceProgress = (_sentenceElapsedMs / currentTargetDuration).clamp(0.0, 1.0);

      if (_sentenceElapsedMs >= currentTargetDuration) {
        _onSentenceFinished();
      } else {
        notifyListeners();
      }
    });
  }

  void _onSentenceFinished() {
    if (_currentIndex < totalSentences - 1) {
      _currentIndex++;
      _sentenceElapsedMs = 0;
      _sentenceProgress = 0.0;
      notifyListeners();
    } else {
      finish();
    }
  }

  void pause() {
    if (_status != PacerStatus.running) return;
    _status = PacerStatus.paused;
    _tickerTimer?.cancel();
    try {
      _recorder?.pause();
    } catch (_) {}
    _safeNotifyListeners();
  }

  void resume() {
    if (_status != PacerStatus.paused) return;
    _status = PacerStatus.running;
    _startTicker();
    try {
      _recorder?.resume();
    } catch (_) {}
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
      notifyListeners();
    } else {
      finish();
    }
  }

  void previousSentence() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _sentenceElapsedMs = 0;
      _sentenceProgress = 0.0;
      notifyListeners();
    } else {
      _sentenceElapsedMs = 0;
      _sentenceProgress = 0.0;
      notifyListeners();
    }
  }

  void jumpToSentence(int index) {
    if (index < 0 || index >= totalSentences) return;
    _currentIndex = index;
    _sentenceElapsedMs = 0;
    _sentenceProgress = 0.0;
    notifyListeners();
  }

  Future<void> finish() async {
    _tickerTimer?.cancel();
    _countdownTimer?.cancel();
    _status = PacerStatus.completed;
    _sentenceProgress = 1.0;
    await _stopRecording();
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
    await _stopRecording();
    _safeNotifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    _tickerTimer?.cancel();
    _countdownTimer?.cancel();
    _stopRecording();
    _recorder?.dispose();
    super.dispose();
  }
}
