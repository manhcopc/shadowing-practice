// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    _LoginResponse(
      userInfo: json['userInfo'] == null
          ? const UserModel()
          : UserModel.fromJson(json['userInfo'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? const MetaDataUser()
          : MetaDataUser.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(_LoginResponse instance) =>
    <String, dynamic>{
      'userInfo': instance.userInfo.toJson(),
      'meta': instance.meta.toJson(),
    };
