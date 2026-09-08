import 'package:dio/dio.dart';

import '../../core/locators/locator.dart';

/// Interceptor to log Dio requests as cURL commands
class CurlLoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final curlCommand = _generateCurlCommand(options);
    talker.info(
      '━━━━━━━ cURL Command ━━━━━━━\n$curlCommand\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━',
    );
    super.onRequest(options, handler);
  }

  String _generateCurlCommand(RequestOptions options) {
    final buffer = StringBuffer();
    buffer.write('curl -X ${options.method}');

    // Add headers
    options.headers.forEach((key, value) {
      buffer.write(' -H "$key: $value"');
    });

    // Add URL
    final uri = options.uri;
    buffer.write(' "${uri.toString()}"');

    // Add body/data
    if (options.data != null) {
      if (options.data is FormData) {
        final formData = options.data as FormData;

        // Add form fields
        for (final field in formData.fields) {
          buffer.write(' -F "${field.key}=${field.value}"');
        }

        // Add files
        for (final file in formData.files) {
          final multipartFile = file.value;
          buffer.write(
            ' -F "${file.key}=@${multipartFile.filename ?? 'file'}"',
          );
        }
      } else if (options.data is Map) {
        buffer.write(' -d \'${options.data}\'');
      } else {
        buffer.write(' -d \'${options.data.toString()}\'');
      }
    }

    return buffer.toString();
  }
}
