import 'models.dart';
import 'local_shadow_scoring_service.dart';
import 'speech_recognition_service.dart';

abstract class PronunciationService {
  Future<ShadowAttempt> analyzeAttempt({
    required String sentenceId,
    required String targetText,
    required Duration nativeDuration,
    required String? recordingPath,
    required Duration recordingDuration,
    int? previousBestScore,
  });
}

class MockPronunciationService implements PronunciationService {
  const MockPronunciationService();

  @override
  Future<ShadowAttempt> analyzeAttempt({
    required String sentenceId,
    required String targetText,
    required Duration nativeDuration,
    required String? recordingPath,
    required Duration recordingDuration,
    int? previousBestScore,
  }) async {
    final recognition = await const MockSpeechRecognitionService().transcribeAudio(
      audioPath: recordingPath ?? '',
      targetText: targetText,
      recordingDuration: recordingDuration,
    );
    return const LocalShadowScoringService().score(
      sentenceId: sentenceId,
      targetText: targetText,
      nativeDuration: nativeDuration,
      recordingPath: recordingPath,
      recognition: recognition,
      previousBestScore: previousBestScore,
    );
  }
}
