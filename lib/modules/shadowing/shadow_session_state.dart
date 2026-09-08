enum ShadowMode { repeat, delayedShadow, realTimeShadow }

enum ShadowSessionStatus {
  idle,
  preparing,
  playingNative,
  waitingForUser,
  recording,
  paused,
  processing,
  completed,
  error,
}

class ShadowSessionState {
  const ShadowSessionState({
    required this.status,
    required this.mode,
    required this.delay,
    this.countdown,
    this.recordingPath,
    this.recordingDuration = Duration.zero,
    this.amplitude = 0,
    this.errorMessage,
  });

  const ShadowSessionState.initial()
      : status = ShadowSessionStatus.idle,
        mode = ShadowMode.delayedShadow,
        delay = const Duration(milliseconds: 1500),
        countdown = null,
        recordingPath = null,
        recordingDuration = Duration.zero,
        amplitude = 0,
        errorMessage = null;

  final ShadowSessionStatus status;
  final ShadowMode mode;
  final Duration delay;
  final int? countdown;
  final String? recordingPath;
  final Duration recordingDuration;
  final double amplitude;
  final String? errorMessage;

  bool get canFinish =>
      status == ShadowSessionStatus.completed && recordingPath != null;

  ShadowSessionState copyWith({
    ShadowSessionStatus? status,
    ShadowMode? mode,
    Duration? delay,
    Object? countdown = _sentinel,
    Object? recordingPath = _sentinel,
    Duration? recordingDuration,
    double? amplitude,
    Object? errorMessage = _sentinel,
  }) {
    return ShadowSessionState(
      status: status ?? this.status,
      mode: mode ?? this.mode,
      delay: delay ?? this.delay,
      countdown:
          countdown == _sentinel ? this.countdown : countdown as int?,
      recordingPath: recordingPath == _sentinel
          ? this.recordingPath
          : recordingPath as String?,
      recordingDuration: recordingDuration ?? this.recordingDuration,
      amplitude: amplitude ?? this.amplitude,
      errorMessage: errorMessage == _sentinel
          ? this.errorMessage
          : errorMessage as String?,
    );
  }
}

const _sentinel = Object();
