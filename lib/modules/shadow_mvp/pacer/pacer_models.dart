import '../models/shadow_mvp_models.dart';

enum PacerMode {
  sentenceFocus('Từng câu'),
  teleprompter('Cuộn tự động');

  const PacerMode(this.label);
  final String label;
}

enum PacerStatus {
  idle,
  countdown,
  running,
  paused,
  completed,
}

class PacerSentenceTiming {
  const PacerSentenceTiming({
    required this.sentence,
    required this.durationMs,
    required this.startMs,
    required this.endMs,
    required this.wordCount,
  });

  final ShadowPassageSentence sentence;
  final int durationMs;
  final int startMs;
  final int endMs;
  final int wordCount;

  Duration get duration => Duration(milliseconds: durationMs);
}

class PacerPassageTiming {
  const PacerPassageTiming({
    required this.passage,
    required this.wpm,
    required this.sentenceTimings,
    required this.totalDurationMs,
  });

  final ShadowPassage passage;
  final int wpm;
  final List<PacerSentenceTiming> sentenceTimings;
  final int totalDurationMs;

  Duration get totalDuration => Duration(milliseconds: totalDurationMs);
}
