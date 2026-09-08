// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'switch_theme_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SwitchThemeState {

 ThemeMode get themeMode;
/// Create a copy of SwitchThemeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SwitchThemeStateCopyWith<SwitchThemeState> get copyWith => _$SwitchThemeStateCopyWithImpl<SwitchThemeState>(this as SwitchThemeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SwitchThemeState&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}


@override
int get hashCode => Object.hash(runtimeType,themeMode);

@override
String toString() {
  return 'SwitchThemeState(themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class $SwitchThemeStateCopyWith<$Res>  {
  factory $SwitchThemeStateCopyWith(SwitchThemeState value, $Res Function(SwitchThemeState) _then) = _$SwitchThemeStateCopyWithImpl;
@useResult
$Res call({
 ThemeMode themeMode
});




}
/// @nodoc
class _$SwitchThemeStateCopyWithImpl<$Res>
    implements $SwitchThemeStateCopyWith<$Res> {
  _$SwitchThemeStateCopyWithImpl(this._self, this._then);

  final SwitchThemeState _self;
  final $Res Function(SwitchThemeState) _then;

/// Create a copy of SwitchThemeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? themeMode = null,}) {
  return _then(_self.copyWith(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,
  ));
}

}


/// Adds pattern-matching-related methods to [SwitchThemeState].
extension SwitchThemeStatePatterns on SwitchThemeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SwitchThemeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SwitchThemeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SwitchThemeState value)  $default,){
final _that = this;
switch (_that) {
case _SwitchThemeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SwitchThemeState value)?  $default,){
final _that = this;
switch (_that) {
case _SwitchThemeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ThemeMode themeMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SwitchThemeState() when $default != null:
return $default(_that.themeMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ThemeMode themeMode)  $default,) {final _that = this;
switch (_that) {
case _SwitchThemeState():
return $default(_that.themeMode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ThemeMode themeMode)?  $default,) {final _that = this;
switch (_that) {
case _SwitchThemeState() when $default != null:
return $default(_that.themeMode);case _:
  return null;

}
}

}

/// @nodoc


class _SwitchThemeState implements SwitchThemeState {
  const _SwitchThemeState({required this.themeMode});
  

@override final  ThemeMode themeMode;

/// Create a copy of SwitchThemeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SwitchThemeStateCopyWith<_SwitchThemeState> get copyWith => __$SwitchThemeStateCopyWithImpl<_SwitchThemeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SwitchThemeState&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}


@override
int get hashCode => Object.hash(runtimeType,themeMode);

@override
String toString() {
  return 'SwitchThemeState(themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class _$SwitchThemeStateCopyWith<$Res> implements $SwitchThemeStateCopyWith<$Res> {
  factory _$SwitchThemeStateCopyWith(_SwitchThemeState value, $Res Function(_SwitchThemeState) _then) = __$SwitchThemeStateCopyWithImpl;
@override @useResult
$Res call({
 ThemeMode themeMode
});




}
/// @nodoc
class __$SwitchThemeStateCopyWithImpl<$Res>
    implements _$SwitchThemeStateCopyWith<$Res> {
  __$SwitchThemeStateCopyWithImpl(this._self, this._then);

  final _SwitchThemeState _self;
  final $Res Function(_SwitchThemeState) _then;

/// Create a copy of SwitchThemeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themeMode = null,}) {
  return _then(_SwitchThemeState(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,
  ));
}


}

// dart format on
