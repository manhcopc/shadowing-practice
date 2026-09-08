// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FollowResponse {

 bool get isFollowing; FollowStatsModel get followerStats; FollowStatsModel get followingStats;
/// Create a copy of FollowResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FollowResponseCopyWith<FollowResponse> get copyWith => _$FollowResponseCopyWithImpl<FollowResponse>(this as FollowResponse, _$identity);

  /// Serializes this FollowResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FollowResponse&&(identical(other.isFollowing, isFollowing) || other.isFollowing == isFollowing)&&(identical(other.followerStats, followerStats) || other.followerStats == followerStats)&&(identical(other.followingStats, followingStats) || other.followingStats == followingStats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isFollowing,followerStats,followingStats);

@override
String toString() {
  return 'FollowResponse(isFollowing: $isFollowing, followerStats: $followerStats, followingStats: $followingStats)';
}


}

/// @nodoc
abstract mixin class $FollowResponseCopyWith<$Res>  {
  factory $FollowResponseCopyWith(FollowResponse value, $Res Function(FollowResponse) _then) = _$FollowResponseCopyWithImpl;
@useResult
$Res call({
 bool isFollowing, FollowStatsModel followerStats, FollowStatsModel followingStats
});


$FollowStatsModelCopyWith<$Res> get followerStats;$FollowStatsModelCopyWith<$Res> get followingStats;

}
/// @nodoc
class _$FollowResponseCopyWithImpl<$Res>
    implements $FollowResponseCopyWith<$Res> {
  _$FollowResponseCopyWithImpl(this._self, this._then);

  final FollowResponse _self;
  final $Res Function(FollowResponse) _then;

/// Create a copy of FollowResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isFollowing = null,Object? followerStats = null,Object? followingStats = null,}) {
  return _then(_self.copyWith(
isFollowing: null == isFollowing ? _self.isFollowing : isFollowing // ignore: cast_nullable_to_non_nullable
as bool,followerStats: null == followerStats ? _self.followerStats : followerStats // ignore: cast_nullable_to_non_nullable
as FollowStatsModel,followingStats: null == followingStats ? _self.followingStats : followingStats // ignore: cast_nullable_to_non_nullable
as FollowStatsModel,
  ));
}
/// Create a copy of FollowResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FollowStatsModelCopyWith<$Res> get followerStats {
  
  return $FollowStatsModelCopyWith<$Res>(_self.followerStats, (value) {
    return _then(_self.copyWith(followerStats: value));
  });
}/// Create a copy of FollowResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FollowStatsModelCopyWith<$Res> get followingStats {
  
  return $FollowStatsModelCopyWith<$Res>(_self.followingStats, (value) {
    return _then(_self.copyWith(followingStats: value));
  });
}
}


/// Adds pattern-matching-related methods to [FollowResponse].
extension FollowResponsePatterns on FollowResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FollowResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FollowResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FollowResponse value)  $default,){
final _that = this;
switch (_that) {
case _FollowResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FollowResponse value)?  $default,){
final _that = this;
switch (_that) {
case _FollowResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isFollowing,  FollowStatsModel followerStats,  FollowStatsModel followingStats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FollowResponse() when $default != null:
return $default(_that.isFollowing,_that.followerStats,_that.followingStats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isFollowing,  FollowStatsModel followerStats,  FollowStatsModel followingStats)  $default,) {final _that = this;
switch (_that) {
case _FollowResponse():
return $default(_that.isFollowing,_that.followerStats,_that.followingStats);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isFollowing,  FollowStatsModel followerStats,  FollowStatsModel followingStats)?  $default,) {final _that = this;
switch (_that) {
case _FollowResponse() when $default != null:
return $default(_that.isFollowing,_that.followerStats,_that.followingStats);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _FollowResponse implements FollowResponse {
  const _FollowResponse({this.isFollowing = false, this.followerStats = const FollowStatsModel(), this.followingStats = const FollowStatsModel()});
  factory _FollowResponse.fromJson(Map<String, dynamic> json) => _$FollowResponseFromJson(json);

@override@JsonKey() final  bool isFollowing;
@override@JsonKey() final  FollowStatsModel followerStats;
@override@JsonKey() final  FollowStatsModel followingStats;

/// Create a copy of FollowResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FollowResponseCopyWith<_FollowResponse> get copyWith => __$FollowResponseCopyWithImpl<_FollowResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FollowResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FollowResponse&&(identical(other.isFollowing, isFollowing) || other.isFollowing == isFollowing)&&(identical(other.followerStats, followerStats) || other.followerStats == followerStats)&&(identical(other.followingStats, followingStats) || other.followingStats == followingStats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isFollowing,followerStats,followingStats);

@override
String toString() {
  return 'FollowResponse(isFollowing: $isFollowing, followerStats: $followerStats, followingStats: $followingStats)';
}


}

/// @nodoc
abstract mixin class _$FollowResponseCopyWith<$Res> implements $FollowResponseCopyWith<$Res> {
  factory _$FollowResponseCopyWith(_FollowResponse value, $Res Function(_FollowResponse) _then) = __$FollowResponseCopyWithImpl;
@override @useResult
$Res call({
 bool isFollowing, FollowStatsModel followerStats, FollowStatsModel followingStats
});


@override $FollowStatsModelCopyWith<$Res> get followerStats;@override $FollowStatsModelCopyWith<$Res> get followingStats;

}
/// @nodoc
class __$FollowResponseCopyWithImpl<$Res>
    implements _$FollowResponseCopyWith<$Res> {
  __$FollowResponseCopyWithImpl(this._self, this._then);

  final _FollowResponse _self;
  final $Res Function(_FollowResponse) _then;

/// Create a copy of FollowResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isFollowing = null,Object? followerStats = null,Object? followingStats = null,}) {
  return _then(_FollowResponse(
isFollowing: null == isFollowing ? _self.isFollowing : isFollowing // ignore: cast_nullable_to_non_nullable
as bool,followerStats: null == followerStats ? _self.followerStats : followerStats // ignore: cast_nullable_to_non_nullable
as FollowStatsModel,followingStats: null == followingStats ? _self.followingStats : followingStats // ignore: cast_nullable_to_non_nullable
as FollowStatsModel,
  ));
}

/// Create a copy of FollowResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FollowStatsModelCopyWith<$Res> get followerStats {
  
  return $FollowStatsModelCopyWith<$Res>(_self.followerStats, (value) {
    return _then(_self.copyWith(followerStats: value));
  });
}/// Create a copy of FollowResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FollowStatsModelCopyWith<$Res> get followingStats {
  
  return $FollowStatsModelCopyWith<$Res>(_self.followingStats, (value) {
    return _then(_self.copyWith(followingStats: value));
  });
}
}

// dart format on
