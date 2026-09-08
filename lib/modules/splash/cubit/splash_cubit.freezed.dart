// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SplashState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState()';
}


}

/// @nodoc
class $SplashStateCopyWith<$Res>  {
$SplashStateCopyWith(SplashState _, $Res Function(SplashState) __);
}


/// Adds pattern-matching-related methods to [SplashState].
extension SplashStatePatterns on SplashState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _RunInProgress value)?  runInProgress,TResult Function( _Completed value)?  completed,TResult Function( _Error value)?  error,TResult Function( _Loading value)?  loading,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _RunInProgress() when runInProgress != null:
return runInProgress(_that);case _Completed() when completed != null:
return completed(_that);case _Error() when error != null:
return error(_that);case _Loading() when loading != null:
return loading(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _RunInProgress value)  runInProgress,required TResult Function( _Completed value)  completed,required TResult Function( _Error value)  error,required TResult Function( _Loading value)  loading,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _RunInProgress():
return runInProgress(_that);case _Completed():
return completed(_that);case _Error():
return error(_that);case _Loading():
return loading(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _RunInProgress value)?  runInProgress,TResult? Function( _Completed value)?  completed,TResult? Function( _Error value)?  error,TResult? Function( _Loading value)?  loading,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _RunInProgress() when runInProgress != null:
return runInProgress(_that);case _Completed() when completed != null:
return completed(_that);case _Error() when error != null:
return error(_that);case _Loading() when loading != null:
return loading(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( int duration)?  runInProgress,TResult Function()?  completed,TResult Function( String message)?  error,TResult Function()?  loading,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _RunInProgress() when runInProgress != null:
return runInProgress(_that.duration);case _Completed() when completed != null:
return completed();case _Error() when error != null:
return error(_that.message);case _Loading() when loading != null:
return loading();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( int duration)  runInProgress,required TResult Function()  completed,required TResult Function( String message)  error,required TResult Function()  loading,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _RunInProgress():
return runInProgress(_that.duration);case _Completed():
return completed();case _Error():
return error(_that.message);case _Loading():
return loading();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( int duration)?  runInProgress,TResult? Function()?  completed,TResult? Function( String message)?  error,TResult? Function()?  loading,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _RunInProgress() when runInProgress != null:
return runInProgress(_that.duration);case _Completed() when completed != null:
return completed();case _Error() when error != null:
return error(_that.message);case _Loading() when loading != null:
return loading();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SplashState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.initial()';
}


}




/// @nodoc


class _RunInProgress implements SplashState {
  const _RunInProgress(this.duration);
  

 final  int duration;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RunInProgressCopyWith<_RunInProgress> get copyWith => __$RunInProgressCopyWithImpl<_RunInProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RunInProgress&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,duration);

@override
String toString() {
  return 'SplashState.runInProgress(duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$RunInProgressCopyWith<$Res> implements $SplashStateCopyWith<$Res> {
  factory _$RunInProgressCopyWith(_RunInProgress value, $Res Function(_RunInProgress) _then) = __$RunInProgressCopyWithImpl;
@useResult
$Res call({
 int duration
});




}
/// @nodoc
class __$RunInProgressCopyWithImpl<$Res>
    implements _$RunInProgressCopyWith<$Res> {
  __$RunInProgressCopyWithImpl(this._self, this._then);

  final _RunInProgress _self;
  final $Res Function(_RunInProgress) _then;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? duration = null,}) {
  return _then(_RunInProgress(
null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Completed implements SplashState {
  const _Completed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Completed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.completed()';
}


}




/// @nodoc


class _Error implements SplashState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SplashState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $SplashStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Loading implements SplashState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.loading()';
}


}




// dart format on
