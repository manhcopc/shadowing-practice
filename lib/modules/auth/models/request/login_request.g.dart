// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) =>
    _LoginRequest(
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
    );

Map<String, dynamic> _$LoginRequestToJson(_LoginRequest instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

_LoginWithGoogleRequest _$LoginWithGoogleRequestFromJson(
  Map<String, dynamic> json,
) => _LoginWithGoogleRequest(
  serverAuthCode: json['serverAuthCode'] as String? ?? '',
);

Map<String, dynamic> _$LoginWithGoogleRequestToJson(
  _LoginWithGoogleRequest instance,
) => <String, dynamic>{'serverAuthCode': instance.serverAuthCode};

_LoginWithAppleRequest _$LoginWithAppleRequestFromJson(
  Map<String, dynamic> json,
) => _LoginWithAppleRequest(
  serverAuthCode: json['serverAuthCode'] as String? ?? '',
  rawNonce: json['rawNonce'] as String? ?? '',
);

Map<String, dynamic> _$LoginWithAppleRequestToJson(
  _LoginWithAppleRequest instance,
) => <String, dynamic>{
  'serverAuthCode': instance.serverAuthCode,
  'rawNonce': instance.rawNonce,
};
