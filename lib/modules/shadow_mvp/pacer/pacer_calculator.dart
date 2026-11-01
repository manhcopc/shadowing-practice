import '../models/shadow_mvp_models.dart';
import 'pacer_models.dart';

class PacerCalculator {
  const PacerCalculator._();

  static const int minWpm = 60;
  static const int maxWpm = 240;
  static const int defaultWpm = 110;

  static const int pauseShortMs = 250; // comma, semicolon, dash
  static const int pauseSentenceEndMs = 500; // period, exclamation, question mark
  static const int minSentenceDurationMs = 1500; // Minimum time clamp

  /// Calculate the duration in milliseconds for a single sentence based on WPM
  /// and natural punctuation pauses.
  static int calculateSentenceDurationMs({
    required String text,
    required int wpm,
  }) {
    final clampedWpm = wpm.clamp(minWpm, maxWpm);
    final words = text.trim().split(RegExp(r'\s+')).where((w) => w.isNotEmpty).toList();
    final wordCount = words.length;

    if (wordCount == 0) return minSentenceDurationMs;

    final msPerWord = (60000.0 / clampedWpm).round();
    int totalMs = wordCount * msPerWord;

    // Add breathing pause for internal punctuation: commas, semicolons, dashes
    final shortPauses = RegExp(r'[,;—\-]').allMatches(text).length;
    totalMs += shortPauses * pauseShortMs;

    // Add breathing pause for sentence endings: periods, exclamation marks, question marks
    final endPauses = RegExp(r'[.!?]').allMatches(text).length;
    totalMs += endPauses * pauseSentenceEndMs;

    // Guarantee minimum readable duration
    return totalMs < minSentenceDurationMs ? minSentenceDurationMs : totalMs;
  }

  /// Build a complete timing plan for an entire passage at a given WPM.
  static PacerPassageTiming calculatePassageTiming({
    required ShadowPassage passage,
    required int wpm,
  }) {
    final clampedWpm = wpm.clamp(minWpm, maxWpm);
    final List<PacerSentenceTiming> timings = [];
    int currentOffsetMs = 0;

    for (final sentence in passage.sentences) {
      final words = sentence.text.trim().split(RegExp(r'\s+')).where((w) => w.isNotEmpty).toList();
      final durationMs = calculateSentenceDurationMs(
        text: sentence.text,
        wpm: clampedWpm,
      );

      final startMs = currentOffsetMs;
      final endMs = startMs + durationMs;

      timings.add(
        PacerSentenceTiming(
          sentence: sentence,
          durationMs: durationMs,
          startMs: startMs,
          endMs: endMs,
          wordCount: words.length,
        ),
      );

      currentOffsetMs = endMs;
    }

    return PacerPassageTiming(
      passage: passage,
      wpm: clampedWpm,
      sentenceTimings: timings,
      totalDurationMs: currentOffsetMs,
    );
  }

  /// Format milliseconds into human-readable mm:ss format.
  static String formatDurationMs(int ms) {
    final totalSeconds = (ms / 1000).round();
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
