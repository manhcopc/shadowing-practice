// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'toggle_public_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TogglePublicResponse {

 bool get isPublic;
/// Create a copy of TogglePublicResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TogglePublicResponseCopyWith<TogglePublicResponse> get copyWith => _$TogglePublicResponseCopyWithImpl<TogglePublicResponse>(this as TogglePublicResponse, _$identity);

  /// Serializes this TogglePublicResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TogglePublicResponse&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isPublic);

@override
String toString() {
  return 'TogglePublicResponse(isPublic: $isPublic)';
}


}

/// @nodoc
abstract mixin class $TogglePublicResponseCopyWith<$Res>  {
  factory $TogglePublicResponseCopyWith(TogglePublicResponse value, $Res Function(TogglePublicResponse) _then) = _$TogglePublicResponseCopyWithImpl;
@useResult
$Res call({
 bool isPublic
});




}
/// @nodoc
class _$TogglePublicResponseCopyWithImpl<$Res>
    implements $TogglePublicResponseCopyWith<$Res> {
  _$TogglePublicResponseCopyWithImpl(this._self, this._then);

  final TogglePublicResponse _self;
  final $Res Function(TogglePublicResponse) _then;

/// Create a copy of TogglePublicResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isPublic = null,}) {
  return _then(_self.copyWith(
isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TogglePublicResponse].
extension TogglePublicResponsePatterns on TogglePublicResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TogglePublicResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TogglePublicResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TogglePublicResponse value)  $default,){
final _that = this;
switch (_that) {
case _TogglePublicResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TogglePublicResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TogglePublicResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isPublic)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TogglePublicResponse() when $default != null:
return $default(_that.isPublic);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isPublic)  $default,) {final _that = this;
switch (_that) {
case _TogglePublicResponse():
return $default(_that.isPublic);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isPublic)?  $default,) {final _that = this;
switch (_that) {
case _TogglePublicResponse() when $default != null:
return $default(_that.isPublic);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _TogglePublicResponse implements TogglePublicResponse {
  const _TogglePublicResponse({this.isPublic = false});
  factory _TogglePublicResponse.fromJson(Map<String, dynamic> json) => _$TogglePublicResponseFromJson(json);

@override@JsonKey() final  bool isPublic;

/// Create a copy of TogglePublicResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TogglePublicResponseCopyWith<_TogglePublicResponse> get copyWith => __$TogglePublicResponseCopyWithImpl<_TogglePublicResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TogglePublicResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TogglePublicResponse&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isPublic);

@override
String toString() {
  return 'TogglePublicResponse(isPublic: $isPublic)';
}


}

/// @nodoc
abstract mixin class _$TogglePublicResponseCopyWith<$Res> implements $TogglePublicResponseCopyWith<$Res> {
  factory _$TogglePublicResponseCopyWith(_TogglePublicResponse value, $Res Function(_TogglePublicResponse) _then) = __$TogglePublicResponseCopyWithImpl;
@override @useResult
$Res call({
 bool isPublic
});




}
/// @nodoc
class __$TogglePublicResponseCopyWithImpl<$Res>
    implements _$TogglePublicResponseCopyWith<$Res> {
  __$TogglePublicResponseCopyWithImpl(this._self, this._then);

  final _TogglePublicResponse _self;
  final $Res Function(_TogglePublicResponse) _then;

/// Create a copy of TogglePublicResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isPublic = null,}) {
  return _then(_TogglePublicResponse(
isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
