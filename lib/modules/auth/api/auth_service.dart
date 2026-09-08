import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../common/constants/api_constants.dart';
import '../../../core/services/api_service/api_response.dart';
import '../models/request/login_request.dart';
import '../models/request/refresh_token_request.dart';
import '../models/request/signup_request.dart';
import '../models/response/base_response.dart';
import '../models/response/login_response.dart';
import '../models/response/refresh_token_response.dart';

part 'auth_service.g.dart';

@RestApi()
@injectable
abstract class AuthService {
  @factoryMethod
  factory AuthService(@Named('baseDioClient') Dio dio) = _AuthService;

  @POST(APIConstants.pathLogin)
  Future<SingleApiResponse<LoginResponse>> login(@Body() LoginRequest request);

  @POST(APIConstants.pathSignUp)
  Future<BaseResponse> signup(@Body() SignUpRequest request);

  @POST(APIConstants.pathRefreshToken)
  Future<SingleApiResponse<RefreshTokenResponse>> refreshToken(
    @Body() RefreshTokenRequest requestRefreshToken,
  );
}
