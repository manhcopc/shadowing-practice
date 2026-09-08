import 'package:injectable/injectable.dart';
import 'package:result_dart/result_dart.dart';

import '../../../core/services/api_service/api_service.dart';

import '../../../core/services/api_service/api_error.dart';
import '../../../data/local/shared_prefs/storage.dart';
import '../../profile/models/user_model.dart';
import '../api/auth_service.dart';
import '../models/request/login_request.dart';
import '../models/request/refresh_token_request.dart';
import '../models/request/signup_request.dart';
import '../models/response/base_response.dart';
import '../models/response/login_response.dart';
import '../models/response/refresh_token_response.dart';

@LazySingleton()
class AuthRepository {
  final AuthService _authClient;

  UserModel? _currentUser;

  AuthRepository(this._authClient);

  Future<Result<LoginResponse, ApiError>> login({
    required LoginRequest request,
  }) async {
    return _authClient.login(request).tryGet((response) => response.data);
  }

  Future<Result<BaseResponse, ApiError>> signup({
    required SignUpRequest request,
  }) async {
    return _authClient.signup(request).tryGet((response) => response);
  }

  Future<Result<RefreshTokenResponse, ApiError>> refreshToken(
    RefreshTokenRequest requestRefreshToken,
  ) async {
    return _authClient
        .refreshToken(requestRefreshToken)
        .tryGet((response) => response.data);
  }

  Future<void> logout() async {
    await Storage.clearInfoUser();
  }

  UserModel? getUser() => Storage.user;

  Future<String?> getAccessToken() => Storage.getAccessToken();

  Future<String?> getRefreshToken() => Storage.getRefreshToken();

  Future<void> saveToken(String accessToken, String refreshToken) async {
    await Storage.setAccessToken(accessToken);
    await Storage.setRefreshToken(refreshToken);
  }

  Future<void> saveUserInfo(UserModel user) async {
    await Storage.setUser(user);
  }
}
