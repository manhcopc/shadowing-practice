import 'package:dio/dio.dart';
import '../../modules/auth/models/request/refresh_token_request.dart';
import '/common/extensions/extensions.dart';

import '../../../core/locators/locator.dart';

import '../../../core/utils/logger.dart';

class AuthInterceptor extends QueuedInterceptorsWrapper {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await authRepository.getAccessToken();
    final refreshToken = await authRepository.getRefreshToken();

    if (accessToken == null ||
        refreshToken == null ||
        accessToken == "" ||
        refreshToken == "") {
      logger.i('INTERCEPTOR: Access token or refresh token is null');
      return super.onRequest(options, handler);
    }
    // Kiểm tra nếu accessToken đã hết hạn và không có quá trình làm mới đang diễn ra
    else if (accessToken.isTokenExpired()) {
      logger.i('INTERCEPTOR: Access token is expired');
      logger.i('INTERCEPTOR: Refreshing token...');
      final requestRefreshToken = RefreshTokenRequest(
        refreshToken: refreshToken,
      );
      try {
        final response = await tokenRepository.getNewToken(requestRefreshToken);
        authRepository.saveToken(
          response.meta.accessToken,
          response.meta.refreshToken,
        );
        logger.i('INTERCEPTOR: Token refreshed successfully');
        options.headers['Authorization'] =
            'Bearer ${response.meta.accessToken}';
        handler.next(options); // Tiếp tục xử lý yêu cầu với token mới
      } catch (e) {
        logger.e('INTERCEPTOR: Failed to refresh token: ${e.toString()}');
        handler.reject(
          DioException(
            requestOptions: options,
            error: 'Failed to refresh token: ${e.toString()}',
          ),
        );
      }
    } else {
      // Nếu `accessToken` hợp lệ hoặc đang làm mới, tiếp tục với `accessToken` hiện tại
      logger.i('INTERCEPTOR: Using current access token');
      options.headers['Authorization'] = 'Bearer $accessToken';
      return super.onRequest(options, handler);
    }
  }
}
