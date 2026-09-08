import 'package:flutter_test/flutter_test.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart' hide Storage;
import 'package:rvc_mobile_application/data/local/shared_prefs/storage.dart';
import 'package:rvc_mobile_application/modules/echo_foundation/echo_progress_repository.dart';
import 'package:rvc_mobile_application/modules/echo_foundation/local_shadow_scoring_service.dart';
import 'package:rvc_mobile_application/modules/echo_foundation/mock_echo_repository.dart';
import 'package:rvc_mobile_application/modules/echo_foundation/models.dart';
import 'package:rvc_mobile_application/modules/echo_foundation/pronunciation_service.dart';
import 'package:rvc_mobile_application/modules/echo_foundation/transcript_comparison_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await Storage.setup();
  });

  test('progress calculation averages daily lesson progress', () async {
    await Storage.setEchoLessonProgress({'daily-1': 1, 'daily-2': 0.5});
    final progress = MockEchoRepository.courseProgress(
      'daily-english',
      const EchoProgressRepository().lessonProgress,
    );
    expect(progress, closeTo(0.25, 0.001));
  });

  test('local persistence stores onboarding preferences', () async {
    await const EchoProgressRepository().saveOnboarding(
      language: 'English',
      level: 'Intermediate',
      weeklyGoal: 60,
    );
    expect(Storage.echoOnboardingCompleted, isTrue);
    expect(Storage.echoSelectedLevel, 'Intermediate');
    expect(Storage.echoWeeklyGoal, 60);
  });

  test('mock pronunciation service returns deterministic scores', () async {
    final service = const MockPronunciationService();
    final first = await service.analyzeAttempt(
      sentenceId: 'daily-3-s1',
      targetText: 'I was wondering if you could help me.',
      nativeDuration: const Duration(seconds: 4),
      recordingPath: null,
      recordingDuration: const Duration(seconds: 5),
    );
    final second = await service.analyzeAttempt(
      sentenceId: 'daily-3-s1',
      targetText: 'I was wondering if you could help me.',
      nativeDuration: const Duration(seconds: 4),
      recordingPath: null,
      recordingDuration: const Duration(seconds: 5),
    );
    expect(first.overallShadowScore, second.overallShadowScore);
    expect(first.wordsMatchedScore, 88);
  });

  test('transcript comparison marks changed words', () {
    final comparison = const TranscriptComparisonService().compare(
      target: 'I was wondering if you could help me.',
      spoken: 'I was wondering if you can help me.',
    );
    expect(comparison[5].status, WordComparisonStatus.incorrect);
    expect(comparison[5].targetWord, 'could');
    expect(comparison[5].spokenWord, 'can');
  });

  test('local shadow scoring separates words and timing', () {
    final result = const LocalShadowScoringService().score(
      sentenceId: 's1',
      targetText: 'I was wondering if you could help me.',
      nativeDuration: Duration(seconds: 4),
      recordingPath: null,
      recognition: SpeechRecognitionResult(
        transcript: 'I was wondering if you can help me',
        confidence: 0.91,
        duration: Duration(seconds: 5),
      ),
      previousBestScore: 72,
    );
    expect(result.engineType, PronunciationEngineType.localHeuristic);
    expect(result.improvement, greaterThan(0));
    expect(result.wordFeedback.containsKey('could'), isTrue);
  });
}
