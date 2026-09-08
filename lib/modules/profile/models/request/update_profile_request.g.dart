// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateProfileRequest _$UpdateProfileRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateProfileRequest(
  displayName: json['displayName'] as String? ?? '',
  username: json['username'] as String? ?? '',
  phone: json['phone'] as String? ?? '',
  gender: (json['gender'] as num?)?.toInt() ?? 0,
  file: json['file'] as String? ?? '',
);

Map<String, dynamic> _$UpdateProfileRequestToJson(
  _UpdateProfileRequest instance,
) => <String, dynamic>{
  'displayName': instance.displayName,
  'username': instance.username,
  'phone': instance.phone,
  'gender': instance.gender,
  'file': instance.file,
};
