// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Plain _$PlainFromJson(Map<String, dynamic> json) => _Plain(
  code: (json['code'] as num?)?.toInt(),
  message: json['message'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$PlainToJson(_Plain instance) => <String, dynamic>{
  'code': instance.code,
  'message': instance.message,
  'runtimeType': instance.$type,
};

_Server _$ServerFromJson(Map<String, dynamic> json) => _Server(
  code: (json['code'] as num?)?.toInt(),
  message: json['message'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ServerToJson(_Server instance) => <String, dynamic>{
  'code': instance.code,
  'message': instance.message,
  'runtimeType': instance.$type,
};

_Network _$NetworkFromJson(Map<String, dynamic> json) => _Network(
  code: (json['code'] as num?)?.toInt(),
  message: json['message'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$NetworkToJson(_Network instance) => <String, dynamic>{
  'code': instance.code,
  'message': instance.message,
  'runtimeType': instance.$type,
};

_Internal _$InternalFromJson(Map<String, dynamic> json) =>
    _Internal(json['message'] as String, $type: json['runtimeType'] as String?);

Map<String, dynamic> _$InternalToJson(_Internal instance) => <String, dynamic>{
  'message': instance.message,
  'runtimeType': instance.$type,
};

_Cancelled _$CancelledFromJson(Map<String, dynamic> json) =>
    _Cancelled($type: json['runtimeType'] as String?);

Map<String, dynamic> _$CancelledToJson(_Cancelled instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

_Unexpected _$UnexpectedFromJson(Map<String, dynamic> json) =>
    _Unexpected($type: json['runtimeType'] as String?);

Map<String, dynamic> _$UnexpectedToJson(_Unexpected instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

_Unauthorized _$UnauthorizedFromJson(Map<String, dynamic> json) =>
    _Unauthorized(
      json['message'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$UnauthorizedToJson(_Unauthorized instance) =>
    <String, dynamic>{
      'message': instance.message,
      'runtimeType': instance.$type,
    };
