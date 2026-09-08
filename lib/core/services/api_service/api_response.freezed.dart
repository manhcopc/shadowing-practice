// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SingleApiResponse<T> {

 T get data;
/// Create a copy of SingleApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SingleApiResponseCopyWith<T, SingleApiResponse<T>> get copyWith => _$SingleApiResponseCopyWithImpl<T, SingleApiResponse<T>>(this as SingleApiResponse<T>, _$identity);

  /// Serializes this SingleApiResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SingleApiResponse<T>&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'SingleApiResponse<$T>(data: $data)';
}


}

/// @nodoc
abstract mixin class $SingleApiResponseCopyWith<T,$Res>  {
  factory $SingleApiResponseCopyWith(SingleApiResponse<T> value, $Res Function(SingleApiResponse<T>) _then) = _$SingleApiResponseCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$SingleApiResponseCopyWithImpl<T,$Res>
    implements $SingleApiResponseCopyWith<T, $Res> {
  _$SingleApiResponseCopyWithImpl(this._self, this._then);

  final SingleApiResponse<T> _self;
  final $Res Function(SingleApiResponse<T>) _then;

/// Create a copy of SingleApiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}

}


/// Adds pattern-matching-related methods to [SingleApiResponse].
extension SingleApiResponsePatterns<T> on SingleApiResponse<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SingleApiResponse<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SingleApiResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SingleApiResponse<T> value)  $default,){
final _that = this;
switch (_that) {
case _SingleApiResponse():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SingleApiResponse<T> value)?  $default,){
final _that = this;
switch (_that) {
case _SingleApiResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( T data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SingleApiResponse() when $default != null:
return $default(_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( T data)  $default,) {final _that = this;
switch (_that) {
case _SingleApiResponse():
return $default(_that.data);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( T data)?  $default,) {final _that = this;
switch (_that) {
case _SingleApiResponse() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _SingleApiResponse<T> implements SingleApiResponse<T> {
  const _SingleApiResponse(this.data);
  factory _SingleApiResponse.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$SingleApiResponseFromJson(json,fromJsonT);

@override final  T data;

/// Create a copy of SingleApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SingleApiResponseCopyWith<T, _SingleApiResponse<T>> get copyWith => __$SingleApiResponseCopyWithImpl<T, _SingleApiResponse<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$SingleApiResponseToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SingleApiResponse<T>&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'SingleApiResponse<$T>(data: $data)';
}


}

/// @nodoc
abstract mixin class _$SingleApiResponseCopyWith<T,$Res> implements $SingleApiResponseCopyWith<T, $Res> {
  factory _$SingleApiResponseCopyWith(_SingleApiResponse<T> value, $Res Function(_SingleApiResponse<T>) _then) = __$SingleApiResponseCopyWithImpl;
@override @useResult
$Res call({
 T data
});




}
/// @nodoc
class __$SingleApiResponseCopyWithImpl<T,$Res>
    implements _$SingleApiResponseCopyWith<T, $Res> {
  __$SingleApiResponseCopyWithImpl(this._self, this._then);

  final _SingleApiResponse<T> _self;
  final $Res Function(_SingleApiResponse<T>) _then;

/// Create a copy of SingleApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(_SingleApiResponse<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}


/// @nodoc
mixin _$ListApiResponse<T> {

 List<T> get data;
/// Create a copy of ListApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListApiResponseCopyWith<T, ListApiResponse<T>> get copyWith => _$ListApiResponseCopyWithImpl<T, ListApiResponse<T>>(this as ListApiResponse<T>, _$identity);

  /// Serializes this ListApiResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListApiResponse<T>&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ListApiResponse<$T>(data: $data)';
}


}

/// @nodoc
abstract mixin class $ListApiResponseCopyWith<T,$Res>  {
  factory $ListApiResponseCopyWith(ListApiResponse<T> value, $Res Function(ListApiResponse<T>) _then) = _$ListApiResponseCopyWithImpl;
@useResult
$Res call({
 List<T> data
});




}
/// @nodoc
class _$ListApiResponseCopyWithImpl<T,$Res>
    implements $ListApiResponseCopyWith<T, $Res> {
  _$ListApiResponseCopyWithImpl(this._self, this._then);

  final ListApiResponse<T> _self;
  final $Res Function(ListApiResponse<T>) _then;

/// Create a copy of ListApiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<T>,
  ));
}

}


/// Adds pattern-matching-related methods to [ListApiResponse].
extension ListApiResponsePatterns<T> on ListApiResponse<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListApiResponse<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListApiResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListApiResponse<T> value)  $default,){
final _that = this;
switch (_that) {
case _ListApiResponse():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListApiResponse<T> value)?  $default,){
final _that = this;
switch (_that) {
case _ListApiResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<T> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListApiResponse() when $default != null:
return $default(_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<T> data)  $default,) {final _that = this;
switch (_that) {
case _ListApiResponse():
return $default(_that.data);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<T> data)?  $default,) {final _that = this;
switch (_that) {
case _ListApiResponse() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _ListApiResponse<T> implements ListApiResponse<T> {
  const _ListApiResponse(final  List<T> data): _data = data;
  factory _ListApiResponse.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$ListApiResponseFromJson(json,fromJsonT);

 final  List<T> _data;
@override List<T> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of ListApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListApiResponseCopyWith<T, _ListApiResponse<T>> get copyWith => __$ListApiResponseCopyWithImpl<T, _ListApiResponse<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$ListApiResponseToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListApiResponse<T>&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'ListApiResponse<$T>(data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListApiResponseCopyWith<T,$Res> implements $ListApiResponseCopyWith<T, $Res> {
  factory _$ListApiResponseCopyWith(_ListApiResponse<T> value, $Res Function(_ListApiResponse<T>) _then) = __$ListApiResponseCopyWithImpl;
@override @useResult
$Res call({
 List<T> data
});




}
/// @nodoc
class __$ListApiResponseCopyWithImpl<T,$Res>
    implements _$ListApiResponseCopyWith<T, $Res> {
  __$ListApiResponseCopyWithImpl(this._self, this._then);

  final _ListApiResponse<T> _self;
  final $Res Function(_ListApiResponse<T>) _then;

/// Create a copy of ListApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_ListApiResponse<T>(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<T>,
  ));
}


}


/// @nodoc
mixin _$DataResponsePaginated<T> {

 List<T> get paginatedItems; PaginationInfo get pagination;
/// Create a copy of DataResponsePaginated
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataResponsePaginatedCopyWith<T, DataResponsePaginated<T>> get copyWith => _$DataResponsePaginatedCopyWithImpl<T, DataResponsePaginated<T>>(this as DataResponsePaginated<T>, _$identity);

  /// Serializes this DataResponsePaginated to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataResponsePaginated<T>&&const DeepCollectionEquality().equals(other.paginatedItems, paginatedItems)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(paginatedItems),pagination);

@override
String toString() {
  return 'DataResponsePaginated<$T>(paginatedItems: $paginatedItems, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $DataResponsePaginatedCopyWith<T,$Res>  {
  factory $DataResponsePaginatedCopyWith(DataResponsePaginated<T> value, $Res Function(DataResponsePaginated<T>) _then) = _$DataResponsePaginatedCopyWithImpl;
@useResult
$Res call({
 List<T> paginatedItems, PaginationInfo pagination
});


$PaginationInfoCopyWith<$Res> get pagination;

}
/// @nodoc
class _$DataResponsePaginatedCopyWithImpl<T,$Res>
    implements $DataResponsePaginatedCopyWith<T, $Res> {
  _$DataResponsePaginatedCopyWithImpl(this._self, this._then);

  final DataResponsePaginated<T> _self;
  final $Res Function(DataResponsePaginated<T>) _then;

/// Create a copy of DataResponsePaginated
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? paginatedItems = null,Object? pagination = null,}) {
  return _then(_self.copyWith(
paginatedItems: null == paginatedItems ? _self.paginatedItems : paginatedItems // ignore: cast_nullable_to_non_nullable
as List<T>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationInfo,
  ));
}
/// Create a copy of DataResponsePaginated
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationInfoCopyWith<$Res> get pagination {
  
  return $PaginationInfoCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [DataResponsePaginated].
extension DataResponsePaginatedPatterns<T> on DataResponsePaginated<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DataResponsePaginated<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DataResponsePaginated() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DataResponsePaginated<T> value)  $default,){
final _that = this;
switch (_that) {
case _DataResponsePaginated():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DataResponsePaginated<T> value)?  $default,){
final _that = this;
switch (_that) {
case _DataResponsePaginated() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<T> paginatedItems,  PaginationInfo pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DataResponsePaginated() when $default != null:
return $default(_that.paginatedItems,_that.pagination);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<T> paginatedItems,  PaginationInfo pagination)  $default,) {final _that = this;
switch (_that) {
case _DataResponsePaginated():
return $default(_that.paginatedItems,_that.pagination);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<T> paginatedItems,  PaginationInfo pagination)?  $default,) {final _that = this;
switch (_that) {
case _DataResponsePaginated() when $default != null:
return $default(_that.paginatedItems,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _DataResponsePaginated<T> implements DataResponsePaginated<T> {
  const _DataResponsePaginated({required final  List<T> paginatedItems, required this.pagination}): _paginatedItems = paginatedItems;
  factory _DataResponsePaginated.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$DataResponsePaginatedFromJson(json,fromJsonT);

 final  List<T> _paginatedItems;
@override List<T> get paginatedItems {
  if (_paginatedItems is EqualUnmodifiableListView) return _paginatedItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_paginatedItems);
}

@override final  PaginationInfo pagination;

/// Create a copy of DataResponsePaginated
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataResponsePaginatedCopyWith<T, _DataResponsePaginated<T>> get copyWith => __$DataResponsePaginatedCopyWithImpl<T, _DataResponsePaginated<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$DataResponsePaginatedToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DataResponsePaginated<T>&&const DeepCollectionEquality().equals(other._paginatedItems, _paginatedItems)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_paginatedItems),pagination);

@override
String toString() {
  return 'DataResponsePaginated<$T>(paginatedItems: $paginatedItems, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$DataResponsePaginatedCopyWith<T,$Res> implements $DataResponsePaginatedCopyWith<T, $Res> {
  factory _$DataResponsePaginatedCopyWith(_DataResponsePaginated<T> value, $Res Function(_DataResponsePaginated<T>) _then) = __$DataResponsePaginatedCopyWithImpl;
@override @useResult
$Res call({
 List<T> paginatedItems, PaginationInfo pagination
});


@override $PaginationInfoCopyWith<$Res> get pagination;

}
/// @nodoc
class __$DataResponsePaginatedCopyWithImpl<T,$Res>
    implements _$DataResponsePaginatedCopyWith<T, $Res> {
  __$DataResponsePaginatedCopyWithImpl(this._self, this._then);

  final _DataResponsePaginated<T> _self;
  final $Res Function(_DataResponsePaginated<T>) _then;

/// Create a copy of DataResponsePaginated
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? paginatedItems = null,Object? pagination = null,}) {
  return _then(_DataResponsePaginated<T>(
paginatedItems: null == paginatedItems ? _self._paginatedItems : paginatedItems // ignore: cast_nullable_to_non_nullable
as List<T>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationInfo,
  ));
}

/// Create a copy of DataResponsePaginated
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationInfoCopyWith<$Res> get pagination {
  
  return $PaginationInfoCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// @nodoc
mixin _$PaginationInfo {

 int get limit; bool get hasNext; String? get nextCursor; int get currentCount;
/// Create a copy of PaginationInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationInfoCopyWith<PaginationInfo> get copyWith => _$PaginationInfoCopyWithImpl<PaginationInfo>(this as PaginationInfo, _$identity);

  /// Serializes this PaginationInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationInfo&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.currentCount, currentCount) || other.currentCount == currentCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,hasNext,nextCursor,currentCount);

@override
String toString() {
  return 'PaginationInfo(limit: $limit, hasNext: $hasNext, nextCursor: $nextCursor, currentCount: $currentCount)';
}


}

/// @nodoc
abstract mixin class $PaginationInfoCopyWith<$Res>  {
  factory $PaginationInfoCopyWith(PaginationInfo value, $Res Function(PaginationInfo) _then) = _$PaginationInfoCopyWithImpl;
@useResult
$Res call({
 int limit, bool hasNext, String? nextCursor, int currentCount
});




}
/// @nodoc
class _$PaginationInfoCopyWithImpl<$Res>
    implements $PaginationInfoCopyWith<$Res> {
  _$PaginationInfoCopyWithImpl(this._self, this._then);

  final PaginationInfo _self;
  final $Res Function(PaginationInfo) _then;

/// Create a copy of PaginationInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limit = null,Object? hasNext = null,Object? nextCursor = freezed,Object? currentCount = null,}) {
  return _then(_self.copyWith(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,currentCount: null == currentCount ? _self.currentCount : currentCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginationInfo].
extension PaginationInfoPatterns on PaginationInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationInfo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationInfo value)  $default,){
final _that = this;
switch (_that) {
case _PaginationInfo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationInfo value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationInfo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int limit,  bool hasNext,  String? nextCursor,  int currentCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationInfo() when $default != null:
return $default(_that.limit,_that.hasNext,_that.nextCursor,_that.currentCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int limit,  bool hasNext,  String? nextCursor,  int currentCount)  $default,) {final _that = this;
switch (_that) {
case _PaginationInfo():
return $default(_that.limit,_that.hasNext,_that.nextCursor,_that.currentCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int limit,  bool hasNext,  String? nextCursor,  int currentCount)?  $default,) {final _that = this;
switch (_that) {
case _PaginationInfo() when $default != null:
return $default(_that.limit,_that.hasNext,_that.nextCursor,_that.currentCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginationInfo implements PaginationInfo {
  const _PaginationInfo({required this.limit, required this.hasNext, this.nextCursor, required this.currentCount});
  factory _PaginationInfo.fromJson(Map<String, dynamic> json) => _$PaginationInfoFromJson(json);

@override final  int limit;
@override final  bool hasNext;
@override final  String? nextCursor;
@override final  int currentCount;

/// Create a copy of PaginationInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationInfoCopyWith<_PaginationInfo> get copyWith => __$PaginationInfoCopyWithImpl<_PaginationInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationInfo&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.currentCount, currentCount) || other.currentCount == currentCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,hasNext,nextCursor,currentCount);

@override
String toString() {
  return 'PaginationInfo(limit: $limit, hasNext: $hasNext, nextCursor: $nextCursor, currentCount: $currentCount)';
}


}

/// @nodoc
abstract mixin class _$PaginationInfoCopyWith<$Res> implements $PaginationInfoCopyWith<$Res> {
  factory _$PaginationInfoCopyWith(_PaginationInfo value, $Res Function(_PaginationInfo) _then) = __$PaginationInfoCopyWithImpl;
@override @useResult
$Res call({
 int limit, bool hasNext, String? nextCursor, int currentCount
});




}
/// @nodoc
class __$PaginationInfoCopyWithImpl<$Res>
    implements _$PaginationInfoCopyWith<$Res> {
  __$PaginationInfoCopyWithImpl(this._self, this._then);

  final _PaginationInfo _self;
  final $Res Function(_PaginationInfo) _then;

/// Create a copy of PaginationInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = null,Object? hasNext = null,Object? nextCursor = freezed,Object? currentCount = null,}) {
  return _then(_PaginationInfo(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,currentCount: null == currentCount ? _self.currentCount : currentCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
