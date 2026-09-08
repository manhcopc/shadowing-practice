import 'package:injectable/injectable.dart';
import 'package:result_dart/result_dart.dart';
import '/core/services/api_service/api_service.dart';

import '../../../core/services/api_service/api_error.dart';
import '../api/user_service.dart';
import '../models/response/user_info_response.dart';

@LazySingleton()
class UserRepository {
  final UserService _userClient;

  UserRepository(this._userClient);

  Future<Result<UserInfoResponse, ApiError>> getProfile() async {
    return _userClient.getProfile().tryGet((response) => response.data);
  }
}
