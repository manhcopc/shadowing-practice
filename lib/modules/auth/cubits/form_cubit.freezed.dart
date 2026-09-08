// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FormState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FormState()';
}


}

/// @nodoc
class $FormStateCopyWith<$Res>  {
$FormStateCopyWith(FormState _, $Res Function(FormState) __);
}


/// Adds pattern-matching-related methods to [FormState].
extension FormStatePatterns on FormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String? usernameError,  String? emailError,  String? passwordError,  String? confirmPasswordError,  String? currentPasswordError,  String? firstNameError,  String? lastNameError,  String? otherError)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Error() when error != null:
return error(_that.usernameError,_that.emailError,_that.passwordError,_that.confirmPasswordError,_that.currentPasswordError,_that.firstNameError,_that.lastNameError,_that.otherError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String? usernameError,  String? emailError,  String? passwordError,  String? confirmPasswordError,  String? currentPasswordError,  String? firstNameError,  String? lastNameError,  String? otherError)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Error():
return error(_that.usernameError,_that.emailError,_that.passwordError,_that.confirmPasswordError,_that.currentPasswordError,_that.firstNameError,_that.lastNameError,_that.otherError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String? usernameError,  String? emailError,  String? passwordError,  String? confirmPasswordError,  String? currentPasswordError,  String? firstNameError,  String? lastNameError,  String? otherError)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Error() when error != null:
return error(_that.usernameError,_that.emailError,_that.passwordError,_that.confirmPasswordError,_that.currentPasswordError,_that.firstNameError,_that.lastNameError,_that.otherError);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements FormState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FormState.initial()';
}


}




/// @nodoc


class _Error implements FormState {
  const _Error({this.usernameError, this.emailError, this.passwordError, this.confirmPasswordError, this.currentPasswordError, this.firstNameError, this.lastNameError, this.otherError});
  

 final  String? usernameError;
 final  String? emailError;
 final  String? passwordError;
 final  String? confirmPasswordError;
 final  String? currentPasswordError;
 final  String? firstNameError;
 final  String? lastNameError;
 final  String? otherError;

/// Create a copy of FormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.usernameError, usernameError) || other.usernameError == usernameError)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError)&&(identical(other.confirmPasswordError, confirmPasswordError) || other.confirmPasswordError == confirmPasswordError)&&(identical(other.currentPasswordError, currentPasswordError) || other.currentPasswordError == currentPasswordError)&&(identical(other.firstNameError, firstNameError) || other.firstNameError == firstNameError)&&(identical(other.lastNameError, lastNameError) || other.lastNameError == lastNameError)&&(identical(other.otherError, otherError) || other.otherError == otherError));
}


@override
int get hashCode => Object.hash(runtimeType,usernameError,emailError,passwordError,confirmPasswordError,currentPasswordError,firstNameError,lastNameError,otherError);

@override
String toString() {
  return 'FormState.error(usernameError: $usernameError, emailError: $emailError, passwordError: $passwordError, confirmPasswordError: $confirmPasswordError, currentPasswordError: $currentPasswordError, firstNameError: $firstNameError, lastNameError: $lastNameError, otherError: $otherError)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $FormStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String? usernameError, String? emailError, String? passwordError, String? confirmPasswordError, String? currentPasswordError, String? firstNameError, String? lastNameError, String? otherError
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of FormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? usernameError = freezed,Object? emailError = freezed,Object? passwordError = freezed,Object? confirmPasswordError = freezed,Object? currentPasswordError = freezed,Object? firstNameError = freezed,Object? lastNameError = freezed,Object? otherError = freezed,}) {
  return _then(_Error(
usernameError: freezed == usernameError ? _self.usernameError : usernameError // ignore: cast_nullable_to_non_nullable
as String?,emailError: freezed == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String?,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String?,confirmPasswordError: freezed == confirmPasswordError ? _self.confirmPasswordError : confirmPasswordError // ignore: cast_nullable_to_non_nullable
as String?,currentPasswordError: freezed == currentPasswordError ? _self.currentPasswordError : currentPasswordError // ignore: cast_nullable_to_non_nullable
as String?,firstNameError: freezed == firstNameError ? _self.firstNameError : firstNameError // ignore: cast_nullable_to_non_nullable
as String?,lastNameError: freezed == lastNameError ? _self.lastNameError : lastNameError // ignore: cast_nullable_to_non_nullable
as String?,otherError: freezed == otherError ? _self.otherError : otherError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
