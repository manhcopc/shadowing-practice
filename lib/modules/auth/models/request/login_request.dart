import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request.freezed.dart';
part 'login_request.g.dart';

@freezed
abstract class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    @Default('') String email,
    @Default('') String password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(dynamic json) => _$LoginRequestFromJson(json);
}

@freezed
abstract class LoginWithGoogleRequest with _$LoginWithGoogleRequest {
  const factory LoginWithGoogleRequest({@Default('') String serverAuthCode}) =
      _LoginWithGoogleRequest;

  factory LoginWithGoogleRequest.fromJson(dynamic json) =>
      _$LoginWithGoogleRequestFromJson(json);
}

@freezed
abstract class LoginWithAppleRequest with _$LoginWithAppleRequest {
  const factory LoginWithAppleRequest({
    @Default('') String serverAuthCode,
    @Default('') String rawNonce,
  }) = _LoginWithAppleRequest;

  factory LoginWithAppleRequest.fromJson(dynamic json) =>
      _$LoginWithAppleRequestFromJson(json);
}
