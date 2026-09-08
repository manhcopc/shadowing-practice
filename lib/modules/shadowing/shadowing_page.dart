import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

import '../../core/app/app_router.dart';
import '../echo_foundation/echo_theme.dart';
import '../echo_foundation/mock_echo_repository.dart';
import '../echo_foundation/widgets.dart';
import 'audio_player_widget.dart';
import 'shadow_session_state.dart';

@RoutePage()
class ShadowingPage extends StatefulWidget {
  const ShadowingPage({super.key, required this.sentenceId});
  final String sentenceId;

  @override
  State<ShadowingPage> createState() => _ShadowingPageState();
}

class _ShadowingPageState extends State<ShadowingPage> {
  final _recorder = AudioRecorder();
  final _nativePlayer = AudioPlayer();
  Timer? _recordingTimer;
  Timer? _amplitudeTimer;
  ShadowSessionState _state = const ShadowSessionState.initial();

  @override
  void dispose() {
    _recordingTimer?.cancel();
    _amplitudeTimer?.cancel();
    _nativePlayer.dispose();
    unawaited(_stopRecorderIfNeeded());
    _recorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sentence = const MockEchoRepository().findSentence(widget.sentenceId);
    final lesson =
        const MockEchoRepository().lessonForSentence(widget.sentenceId);
    if (sentence == null || lesson == null) {
      return const EchoScaffold(
        child: Center(child: Text('Sentence not found')),
      );
    }
    return EchoScaffold(
      appBar: AppBar(
        title: const Text('Shadow now'),
        backgroundColor: EchoColors.background,
      ),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            '${sentence.order} / ${lesson.sentences.length}',
            style: const TextStyle(color: EchoColors.secondaryText),
          ),
          const SizedBox(height: 12),
          Text(
            sentence.text,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
              color: EchoColors.darkText,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Listen, then repeat naturally.',
            style: TextStyle(color: EchoColors.secondaryText),
          ),
          const SizedBox(height: 18),
          _ModeSelector(
            mode: _state.mode,
            onChanged: _sessionIsBusy
                ? null
                : (mode) => setState(
                      () => _state = _state.copyWith(mode: mode),
                    ),
          ),
          if (_state.mode == ShadowMode.delayedShadow) ...[
            const SizedBox(height: 14),
            SegmentedButton<Duration>(
              segments: const [
                ButtonSegment(
                  value: Duration(seconds: 1),
                  label: Text('1.0s'),
                ),
                ButtonSegment(
                  value: Duration(milliseconds: 1500),
                  label: Text('1.5s'),
                ),
                ButtonSegment(
                  value: Duration(seconds: 2),
                  label: Text('2.0s'),
                ),
              ],
              selected: {_state.delay},
              onSelectionChanged: (value) => setState(
                () => _state = _state.copyWith(delay: value.first),
              ),
            ),
          ],
          const SizedBox(height: 18),
          const EchoSectionTitle('Native audio'),
          const SizedBox(height: 10),
          EchoCard(child: EchoAudioPlayerWidget(duration: sentence.duration)),
          const SizedBox(height: 18),
          const EchoSectionTitle('Your voice'),
          const SizedBox(height: 10),
          EchoCard(
            child: Column(
              children: [
                _SessionStatusHeader(state: _state),
                const SizedBox(height: 14),
                _AmplitudeRing(
                  state: _state,
                  onTap: _state.status == ShadowSessionStatus.recording
                      ? _stopRecording
                      : () => _startSession(sentence.duration),
                ),
                if (_state.errorMessage != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    _state.errorMessage!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => openAppSettings(),
                          child: const Text('Open Settings'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: FilledButton(
                          onPressed: () => _startSession(sentence.duration),
                          child: const Text('Try again'),
                        ),
                      ),
                    ],
                  ),
                ],
                if (_state.canFinish) ...[
                  const SizedBox(height: 16),
                  EchoAudioPlayerWidget(
                    key: ValueKey(_state.recordingPath),
                    duration: _state.recordingDuration,
                    filePath: _state.recordingPath,
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed:
                      _state.status == ShadowSessionStatus.recording
                          ? null
                          : () => _playNative(sentence.duration),
                  icon: const Icon(Icons.replay_rounded),
                  label: const Text('Replay'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _state.status == ShadowSessionStatus.recording
                      ? _stopRecording
                      : null,
                  icon: const Icon(Icons.stop_rounded),
                  label: const Text('Stop'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => context.router.pop(),
                  icon: const Icon(Icons.skip_next_rounded),
                  label: const Text('Skip'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          EchoGradientButton(
            label: _state.status == ShadowSessionStatus.idle
                ? 'Start session'
                : 'Finish attempt',
            icon: _state.status == ShadowSessionStatus.idle
                ? Icons.play_arrow_rounded
                : Icons.check_rounded,
            onPressed: _state.status == ShadowSessionStatus.idle
                ? () => _startSession(sentence.duration)
                : _state.canFinish
                    ? () => context.router.push(
                          ResultRoute(
                            sentenceId: widget.sentenceId,
                            recordingPath: _state.recordingPath,
                            recordingDurationMs:
                                _state.recordingDuration.inMilliseconds,
                          ),
                        )
                    : null,
          ),
        ],
      ),
    );
  }

  bool get _sessionIsBusy =>
      _state.status == ShadowSessionStatus.preparing ||
      _state.status == ShadowSessionStatus.playingNative ||
      _state.status == ShadowSessionStatus.waitingForUser ||
      _state.status == ShadowSessionStatus.recording ||
      _state.status == ShadowSessionStatus.processing;

  Future<void> _startSession(Duration nativeDuration) async {
    await _nativePlayer.stop();
    setState(
      () => _state = _state.copyWith(
        status: ShadowSessionStatus.preparing,
        errorMessage: null,
        recordingPath: null,
      ),
    );
    switch (_state.mode) {
      case ShadowMode.repeat:
        await _playNative(nativeDuration);
        if (!mounted) return;
        setState(
          () => _state = _state.copyWith(status: ShadowSessionStatus.waitingForUser),
        );
        await _runCountdown();
        await _startRecording();
      case ShadowMode.delayedShadow:
        unawaited(_playNative(nativeDuration));
        await Future<void>.delayed(_state.delay);
        await _runCountdown(compact: true);
        await _startRecording();
      case ShadowMode.realTimeShadow:
        unawaited(_playNative(nativeDuration));
        await _startRecording();
    }
  }

  Future<void> _playNative(Duration duration) async {
    try {
      final path = await EchoMockAudio.ensureMockAudioFile(duration);
      await _nativePlayer.setFilePath(path);
      await _nativePlayer.seek(Duration.zero);
      if (mounted) {
        setState(
          () => _state = _state.copyWith(status: ShadowSessionStatus.playingNative),
        );
      }
      final completed = _nativePlayer.playerStateStream.firstWhere(
        (state) => state.processingState == ProcessingState.completed,
      );
      unawaited(_nativePlayer.play());
      await completed;
      if (mounted && _state.status == ShadowSessionStatus.playingNative) {
        setState(() => _state = _state.copyWith(status: ShadowSessionStatus.idle));
      }
    } catch (_) {
      if (mounted) {
        setState(
          () => _state = _state.copyWith(
            status: ShadowSessionStatus.error,
            errorMessage: 'Audio unavailable. Please try again.',
          ),
        );
      }
    }
  }

  Future<void> _runCountdown({bool compact = false}) async {
    for (final value in compact ? const [1] : const [3, 2, 1]) {
      if (!mounted) return;
      setState(
        () => _state = _state.copyWith(
          status: ShadowSessionStatus.waitingForUser,
          countdown: value,
        ),
      );
      await Future<void>.delayed(const Duration(seconds: 1));
    }
    if (mounted) setState(() => _state = _state.copyWith(countdown: null));
  }

  Future<void> _startRecording() async {
    final status = await Permission.microphone.request();
    final granted = status.isGranted || await _recorder.hasPermission();
    if (!granted) {
      setState(
        () => _state = _state.copyWith(
          status: ShadowSessionStatus.error,
          errorMessage: status.isPermanentlyDenied
              ? 'Microphone access is blocked. Enable it in Settings to practice shadowing.'
              : 'Microphone access is required to practice shadowing.',
        ),
      );
      return;
    }
    try {
      final tempDir = await getTemporaryDirectory();
      final path =
          '${tempDir.path}/echo-${DateTime.now().millisecondsSinceEpoch}.m4a';
      await _recorder.start(
        const RecordConfig(encoder: AudioEncoder.aacLc),
        path: path,
      );
      _recordingTimer?.cancel();
      _amplitudeTimer?.cancel();
      setState(
        () => _state = _state.copyWith(
          status: ShadowSessionStatus.recording,
          recordingPath: path,
          recordingDuration: Duration.zero,
          amplitude: 0.2,
        ),
      );
      _recordingTimer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (!mounted) return;
        setState(
          () => _state = _state.copyWith(
            recordingDuration:
                _state.recordingDuration + const Duration(seconds: 1),
          ),
        );
      });
      _amplitudeTimer =
          Timer.periodic(const Duration(milliseconds: 180), (_) async {
        try {
          final amplitude = await _recorder.getAmplitude();
          if (!mounted) return;
          final normalized = ((amplitude.current + 60) / 60).clamp(0.05, 1.0);
          setState(() => _state = _state.copyWith(amplitude: normalized));
        } catch (_) {
          if (mounted) setState(() => _state = _state.copyWith(amplitude: 0.25));
        }
      });
    } catch (_) {
      if (mounted) {
        setState(
          () => _state = _state.copyWith(
            status: ShadowSessionStatus.error,
            errorMessage: 'Recording unavailable. Please try again.',
          ),
        );
      }
    }
  }

  Future<void> _stopRecording() async {
    try {
      _recordingTimer?.cancel();
      _amplitudeTimer?.cancel();
      final path = await _recorder.stop();
      if (!mounted) return;
      setState(
        () => _state = _state.copyWith(
          status: ShadowSessionStatus.completed,
          recordingPath: path ?? _state.recordingPath,
          recordingDuration: _state.recordingDuration == Duration.zero
              ? const Duration(seconds: 1)
              : _state.recordingDuration,
          amplitude: 0,
        ),
      );
    } catch (_) {
      if (mounted) {
        setState(
          () => _state = _state.copyWith(
            status: ShadowSessionStatus.error,
            errorMessage: 'Could not save this recording.',
          ),
        );
      }
    }
  }

  Future<void> _stopRecorderIfNeeded() async {
    try {
      if (await _recorder.isRecording()) {
        await _recorder.stop();
      }
    } catch (_) {}
  }
}

class _ModeSelector extends StatelessWidget {
  const _ModeSelector({required this.mode, required this.onChanged});

  final ShadowMode mode;
  final ValueChanged<ShadowMode>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<ShadowMode>(
      segments: const [
        ButtonSegment(value: ShadowMode.repeat, label: Text('Repeat')),
        ButtonSegment(value: ShadowMode.delayedShadow, label: Text('Delayed')),
        ButtonSegment(
          value: ShadowMode.realTimeShadow,
          label: Text('Real-time'),
          icon: Icon(Icons.science_rounded),
        ),
      ],
      selected: {mode},
      onSelectionChanged:
          onChanged == null ? null : (value) => onChanged!(value.first),
    );
  }
}

class _SessionStatusHeader extends StatelessWidget {
  const _SessionStatusHeader({required this.state});

  final ShadowSessionState state;

  @override
  Widget build(BuildContext context) {
    final countdown = state.countdown;
    if (countdown != null) {
      return Text(
        '$countdown',
        style: const TextStyle(
          fontSize: 42,
          fontWeight: FontWeight.w900,
          color: EchoColors.primaryBlue,
        ),
      );
    }
    return Column(
      children: [
        Text(
          _title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: EchoColors.darkText,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          _subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(color: EchoColors.secondaryText),
        ),
      ],
    );
  }

  String get _title {
    return switch (state.status) {
      ShadowSessionStatus.idle => 'Ready',
      ShadowSessionStatus.preparing => 'Preparing',
      ShadowSessionStatus.playingNative => 'Playing reference',
      ShadowSessionStatus.waitingForUser => 'Ready?',
      ShadowSessionStatus.recording => _format(state.recordingDuration),
      ShadowSessionStatus.paused => 'Paused',
      ShadowSessionStatus.processing => 'Processing',
      ShadowSessionStatus.completed => 'Recorded',
      ShadowSessionStatus.error => 'Needs attention',
    };
  }

  String get _subtitle {
    return switch (state.mode) {
      ShadowMode.repeat => 'Listen first, then record after the countdown.',
      ShadowMode.delayedShadow =>
        'Recording starts after ${state.delay.inMilliseconds / 1000}s.',
      ShadowMode.realTimeShadow =>
        'Experimental: audio and recording start together.',
    };
  }

  String _format(Duration duration) =>
      '0:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}';
}

class _AmplitudeRing extends StatelessWidget {
  const _AmplitudeRing({required this.state, required this.onTap});

  final ShadowSessionState state;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final recording = state.status == ShadowSessionStatus.recording;
    final scale = recording ? 1 + state.amplitude * 0.22 : 1.0;
    return Semantics(
      button: true,
      label: recording ? 'Stop recording' : 'Start shadowing session',
      child: InkWell(
        borderRadius: BorderRadius.circular(58),
        onTap: onTap,
        child: AnimatedScale(
          duration: const Duration(milliseconds: 160),
          scale: scale,
          child: Container(
            width: 104,
            height: 104,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: EchoTheme.gradient,
              boxShadow: [
                BoxShadow(
                  color: EchoColors.primaryBlue.withValues(
                    alpha: recording ? 0.28 : 0.16,
                  ),
                  blurRadius: recording ? 32 : 18,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Icon(
              recording ? Icons.stop_rounded : Icons.mic_rounded,
              color: Colors.white,
              size: 44,
            ),
          ),
        ),
      ),
    );
  }
}
