// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginRequest {

 String get email; String get password;
/// Create a copy of LoginRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginRequestCopyWith<LoginRequest> get copyWith => _$LoginRequestCopyWithImpl<LoginRequest>(this as LoginRequest, _$identity);

  /// Serializes this LoginRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginRequest&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'LoginRequest(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $LoginRequestCopyWith<$Res>  {
  factory $LoginRequestCopyWith(LoginRequest value, $Res Function(LoginRequest) _then) = _$LoginRequestCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$LoginRequestCopyWithImpl<$Res>
    implements $LoginRequestCopyWith<$Res> {
  _$LoginRequestCopyWithImpl(this._self, this._then);

  final LoginRequest _self;
  final $Res Function(LoginRequest) _then;

/// Create a copy of LoginRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginRequest].
extension LoginRequestPatterns on LoginRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginRequest value)  $default,){
final _that = this;
switch (_that) {
case _LoginRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginRequest value)?  $default,){
final _that = this;
switch (_that) {
case _LoginRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginRequest() when $default != null:
return $default(_that.email,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String password)  $default,) {final _that = this;
switch (_that) {
case _LoginRequest():
return $default(_that.email,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String password)?  $default,) {final _that = this;
switch (_that) {
case _LoginRequest() when $default != null:
return $default(_that.email,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginRequest implements LoginRequest {
  const _LoginRequest({this.email = '', this.password = ''});
  factory _LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);

@override@JsonKey() final  String email;
@override@JsonKey() final  String password;

/// Create a copy of LoginRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginRequestCopyWith<_LoginRequest> get copyWith => __$LoginRequestCopyWithImpl<_LoginRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginRequest&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'LoginRequest(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$LoginRequestCopyWith<$Res> implements $LoginRequestCopyWith<$Res> {
  factory _$LoginRequestCopyWith(_LoginRequest value, $Res Function(_LoginRequest) _then) = __$LoginRequestCopyWithImpl;
@override @useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$LoginRequestCopyWithImpl<$Res>
    implements _$LoginRequestCopyWith<$Res> {
  __$LoginRequestCopyWithImpl(this._self, this._then);

  final _LoginRequest _self;
  final $Res Function(_LoginRequest) _then;

/// Create a copy of LoginRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_LoginRequest(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LoginWithGoogleRequest {

 String get serverAuthCode;
/// Create a copy of LoginWithGoogleRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginWithGoogleRequestCopyWith<LoginWithGoogleRequest> get copyWith => _$LoginWithGoogleRequestCopyWithImpl<LoginWithGoogleRequest>(this as LoginWithGoogleRequest, _$identity);

  /// Serializes this LoginWithGoogleRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginWithGoogleRequest&&(identical(other.serverAuthCode, serverAuthCode) || other.serverAuthCode == serverAuthCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverAuthCode);

@override
String toString() {
  return 'LoginWithGoogleRequest(serverAuthCode: $serverAuthCode)';
}


}

/// @nodoc
abstract mixin class $LoginWithGoogleRequestCopyWith<$Res>  {
  factory $LoginWithGoogleRequestCopyWith(LoginWithGoogleRequest value, $Res Function(LoginWithGoogleRequest) _then) = _$LoginWithGoogleRequestCopyWithImpl;
@useResult
$Res call({
 String serverAuthCode
});




}
/// @nodoc
class _$LoginWithGoogleRequestCopyWithImpl<$Res>
    implements $LoginWithGoogleRequestCopyWith<$Res> {
  _$LoginWithGoogleRequestCopyWithImpl(this._self, this._then);

  final LoginWithGoogleRequest _self;
  final $Res Function(LoginWithGoogleRequest) _then;

/// Create a copy of LoginWithGoogleRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serverAuthCode = null,}) {
  return _then(_self.copyWith(
serverAuthCode: null == serverAuthCode ? _self.serverAuthCode : serverAuthCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginWithGoogleRequest].
extension LoginWithGoogleRequestPatterns on LoginWithGoogleRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginWithGoogleRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginWithGoogleRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginWithGoogleRequest value)  $default,){
final _that = this;
switch (_that) {
case _LoginWithGoogleRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginWithGoogleRequest value)?  $default,){
final _that = this;
switch (_that) {
case _LoginWithGoogleRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String serverAuthCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginWithGoogleRequest() when $default != null:
return $default(_that.serverAuthCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String serverAuthCode)  $default,) {final _that = this;
switch (_that) {
case _LoginWithGoogleRequest():
return $default(_that.serverAuthCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String serverAuthCode)?  $default,) {final _that = this;
switch (_that) {
case _LoginWithGoogleRequest() when $default != null:
return $default(_that.serverAuthCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginWithGoogleRequest implements LoginWithGoogleRequest {
  const _LoginWithGoogleRequest({this.serverAuthCode = ''});
  factory _LoginWithGoogleRequest.fromJson(Map<String, dynamic> json) => _$LoginWithGoogleRequestFromJson(json);

@override@JsonKey() final  String serverAuthCode;

/// Create a copy of LoginWithGoogleRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginWithGoogleRequestCopyWith<_LoginWithGoogleRequest> get copyWith => __$LoginWithGoogleRequestCopyWithImpl<_LoginWithGoogleRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginWithGoogleRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginWithGoogleRequest&&(identical(other.serverAuthCode, serverAuthCode) || other.serverAuthCode == serverAuthCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverAuthCode);

@override
String toString() {
  return 'LoginWithGoogleRequest(serverAuthCode: $serverAuthCode)';
}


}

/// @nodoc
abstract mixin class _$LoginWithGoogleRequestCopyWith<$Res> implements $LoginWithGoogleRequestCopyWith<$Res> {
  factory _$LoginWithGoogleRequestCopyWith(_LoginWithGoogleRequest value, $Res Function(_LoginWithGoogleRequest) _then) = __$LoginWithGoogleRequestCopyWithImpl;
@override @useResult
$Res call({
 String serverAuthCode
});




}
/// @nodoc
class __$LoginWithGoogleRequestCopyWithImpl<$Res>
    implements _$LoginWithGoogleRequestCopyWith<$Res> {
  __$LoginWithGoogleRequestCopyWithImpl(this._self, this._then);

  final _LoginWithGoogleRequest _self;
  final $Res Function(_LoginWithGoogleRequest) _then;

/// Create a copy of LoginWithGoogleRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serverAuthCode = null,}) {
  return _then(_LoginWithGoogleRequest(
serverAuthCode: null == serverAuthCode ? _self.serverAuthCode : serverAuthCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LoginWithAppleRequest {

 String get serverAuthCode; String get rawNonce;
/// Create a copy of LoginWithAppleRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginWithAppleRequestCopyWith<LoginWithAppleRequest> get copyWith => _$LoginWithAppleRequestCopyWithImpl<LoginWithAppleRequest>(this as LoginWithAppleRequest, _$identity);

  /// Serializes this LoginWithAppleRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginWithAppleRequest&&(identical(other.serverAuthCode, serverAuthCode) || other.serverAuthCode == serverAuthCode)&&(identical(other.rawNonce, rawNonce) || other.rawNonce == rawNonce));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverAuthCode,rawNonce);

@override
String toString() {
  return 'LoginWithAppleRequest(serverAuthCode: $serverAuthCode, rawNonce: $rawNonce)';
}


}

/// @nodoc
abstract mixin class $LoginWithAppleRequestCopyWith<$Res>  {
  factory $LoginWithAppleRequestCopyWith(LoginWithAppleRequest value, $Res Function(LoginWithAppleRequest) _then) = _$LoginWithAppleRequestCopyWithImpl;
@useResult
$Res call({
 String serverAuthCode, String rawNonce
});




}
/// @nodoc
class _$LoginWithAppleRequestCopyWithImpl<$Res>
    implements $LoginWithAppleRequestCopyWith<$Res> {
  _$LoginWithAppleRequestCopyWithImpl(this._self, this._then);

  final LoginWithAppleRequest _self;
  final $Res Function(LoginWithAppleRequest) _then;

/// Create a copy of LoginWithAppleRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serverAuthCode = null,Object? rawNonce = null,}) {
  return _then(_self.copyWith(
serverAuthCode: null == serverAuthCode ? _self.serverAuthCode : serverAuthCode // ignore: cast_nullable_to_non_nullable
as String,rawNonce: null == rawNonce ? _self.rawNonce : rawNonce // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginWithAppleRequest].
extension LoginWithAppleRequestPatterns on LoginWithAppleRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginWithAppleRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginWithAppleRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginWithAppleRequest value)  $default,){
final _that = this;
switch (_that) {
case _LoginWithAppleRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginWithAppleRequest value)?  $default,){
final _that = this;
switch (_that) {
case _LoginWithAppleRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String serverAuthCode,  String rawNonce)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginWithAppleRequest() when $default != null:
return $default(_that.serverAuthCode,_that.rawNonce);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String serverAuthCode,  String rawNonce)  $default,) {final _that = this;
switch (_that) {
case _LoginWithAppleRequest():
return $default(_that.serverAuthCode,_that.rawNonce);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String serverAuthCode,  String rawNonce)?  $default,) {final _that = this;
switch (_that) {
case _LoginWithAppleRequest() when $default != null:
return $default(_that.serverAuthCode,_that.rawNonce);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginWithAppleRequest implements LoginWithAppleRequest {
  const _LoginWithAppleRequest({this.serverAuthCode = '', this.rawNonce = ''});
  factory _LoginWithAppleRequest.fromJson(Map<String, dynamic> json) => _$LoginWithAppleRequestFromJson(json);

@override@JsonKey() final  String serverAuthCode;
@override@JsonKey() final  String rawNonce;

/// Create a copy of LoginWithAppleRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginWithAppleRequestCopyWith<_LoginWithAppleRequest> get copyWith => __$LoginWithAppleRequestCopyWithImpl<_LoginWithAppleRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginWithAppleRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginWithAppleRequest&&(identical(other.serverAuthCode, serverAuthCode) || other.serverAuthCode == serverAuthCode)&&(identical(other.rawNonce, rawNonce) || other.rawNonce == rawNonce));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverAuthCode,rawNonce);

@override
String toString() {
  return 'LoginWithAppleRequest(serverAuthCode: $serverAuthCode, rawNonce: $rawNonce)';
}


}

/// @nodoc
abstract mixin class _$LoginWithAppleRequestCopyWith<$Res> implements $LoginWithAppleRequestCopyWith<$Res> {
  factory _$LoginWithAppleRequestCopyWith(_LoginWithAppleRequest value, $Res Function(_LoginWithAppleRequest) _then) = __$LoginWithAppleRequestCopyWithImpl;
@override @useResult
$Res call({
 String serverAuthCode, String rawNonce
});




}
/// @nodoc
class __$LoginWithAppleRequestCopyWithImpl<$Res>
    implements _$LoginWithAppleRequestCopyWith<$Res> {
  __$LoginWithAppleRequestCopyWithImpl(this._self, this._then);

  final _LoginWithAppleRequest _self;
  final $Res Function(_LoginWithAppleRequest) _then;

/// Create a copy of LoginWithAppleRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serverAuthCode = null,Object? rawNonce = null,}) {
  return _then(_LoginWithAppleRequest(
serverAuthCode: null == serverAuthCode ? _self.serverAuthCode : serverAuthCode // ignore: cast_nullable_to_non_nullable
as String,rawNonce: null == rawNonce ? _self.rawNonce : rawNonce // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
