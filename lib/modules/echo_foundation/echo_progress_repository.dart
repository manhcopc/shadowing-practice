import '../../data/local/shared_prefs/storage.dart';
import 'models.dart';

class EchoProgressRepository {
  const EchoProgressRepository();

  EchoUserProfile getProfile() {
    return EchoUserProfile(
      id: Storage.deviceId,
      name: 'Echo Learner',
      targetLanguage: Storage.echoSelectedLanguage,
      level: Storage.echoSelectedLevel,
      weeklyGoalMinutes: Storage.echoWeeklyGoal,
      currentStreak: currentStreak,
      totalPracticeMinutes: totalPracticeMinutes,
    );
  }

  Map<String, double> get lessonProgress => Storage.echoLessonProgress;

  List<int> get recentScores => Storage.echoRecentScores;

  int get averageScore {
    final scores = recentScores;
    if (scores.isEmpty) return 0;
    return (scores.reduce((a, b) => a + b) / scores.length).round();
  }

  int get completedLessons =>
      lessonProgress.values.where((value) => value >= 1).length;

  int get totalPracticeMinutes => (totalAttempts * 45 / 60).ceil();

  int get totalAttempts => sentenceStats.fold<int>(
        0,
        (total, stats) => total + stats.attemptCount,
      );

  int get sentencesPracticed => sentenceStats.length;

  int get sentencesMastered =>
      sentenceStats.where((stats) => stats.bestScore >= 85).length;

  int get bestShadowScore {
    final stats = sentenceStats;
    if (stats.isEmpty) return 0;
    return stats.map((item) => item.bestScore).reduce((a, b) => a > b ? a : b);
  }

  int get weeklyPracticeMinutes => totalPracticeMinutes;

  int get weeklyGoalProgress {
    final goal = Storage.echoWeeklyGoal;
    if (goal <= 0) return 0;
    return ((weeklyPracticeMinutes / goal) * 100).round().clamp(0, 100);
  }

  int get currentStreak => _calculateCurrentStreak(Storage.echoPracticeDates);

  List<SentenceAttemptStats> get sentenceStats {
    return Storage.echoSentenceStats.entries.map((entry) {
      final value = entry.value as Map<String, dynamic>;
      return SentenceAttemptStats(
        sentenceId: entry.key,
        attemptCount: (value['attemptCount'] as num?)?.round() ?? 0,
        bestScore: (value['bestScore'] as num?)?.round() ?? 0,
        latestScore: (value['latestScore'] as num?)?.round() ?? 0,
        lastPracticedAt: DateTime.tryParse(value['lastPracticedAt']?.toString() ?? '') ?? DateTime.now(),
      );
    }).toList()
      ..sort((a, b) => b.lastPracticedAt.compareTo(a.lastPracticedAt));
  }

  SentenceAttemptStats? sentenceStatsFor(String sentenceId) {
    for (final stats in sentenceStats) {
      if (stats.sentenceId == sentenceId) return stats;
    }
    return null;
  }

  int? bestScoreForSentence(String sentenceId) =>
      sentenceStatsFor(sentenceId)?.bestScore;

  Future<void> completeSentence({
    required String lessonId,
    required int totalSentences,
    required int sentenceOrder,
    required int score,
    String? sentenceId,
  }) async {
    final progress = Map<String, double>.from(lessonProgress);
    progress[lessonId] = (sentenceOrder / totalSentences).clamp(0, 1);
    await Storage.setEchoLessonProgress(progress);
    final scores = [score, ...recentScores].take(10).toList();
    await Storage.setEchoRecentScores(scores);
    if (sentenceId != null) {
      await _updateSentenceStats(sentenceId: sentenceId, score: score);
      await _markPracticeToday();
    }
  }

  Future<void> saveOnboarding({
    required String language,
    required String level,
    required int weeklyGoal,
  }) async {
    await Storage.setEchoSelectedLanguage(language);
    await Storage.setEchoSelectedLevel(level);
    await Storage.setEchoWeeklyGoal(weeklyGoal);
    await Storage.setEchoOnboardingCompleted(true);
  }

  Future<void> _updateSentenceStats({
    required String sentenceId,
    required int score,
  }) async {
    final stats = Map<String, dynamic>.from(Storage.echoSentenceStats);
    final existing = (stats[sentenceId] as Map?)?.cast<String, dynamic>();
    final attemptCount = ((existing?['attemptCount'] as num?)?.round() ?? 0) + 1;
    final bestScore = existing == null
        ? score
        : [score, (existing['bestScore'] as num?)?.round() ?? 0]
            .reduce((a, b) => a > b ? a : b);
    stats[sentenceId] = {
      'attemptCount': attemptCount,
      'bestScore': bestScore,
      'latestScore': score,
      'lastPracticedAt': DateTime.now().toIso8601String(),
    };
    await Storage.setEchoSentenceStats(stats);
  }

  Future<void> _markPracticeToday() async {
    final dates = Storage.echoPracticeDates.toSet();
    dates.add(_dateKey(DateTime.now()));
    await Storage.setEchoPracticeDates(dates.toList()..sort());
  }

  int _calculateCurrentStreak(List<String> dateKeys) {
    if (dateKeys.isEmpty) return 0;
    final practiced = dateKeys.toSet();
    var cursor = DateTime.now();
    var streak = 0;
    while (practiced.contains(_dateKey(cursor))) {
      streak++;
      cursor = cursor.subtract(const Duration(days: 1));
    }
    return streak;
  }

  String _dateKey(DateTime date) {
    final local = date.toLocal();
    return '${local.year.toString().padLeft(4, '0')}-'
        '${local.month.toString().padLeft(2, '0')}-'
        '${local.day.toString().padLeft(2, '0')}';
  }
}
