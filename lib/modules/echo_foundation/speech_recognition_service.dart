import 'models.dart';

abstract class SpeechRecognitionService {
  Future<SpeechRecognitionResult> transcribeAudio({
    required String audioPath,
    required String targetText,
    required Duration recordingDuration,
  });
}

class MockSpeechRecognitionService implements SpeechRecognitionService {
  const MockSpeechRecognitionService();

  @override
  Future<SpeechRecognitionResult> transcribeAudio({
    required String audioPath,
    required String targetText,
    required Duration recordingDuration,
  }) async {
    return SpeechRecognitionResult(
      transcript: _demoTranscript(targetText),
      confidence: 0.91,
      duration: recordingDuration,
    );
  }

  String _demoTranscript(String targetText) {
    if (targetText.toLowerCase().contains('could help me')) {
      return 'I was wondering if you can help me';
    }
    return targetText;
  }
}

class RealSpeechRecognitionService implements SpeechRecognitionService {
  const RealSpeechRecognitionService();

  @override
  Future<SpeechRecognitionResult> transcribeAudio({
    required String audioPath,
    required String targetText,
    required Duration recordingDuration,
  }) {
    throw UnimplementedError(
      'Real STT should run through a backend or Edge Function; do not put API secrets in Flutter.',
    );
  }
}
