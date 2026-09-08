// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CameraState {

// Fields từ CameraCubit cũ (backward compatibility)
 File? get imageFile;// Fields từ CameraCubitVersionNew
 bool get isProcessing; bool get showGalleryPermissionDialog; String? get resultPath; bool get isFlashOn; bool get isRearCamera; ScanMode get scanMode; bool get shouldCapture;
/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CameraStateCopyWith<CameraState> get copyWith => _$CameraStateCopyWithImpl<CameraState>(this as CameraState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraState&&(identical(other.imageFile, imageFile) || other.imageFile == imageFile)&&(identical(other.isProcessing, isProcessing) || other.isProcessing == isProcessing)&&(identical(other.showGalleryPermissionDialog, showGalleryPermissionDialog) || other.showGalleryPermissionDialog == showGalleryPermissionDialog)&&(identical(other.resultPath, resultPath) || other.resultPath == resultPath)&&(identical(other.isFlashOn, isFlashOn) || other.isFlashOn == isFlashOn)&&(identical(other.isRearCamera, isRearCamera) || other.isRearCamera == isRearCamera)&&(identical(other.scanMode, scanMode) || other.scanMode == scanMode)&&(identical(other.shouldCapture, shouldCapture) || other.shouldCapture == shouldCapture));
}


@override
int get hashCode => Object.hash(runtimeType,imageFile,isProcessing,showGalleryPermissionDialog,resultPath,isFlashOn,isRearCamera,scanMode,shouldCapture);

@override
String toString() {
  return 'CameraState(imageFile: $imageFile, isProcessing: $isProcessing, showGalleryPermissionDialog: $showGalleryPermissionDialog, resultPath: $resultPath, isFlashOn: $isFlashOn, isRearCamera: $isRearCamera, scanMode: $scanMode, shouldCapture: $shouldCapture)';
}


}

/// @nodoc
abstract mixin class $CameraStateCopyWith<$Res>  {
  factory $CameraStateCopyWith(CameraState value, $Res Function(CameraState) _then) = _$CameraStateCopyWithImpl;
@useResult
$Res call({
 File? imageFile, bool isProcessing, bool showGalleryPermissionDialog, String? resultPath, bool isFlashOn, bool isRearCamera, ScanMode scanMode, bool shouldCapture
});




}
/// @nodoc
class _$CameraStateCopyWithImpl<$Res>
    implements $CameraStateCopyWith<$Res> {
  _$CameraStateCopyWithImpl(this._self, this._then);

  final CameraState _self;
  final $Res Function(CameraState) _then;

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imageFile = freezed,Object? isProcessing = null,Object? showGalleryPermissionDialog = null,Object? resultPath = freezed,Object? isFlashOn = null,Object? isRearCamera = null,Object? scanMode = null,Object? shouldCapture = null,}) {
  return _then(_self.copyWith(
imageFile: freezed == imageFile ? _self.imageFile : imageFile // ignore: cast_nullable_to_non_nullable
as File?,isProcessing: null == isProcessing ? _self.isProcessing : isProcessing // ignore: cast_nullable_to_non_nullable
as bool,showGalleryPermissionDialog: null == showGalleryPermissionDialog ? _self.showGalleryPermissionDialog : showGalleryPermissionDialog // ignore: cast_nullable_to_non_nullable
as bool,resultPath: freezed == resultPath ? _self.resultPath : resultPath // ignore: cast_nullable_to_non_nullable
as String?,isFlashOn: null == isFlashOn ? _self.isFlashOn : isFlashOn // ignore: cast_nullable_to_non_nullable
as bool,isRearCamera: null == isRearCamera ? _self.isRearCamera : isRearCamera // ignore: cast_nullable_to_non_nullable
as bool,scanMode: null == scanMode ? _self.scanMode : scanMode // ignore: cast_nullable_to_non_nullable
as ScanMode,shouldCapture: null == shouldCapture ? _self.shouldCapture : shouldCapture // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CameraState].
extension CameraStatePatterns on CameraState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CameraState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CameraState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CameraState value)  $default,){
final _that = this;
switch (_that) {
case _CameraState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CameraState value)?  $default,){
final _that = this;
switch (_that) {
case _CameraState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( File? imageFile,  bool isProcessing,  bool showGalleryPermissionDialog,  String? resultPath,  bool isFlashOn,  bool isRearCamera,  ScanMode scanMode,  bool shouldCapture)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CameraState() when $default != null:
return $default(_that.imageFile,_that.isProcessing,_that.showGalleryPermissionDialog,_that.resultPath,_that.isFlashOn,_that.isRearCamera,_that.scanMode,_that.shouldCapture);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( File? imageFile,  bool isProcessing,  bool showGalleryPermissionDialog,  String? resultPath,  bool isFlashOn,  bool isRearCamera,  ScanMode scanMode,  bool shouldCapture)  $default,) {final _that = this;
switch (_that) {
case _CameraState():
return $default(_that.imageFile,_that.isProcessing,_that.showGalleryPermissionDialog,_that.resultPath,_that.isFlashOn,_that.isRearCamera,_that.scanMode,_that.shouldCapture);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( File? imageFile,  bool isProcessing,  bool showGalleryPermissionDialog,  String? resultPath,  bool isFlashOn,  bool isRearCamera,  ScanMode scanMode,  bool shouldCapture)?  $default,) {final _that = this;
switch (_that) {
case _CameraState() when $default != null:
return $default(_that.imageFile,_that.isProcessing,_that.showGalleryPermissionDialog,_that.resultPath,_that.isFlashOn,_that.isRearCamera,_that.scanMode,_that.shouldCapture);case _:
  return null;

}
}

}

/// @nodoc


class _CameraState implements CameraState {
  const _CameraState({this.imageFile, this.isProcessing = false, this.showGalleryPermissionDialog = false, this.resultPath, this.isFlashOn = false, this.isRearCamera = true, this.scanMode = ScanMode.scanProduct, this.shouldCapture = false});
  

// Fields từ CameraCubit cũ (backward compatibility)
@override final  File? imageFile;
// Fields từ CameraCubitVersionNew
@override@JsonKey() final  bool isProcessing;
@override@JsonKey() final  bool showGalleryPermissionDialog;
@override final  String? resultPath;
@override@JsonKey() final  bool isFlashOn;
@override@JsonKey() final  bool isRearCamera;
@override@JsonKey() final  ScanMode scanMode;
@override@JsonKey() final  bool shouldCapture;

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CameraStateCopyWith<_CameraState> get copyWith => __$CameraStateCopyWithImpl<_CameraState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CameraState&&(identical(other.imageFile, imageFile) || other.imageFile == imageFile)&&(identical(other.isProcessing, isProcessing) || other.isProcessing == isProcessing)&&(identical(other.showGalleryPermissionDialog, showGalleryPermissionDialog) || other.showGalleryPermissionDialog == showGalleryPermissionDialog)&&(identical(other.resultPath, resultPath) || other.resultPath == resultPath)&&(identical(other.isFlashOn, isFlashOn) || other.isFlashOn == isFlashOn)&&(identical(other.isRearCamera, isRearCamera) || other.isRearCamera == isRearCamera)&&(identical(other.scanMode, scanMode) || other.scanMode == scanMode)&&(identical(other.shouldCapture, shouldCapture) || other.shouldCapture == shouldCapture));
}


@override
int get hashCode => Object.hash(runtimeType,imageFile,isProcessing,showGalleryPermissionDialog,resultPath,isFlashOn,isRearCamera,scanMode,shouldCapture);

@override
String toString() {
  return 'CameraState(imageFile: $imageFile, isProcessing: $isProcessing, showGalleryPermissionDialog: $showGalleryPermissionDialog, resultPath: $resultPath, isFlashOn: $isFlashOn, isRearCamera: $isRearCamera, scanMode: $scanMode, shouldCapture: $shouldCapture)';
}


}

/// @nodoc
abstract mixin class _$CameraStateCopyWith<$Res> implements $CameraStateCopyWith<$Res> {
  factory _$CameraStateCopyWith(_CameraState value, $Res Function(_CameraState) _then) = __$CameraStateCopyWithImpl;
@override @useResult
$Res call({
 File? imageFile, bool isProcessing, bool showGalleryPermissionDialog, String? resultPath, bool isFlashOn, bool isRearCamera, ScanMode scanMode, bool shouldCapture
});




}
/// @nodoc
class __$CameraStateCopyWithImpl<$Res>
    implements _$CameraStateCopyWith<$Res> {
  __$CameraStateCopyWithImpl(this._self, this._then);

  final _CameraState _self;
  final $Res Function(_CameraState) _then;

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imageFile = freezed,Object? isProcessing = null,Object? showGalleryPermissionDialog = null,Object? resultPath = freezed,Object? isFlashOn = null,Object? isRearCamera = null,Object? scanMode = null,Object? shouldCapture = null,}) {
  return _then(_CameraState(
imageFile: freezed == imageFile ? _self.imageFile : imageFile // ignore: cast_nullable_to_non_nullable
as File?,isProcessing: null == isProcessing ? _self.isProcessing : isProcessing // ignore: cast_nullable_to_non_nullable
as bool,showGalleryPermissionDialog: null == showGalleryPermissionDialog ? _self.showGalleryPermissionDialog : showGalleryPermissionDialog // ignore: cast_nullable_to_non_nullable
as bool,resultPath: freezed == resultPath ? _self.resultPath : resultPath // ignore: cast_nullable_to_non_nullable
as String?,isFlashOn: null == isFlashOn ? _self.isFlashOn : isFlashOn // ignore: cast_nullable_to_non_nullable
as bool,isRearCamera: null == isRearCamera ? _self.isRearCamera : isRearCamera // ignore: cast_nullable_to_non_nullable
as bool,scanMode: null == scanMode ? _self.scanMode : scanMode // ignore: cast_nullable_to_non_nullable
as ScanMode,shouldCapture: null == shouldCapture ? _self.shouldCapture : shouldCapture // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
