// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SingleApiResponse<T> _$SingleApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _SingleApiResponse<T>(fromJsonT(json['data']));

Map<String, dynamic> _$SingleApiResponseToJson<T>(
  _SingleApiResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{'data': toJsonT(instance.data)};

_ListApiResponse<T> _$ListApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _ListApiResponse<T>(
  (json['data'] as List<dynamic>).map(fromJsonT).toList(),
);

Map<String, dynamic> _$ListApiResponseToJson<T>(
  _ListApiResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{'data': instance.data.map(toJsonT).toList()};

_DataResponsePaginated<T> _$DataResponsePaginatedFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _DataResponsePaginated<T>(
  paginatedItems: (json['paginatedItems'] as List<dynamic>)
      .map(fromJsonT)
      .toList(),
  pagination: PaginationInfo.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$DataResponsePaginatedToJson<T>(
  _DataResponsePaginated<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'paginatedItems': instance.paginatedItems.map(toJsonT).toList(),
  'pagination': instance.pagination.toJson(),
};

_PaginationInfo _$PaginationInfoFromJson(Map<String, dynamic> json) =>
    _PaginationInfo(
      limit: (json['limit'] as num).toInt(),
      hasNext: json['hasNext'] as bool,
      nextCursor: json['nextCursor'] as String?,
      currentCount: (json['currentCount'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationInfoToJson(_PaginationInfo instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'hasNext': instance.hasNext,
      'nextCursor': instance.nextCursor,
      'currentCount': instance.currentCount,
    };
