import 'dart:math' as math;

import 'models.dart';
import 'transcript_comparison_service.dart';

class LocalShadowScoringService {
  const LocalShadowScoringService();

  ShadowAttempt score({
    required String sentenceId,
    required String targetText,
    required Duration nativeDuration,
    required String? recordingPath,
    required SpeechRecognitionResult recognition,
    required int? previousBestScore,
  }) {
    final comparisonService = const TranscriptComparisonService();
    final comparison = comparisonService.compare(
      target: targetText,
      spoken: recognition.transcript,
    );
    final wordsScore = comparisonService.wordsMatchedScore(comparison);
    final timingScore = _timingScore(nativeDuration, recognition.duration);
    final pacingScore = _pacingScore(
      targetText: targetText,
      transcript: recognition.transcript,
      nativeDuration: nativeDuration,
      userDuration: recognition.duration,
    );
    final completionScore = recognition.transcript.trim().isEmpty ? 0 : 100;
    final overall = (wordsScore * 0.45 +
            timingScore * 0.25 +
            pacingScore * 0.2 +
            completionScore * 0.1)
        .round()
        .clamp(0, 100);

    return ShadowAttempt(
      id: 'attempt-$sentenceId-${DateTime.now().millisecondsSinceEpoch}',
      sentenceId: sentenceId,
      recordingPath: recordingPath,
      createdAt: DateTime.now(),
      durationMs: recognition.duration.inMilliseconds,
      transcript: recognition.transcript,
      speechRecognitionConfidence: recognition.confidence,
      wordsMatchedScore: wordsScore,
      timingScore: timingScore,
      pacingScore: pacingScore,
      completionScore: completionScore,
      overallShadowScore: overall,
      feedback: _feedback(nativeDuration, recognition.duration, wordsScore),
      wordFeedback: _wordFeedback(comparison),
      comparison: comparison,
      engineType: PronunciationEngineType.localHeuristic,
      previousBestScore: previousBestScore,
    );
  }

  int _timingScore(Duration nativeDuration, Duration userDuration) {
    final nativeMs = nativeDuration.inMilliseconds.clamp(1, 60000);
    final diffRatio = (userDuration.inMilliseconds - nativeMs).abs() / nativeMs;
    return (100 - diffRatio * 85).round().clamp(45, 100);
  }

  int _pacingScore({
    required String targetText,
    required String transcript,
    required Duration nativeDuration,
    required Duration userDuration,
  }) {
    final targetRate = _wordCount(targetText) / math.max(1, nativeDuration.inSeconds);
    final userRate = _wordCount(transcript) / math.max(1, userDuration.inSeconds);
    final diffRatio = ((userRate - targetRate).abs() / math.max(0.1, targetRate));
    return (100 - diffRatio * 70).round().clamp(45, 100);
  }

  int _wordCount(String text) =>
      text.split(RegExp(r'\s+')).where((word) => word.trim().isNotEmpty).length;

  String _feedback(Duration nativeDuration, Duration userDuration, int wordsScore) {
    if (wordsScore < 70) {
      return 'Try to match the target words more closely before focusing on speed.';
    }
    final ratio = userDuration.inMilliseconds / nativeDuration.inMilliseconds;
    if (ratio > 1.25) {
      return "You're speaking a little slower than the reference. Keep the linking smoother.";
    }
    if (ratio < 0.75) {
      return "You're rushing the sentence. Slow down and keep each phrase connected.";
    }
    return 'Good pace. Keep matching the exact phrase and natural rhythm.';
  }

  Map<String, String> _wordFeedback(List<WordComparison> comparison) {
    final feedback = <String, String>{};
    for (final item in comparison) {
      if (item.status == WordComparisonStatus.incorrect &&
          item.targetWord != null &&
          item.spokenWord != null) {
        feedback[item.targetWord!] = 'You said "${item.spokenWord}"';
      }
      if (item.status == WordComparisonStatus.missing && item.targetWord != null) {
        feedback[item.targetWord!] = 'Missing word';
      }
    }
    return feedback;
  }
}
