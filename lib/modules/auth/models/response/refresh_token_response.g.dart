// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RefreshTokenResponse _$RefreshTokenResponseFromJson(
  Map<String, dynamic> json,
) => _RefreshTokenResponse(
  meta: json['meta'] == null
      ? const MetaDataUser()
      : MetaDataUser.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RefreshTokenResponseToJson(
  _RefreshTokenResponse instance,
) => <String, dynamic>{'meta': instance.meta.toJson()};
