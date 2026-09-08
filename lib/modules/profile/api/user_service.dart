// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../common/constants/api_constants.dart';
import '../../../core/services/api_service/api_response.dart';
import '../models/response/user_info_response.dart';

part 'user_service.g.dart';

@RestApi()
@injectable
abstract class UserService {
  @factoryMethod
  factory UserService(@Named('baseDioClient') Dio dio) = _UserService;

  @GET(APIConstants.pathGetProfile)
  Future<SingleApiResponse<UserInfoResponse>> getProfile();
}
