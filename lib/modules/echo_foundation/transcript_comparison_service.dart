import 'dart:math' as math;

import 'models.dart';

class TranscriptComparisonService {
  const TranscriptComparisonService();

  List<WordComparison> compare({
    required String target,
    required String spoken,
  }) {
    final targetWords = _tokenize(target);
    final spokenWords = _tokenize(spoken);
    final maxLength = math.max(targetWords.length, spokenWords.length);
    final result = <WordComparison>[];

    for (var i = 0; i < maxLength; i++) {
      final targetWord = i < targetWords.length ? targetWords[i] : null;
      final spokenWord = i < spokenWords.length ? spokenWords[i] : null;
      WordComparisonStatus status;
      if (targetWord == null) {
        status = WordComparisonStatus.extra;
      } else if (spokenWord == null) {
        status = WordComparisonStatus.missing;
      } else if (targetWord == spokenWord) {
        status = WordComparisonStatus.correct;
      } else {
        status = WordComparisonStatus.incorrect;
      }
      result.add(
        WordComparison(
          targetWord: targetWord,
          spokenWord: spokenWord,
          status: status,
          index: i,
        ),
      );
    }
    return result;
  }

  int wordsMatchedScore(List<WordComparison> comparison) {
    final targetCount = comparison
        .where((item) => item.status != WordComparisonStatus.extra)
        .length;
    if (targetCount == 0) return 0;
    final correct = comparison
        .where((item) => item.status == WordComparisonStatus.correct)
        .length;
    return ((correct / targetCount) * 100).round().clamp(0, 100);
  }

  List<String> _tokenize(String input) {
    return input
        .toLowerCase()
        .replaceAll(RegExp(r"[^a-z0-9\s']"), '')
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .toList();
  }
}
