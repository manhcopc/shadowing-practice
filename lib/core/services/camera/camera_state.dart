part of 'camera_cubit.dart';

/// Scan mode cho camera
enum ScanMode { scanProduct, analyzeSkin }

@freezed
abstract class CameraState with _$CameraState {
  /// State với tất cả các fields
  ///
  /// Hỗ trợ cả 2 use cases:
  /// - Simple mode: Chỉ dùng imageFile (backward compatibility)
  /// - Advanced mode: Dùng tất cả fields cho scan module
  const factory CameraState({
    // Fields từ CameraCubit cũ (backward compatibility)
    File? imageFile,

    // Fields từ CameraCubitVersionNew
    @Default(false) bool isProcessing,
    @Default(false) bool showGalleryPermissionDialog,
    String? resultPath,
    @Default(false) bool isFlashOn,
    @Default(true) bool isRearCamera,
    @Default(ScanMode.scanProduct) ScanMode scanMode,
    @Default(false) bool shouldCapture,
  }) = _CameraState;
}
