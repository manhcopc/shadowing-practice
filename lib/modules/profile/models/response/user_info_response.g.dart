// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserInfoResponse _$UserInfoResponseFromJson(Map<String, dynamic> json) =>
    _UserInfoResponse(
      userInfo: json['userInfo'] == null
          ? const UserModel()
          : UserModel.fromJson(json['userInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserInfoResponseToJson(_UserInfoResponse instance) =>
    <String, dynamic>{'userInfo': instance.userInfo.toJson()};
