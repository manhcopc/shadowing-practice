// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ApiError _$ApiErrorFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'plain':
          return _Plain.fromJson(
            json
          );
                case 'server':
          return _Server.fromJson(
            json
          );
                case 'network':
          return _Network.fromJson(
            json
          );
                case 'internal':
          return _Internal.fromJson(
            json
          );
                case 'cancelled':
          return _Cancelled.fromJson(
            json
          );
                case 'unexpected':
          return _Unexpected.fromJson(
            json
          );
                case 'unauthorized':
          return _Unauthorized.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'ApiError',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$ApiError {



  /// Serializes this ApiError to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiError);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiError()';
}


}

/// @nodoc
class $ApiErrorCopyWith<$Res>  {
$ApiErrorCopyWith(ApiError _, $Res Function(ApiError) __);
}


/// Adds pattern-matching-related methods to [ApiError].
extension ApiErrorPatterns on ApiError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Plain value)?  plain,TResult Function( _Server value)?  server,TResult Function( _Network value)?  network,TResult Function( _Internal value)?  internal,TResult Function( _Cancelled value)?  cancelled,TResult Function( _Unexpected value)?  unexpected,TResult Function( _Unauthorized value)?  unauthorized,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Plain() when plain != null:
return plain(_that);case _Server() when server != null:
return server(_that);case _Network() when network != null:
return network(_that);case _Internal() when internal != null:
return internal(_that);case _Cancelled() when cancelled != null:
return cancelled(_that);case _Unexpected() when unexpected != null:
return unexpected(_that);case _Unauthorized() when unauthorized != null:
return unauthorized(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Plain value)  plain,required TResult Function( _Server value)  server,required TResult Function( _Network value)  network,required TResult Function( _Internal value)  internal,required TResult Function( _Cancelled value)  cancelled,required TResult Function( _Unexpected value)  unexpected,required TResult Function( _Unauthorized value)  unauthorized,}){
final _that = this;
switch (_that) {
case _Plain():
return plain(_that);case _Server():
return server(_that);case _Network():
return network(_that);case _Internal():
return internal(_that);case _Cancelled():
return cancelled(_that);case _Unexpected():
return unexpected(_that);case _Unauthorized():
return unauthorized(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Plain value)?  plain,TResult? Function( _Server value)?  server,TResult? Function( _Network value)?  network,TResult? Function( _Internal value)?  internal,TResult? Function( _Cancelled value)?  cancelled,TResult? Function( _Unexpected value)?  unexpected,TResult? Function( _Unauthorized value)?  unauthorized,}){
final _that = this;
switch (_that) {
case _Plain() when plain != null:
return plain(_that);case _Server() when server != null:
return server(_that);case _Network() when network != null:
return network(_that);case _Internal() when internal != null:
return internal(_that);case _Cancelled() when cancelled != null:
return cancelled(_that);case _Unexpected() when unexpected != null:
return unexpected(_that);case _Unauthorized() when unauthorized != null:
return unauthorized(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int? code,  String message)?  plain,TResult Function( int? code,  String message)?  server,TResult Function( int? code,  String message)?  network,TResult Function( String message)?  internal,TResult Function()?  cancelled,TResult Function()?  unexpected,TResult Function( String message)?  unauthorized,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Plain() when plain != null:
return plain(_that.code,_that.message);case _Server() when server != null:
return server(_that.code,_that.message);case _Network() when network != null:
return network(_that.code,_that.message);case _Internal() when internal != null:
return internal(_that.message);case _Cancelled() when cancelled != null:
return cancelled();case _Unexpected() when unexpected != null:
return unexpected();case _Unauthorized() when unauthorized != null:
return unauthorized(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int? code,  String message)  plain,required TResult Function( int? code,  String message)  server,required TResult Function( int? code,  String message)  network,required TResult Function( String message)  internal,required TResult Function()  cancelled,required TResult Function()  unexpected,required TResult Function( String message)  unauthorized,}) {final _that = this;
switch (_that) {
case _Plain():
return plain(_that.code,_that.message);case _Server():
return server(_that.code,_that.message);case _Network():
return network(_that.code,_that.message);case _Internal():
return internal(_that.message);case _Cancelled():
return cancelled();case _Unexpected():
return unexpected();case _Unauthorized():
return unauthorized(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int? code,  String message)?  plain,TResult? Function( int? code,  String message)?  server,TResult? Function( int? code,  String message)?  network,TResult? Function( String message)?  internal,TResult? Function()?  cancelled,TResult? Function()?  unexpected,TResult? Function( String message)?  unauthorized,}) {final _that = this;
switch (_that) {
case _Plain() when plain != null:
return plain(_that.code,_that.message);case _Server() when server != null:
return server(_that.code,_that.message);case _Network() when network != null:
return network(_that.code,_that.message);case _Internal() when internal != null:
return internal(_that.message);case _Cancelled() when cancelled != null:
return cancelled();case _Unexpected() when unexpected != null:
return unexpected();case _Unauthorized() when unauthorized != null:
return unauthorized(_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Plain extends ApiError {
  const _Plain({this.code, required this.message, final  String? $type}): $type = $type ?? 'plain',super._();
  factory _Plain.fromJson(Map<String, dynamic> json) => _$PlainFromJson(json);

 final  int? code;
 final  String message;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ApiError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlainCopyWith<_Plain> get copyWith => __$PlainCopyWithImpl<_Plain>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlainToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Plain&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message);

@override
String toString() {
  return 'ApiError.plain(code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class _$PlainCopyWith<$Res> implements $ApiErrorCopyWith<$Res> {
  factory _$PlainCopyWith(_Plain value, $Res Function(_Plain) _then) = __$PlainCopyWithImpl;
@useResult
$Res call({
 int? code, String message
});




}
/// @nodoc
class __$PlainCopyWithImpl<$Res>
    implements _$PlainCopyWith<$Res> {
  __$PlainCopyWithImpl(this._self, this._then);

  final _Plain _self;
  final $Res Function(_Plain) _then;

/// Create a copy of ApiError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = freezed,Object? message = null,}) {
  return _then(_Plain(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _Server extends ApiError {
  const _Server({this.code, required this.message, final  String? $type}): $type = $type ?? 'server',super._();
  factory _Server.fromJson(Map<String, dynamic> json) => _$ServerFromJson(json);

 final  int? code;
 final  String message;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ApiError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerCopyWith<_Server> get copyWith => __$ServerCopyWithImpl<_Server>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Server&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message);

@override
String toString() {
  return 'ApiError.server(code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ServerCopyWith<$Res> implements $ApiErrorCopyWith<$Res> {
  factory _$ServerCopyWith(_Server value, $Res Function(_Server) _then) = __$ServerCopyWithImpl;
@useResult
$Res call({
 int? code, String message
});




}
/// @nodoc
class __$ServerCopyWithImpl<$Res>
    implements _$ServerCopyWith<$Res> {
  __$ServerCopyWithImpl(this._self, this._then);

  final _Server _self;
  final $Res Function(_Server) _then;

/// Create a copy of ApiError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = freezed,Object? message = null,}) {
  return _then(_Server(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _Network extends ApiError {
  const _Network({this.code, required this.message, final  String? $type}): $type = $type ?? 'network',super._();
  factory _Network.fromJson(Map<String, dynamic> json) => _$NetworkFromJson(json);

 final  int? code;
 final  String message;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ApiError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NetworkCopyWith<_Network> get copyWith => __$NetworkCopyWithImpl<_Network>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NetworkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Network&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message);

@override
String toString() {
  return 'ApiError.network(code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class _$NetworkCopyWith<$Res> implements $ApiErrorCopyWith<$Res> {
  factory _$NetworkCopyWith(_Network value, $Res Function(_Network) _then) = __$NetworkCopyWithImpl;
@useResult
$Res call({
 int? code, String message
});




}
/// @nodoc
class __$NetworkCopyWithImpl<$Res>
    implements _$NetworkCopyWith<$Res> {
  __$NetworkCopyWithImpl(this._self, this._then);

  final _Network _self;
  final $Res Function(_Network) _then;

/// Create a copy of ApiError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = freezed,Object? message = null,}) {
  return _then(_Network(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _Internal extends ApiError {
  const _Internal(this.message, {final  String? $type}): $type = $type ?? 'internal',super._();
  factory _Internal.fromJson(Map<String, dynamic> json) => _$InternalFromJson(json);

 final  String message;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ApiError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InternalCopyWith<_Internal> get copyWith => __$InternalCopyWithImpl<_Internal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InternalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Internal&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ApiError.internal(message: $message)';
}


}

/// @nodoc
abstract mixin class _$InternalCopyWith<$Res> implements $ApiErrorCopyWith<$Res> {
  factory _$InternalCopyWith(_Internal value, $Res Function(_Internal) _then) = __$InternalCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$InternalCopyWithImpl<$Res>
    implements _$InternalCopyWith<$Res> {
  __$InternalCopyWithImpl(this._self, this._then);

  final _Internal _self;
  final $Res Function(_Internal) _then;

/// Create a copy of ApiError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Internal(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _Cancelled extends ApiError {
  const _Cancelled({final  String? $type}): $type = $type ?? 'cancelled',super._();
  factory _Cancelled.fromJson(Map<String, dynamic> json) => _$CancelledFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$CancelledToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cancelled);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiError.cancelled()';
}


}




/// @nodoc
@JsonSerializable()

class _Unexpected extends ApiError {
  const _Unexpected({final  String? $type}): $type = $type ?? 'unexpected',super._();
  factory _Unexpected.fromJson(Map<String, dynamic> json) => _$UnexpectedFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$UnexpectedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unexpected);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiError.unexpected()';
}


}




/// @nodoc
@JsonSerializable()

class _Unauthorized extends ApiError {
  const _Unauthorized(this.message, {final  String? $type}): $type = $type ?? 'unauthorized',super._();
  factory _Unauthorized.fromJson(Map<String, dynamic> json) => _$UnauthorizedFromJson(json);

 final  String message;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ApiError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnauthorizedCopyWith<_Unauthorized> get copyWith => __$UnauthorizedCopyWithImpl<_Unauthorized>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UnauthorizedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unauthorized&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ApiError.unauthorized(message: $message)';
}


}

/// @nodoc
abstract mixin class _$UnauthorizedCopyWith<$Res> implements $ApiErrorCopyWith<$Res> {
  factory _$UnauthorizedCopyWith(_Unauthorized value, $Res Function(_Unauthorized) _then) = __$UnauthorizedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$UnauthorizedCopyWithImpl<$Res>
    implements _$UnauthorizedCopyWith<$Res> {
  __$UnauthorizedCopyWithImpl(this._self, this._then);

  final _Unauthorized _self;
  final $Res Function(_Unauthorized) _then;

/// Create a copy of ApiError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Unauthorized(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
