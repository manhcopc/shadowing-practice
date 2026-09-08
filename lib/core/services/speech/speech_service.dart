import 'package:flutter/foundation.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechService {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  // Cờ để kiểm soát việc nhận kết quả
  bool _shouldProcessResults = true;

  // Callback để cập nhật UI khi có kết quả từ speech recognition
  final Function(String) onResult;

  // Callback để thông báo trạng thái đang nghe
  final Function(bool) onListening;

  SpeechService({required this.onResult, required this.onListening});

  Future<void> initialize() async {
    _speechEnabled = await _speechToText.initialize(
      onStatus: (status) {
        if (kDebugMode) {
          print('Speech recognition status: $status');
        }

        // Cập nhật trạng thái đang nghe
        onListening(_speechToText.isListening);
      },
      onError: (errorNotification) {
        if (kDebugMode) {
          print('Speech recognition error: $errorNotification');
        }

        // Thông báo đã dừng nghe khi có lỗi
        onListening(false);
      },
    );
  }

  // Phương thức bắt đầu nghe
  Future<void> startListening() async {
    if (!_speechEnabled) {
      await initialize();
    }

    _shouldProcessResults = true;
    _lastWords = '';
    await _speechToText.listen(
      onResult: _onSpeechResult,
      listenOptions: SpeechListenOptions(
        localeId: 'vi_VN',
        pauseFor: const Duration(seconds: 3),
      ),
    );

    // Thông báo đang nghe
    onListening(_speechToText.isListening);
  }

  // Phương thức dừng nghe
  Future<void> stopListening() async {
    // Đặt cờ để ngăn xử lý kết quả mới sau khi dừng
    _shouldProcessResults = false;

    await _speechToText.stop();

    // Thông báo đã dừng nghe
    onListening(false);
  }

  // Xử lý kết quả nhận dạng giọng nói
  void _onSpeechResult(SpeechRecognitionResult result) {
    // Chỉ xử lý kết quả nếu cờ _shouldProcessResults là true
    if (_shouldProcessResults) {
      _lastWords = result.recognizedWords;

      // Gọi callback khi có kết quả, bất kể kết quả là tạm thời hay cuối cùng
      onResult(_lastWords);
    }
  }

  // Kiểm tra xem có đang nghe hay không
  bool get isListening => _speechToText.isListening;

  // Kiểm tra xem speech recognition có được hỗ trợ không
  bool get isEnabled => _speechEnabled;
}
