import 'package:dio/dio.dart';

import '../../core/services/api_service/api_error.dart';


class ErrorInterceptor extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data is Map<String, dynamic>) {
      final error = response.data['error'];
      if (error != null) {
        throw ApiError.server(
          code: error['code'],
          message: error['message'],
        );
      }
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }
}
