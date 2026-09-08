// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

import '../../../common/constants/api_constants.dart';
import '../../../common/constants/constants.dart';
import '../../../core/utils/logger.dart';
import '../models/request/refresh_token_request.dart';
import '../models/response/refresh_token_response.dart';

@LazySingleton()
class TokenRepository {
  // Hàm gửi yêu cầu POST và trả về RefreshTokenResponse
  Future<RefreshTokenResponse> getNewToken(RefreshTokenRequest request) async {
    final url = Uri.parse(
      AppConstants.baseUrlFunction + APIConstants.pathRefreshToken,
    );

    logger.d('Refresh token request: ${request.toJson()}');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'accept': '*/*',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(request.toJson()), // Encode to JSON string
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        logger.d('Refresh token response: $responseData');
        return RefreshTokenResponse.fromJson(responseData['data']);
      } else {
        throw Exception('Failed to refresh token: ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to refresh token: ${e.toString()}');
    }
  }
}
