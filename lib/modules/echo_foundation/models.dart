class EchoUserProfile {
  const EchoUserProfile({
    required this.id,
    required this.name,
    required this.targetLanguage,
    required this.level,
    required this.weeklyGoalMinutes,
    required this.currentStreak,
    required this.totalPracticeMinutes,
  });

  final String id;
  final String name;
  final String targetLanguage;
  final String level;
  final int weeklyGoalMinutes;
  final int currentStreak;
  final int totalPracticeMinutes;
}

class Course {
  const Course({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.thumbnail,
    required this.progress,
    required this.totalLessons,
  });

  final String id;
  final String title;
  final String description;
  final String category;
  final String thumbnail;
  final double progress;
  final int totalLessons;
}

class Lesson {
  const Lesson({
    required this.id,
    required this.courseId,
    required this.title,
    required this.description,
    required this.order,
    required this.isLocked,
    required this.isCompleted,
    required this.progress,
    required this.sentences,
  });

  final String id;
  final String courseId;
  final String title;
  final String description;
  final int order;
  final bool isLocked;
  final bool isCompleted;
  final double progress;
  final List<ShadowSentence> sentences;
}

class ShadowSentence {
  const ShadowSentence({
    required this.id,
    required this.lessonId,
    required this.text,
    required this.translation,
    required this.audioPath,
    required this.duration,
    required this.vocabulary,
    required this.order,
    this.segments = const [],
  });

  final String id;
  final String lessonId;
  final String text;
  final String translation;
  final String audioPath;
  final Duration duration;
  final List<VocabularyItem> vocabulary;
  final int order;
  final List<SentenceSegment> segments;
}

class SentenceSegment {
  const SentenceSegment({
    required this.startMs,
    required this.endMs,
    required this.text,
  });

  final int startMs;
  final int endMs;
  final String text;
}

class VocabularyItem {
  const VocabularyItem({
    required this.word,
    required this.type,
    required this.meaning,
    this.audioPath,
  });

  final String word;
  final String type;
  final String meaning;
  final String? audioPath;
}

class ShadowAttempt {
  const ShadowAttempt({
    required this.id,
    required this.sentenceId,
    required this.recordingPath,
    required this.createdAt,
    required this.durationMs,
    required this.transcript,
    required this.speechRecognitionConfidence,
    required this.wordsMatchedScore,
    required this.timingScore,
    required this.pacingScore,
    required this.completionScore,
    required this.overallShadowScore,
    required this.feedback,
    required this.wordFeedback,
    required this.comparison,
    required this.engineType,
    this.previousBestScore,
  });

  final String id;
  final String sentenceId;
  final String? recordingPath;
  final DateTime createdAt;
  final int durationMs;
  final String transcript;
  final double speechRecognitionConfidence;
  final int wordsMatchedScore;
  final int timingScore;
  final int pacingScore;
  final int completionScore;
  final int overallShadowScore;
  final String feedback;
  final Map<String, String> wordFeedback;
  final List<WordComparison> comparison;
  final PronunciationEngineType engineType;
  final int? previousBestScore;

  int? get improvement {
    final previous = previousBestScore;
    if (previous == null) return null;
    return overallShadowScore - previous;
  }
}

enum PronunciationEngineType { mock, localHeuristic, remote }

enum WordComparisonStatus { correct, incorrect, missing, extra }

class WordComparison {
  const WordComparison({
    required this.targetWord,
    required this.spokenWord,
    required this.status,
    required this.index,
  });

  final String? targetWord;
  final String? spokenWord;
  final WordComparisonStatus status;
  final int index;
}

class SpeechRecognitionResult {
  const SpeechRecognitionResult({
    required this.transcript,
    required this.confidence,
    required this.duration,
    this.words = const [],
  });

  final String transcript;
  final double confidence;
  final Duration duration;
  final List<String> words;
}

class SentenceAttemptStats {
  const SentenceAttemptStats({
    required this.sentenceId,
    required this.attemptCount,
    required this.bestScore,
    required this.latestScore,
    required this.lastPracticedAt,
  });

  final String sentenceId;
  final int attemptCount;
  final int bestScore;
  final int latestScore;
  final DateTime lastPracticedAt;

  String get mastery {
    if (bestScore >= 85) return 'Mastered';
    if (bestScore >= 70) return 'Good';
    return 'Needs practice';
  }
}

class PracticeSession {
  const PracticeSession({
    required this.id,
    required this.startedAt,
    required this.endedAt,
    required this.durationSeconds,
    required this.courseId,
    required this.lessonId,
    required this.sentencesPracticed,
    required this.averageScore,
    required this.bestImprovement,
  });

  final String id;
  final DateTime startedAt;
  final DateTime endedAt;
  final int durationSeconds;
  final String courseId;
  final String lessonId;
  final int sentencesPracticed;
  final int averageScore;
  final int bestImprovement;
}
