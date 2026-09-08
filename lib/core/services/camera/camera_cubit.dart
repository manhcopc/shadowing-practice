import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

part 'camera_state.dart';
part 'camera_cubit.freezed.dart';

/// Typedef cho cropper function
typedef Cropper = Future<String?> Function(String sourcePath);

/// Cubit quản lý camera và image selection
///
/// Hỗ trợ cả 2 use cases:
/// - Simple mode: Chọn ảnh từ camera/gallery (dùng cho profile)
/// - Advanced mode: Scan với flash, camera switching, crop, etc. (dùng cho scan module)
@singleton
class CameraCubit extends Cubit<CameraState> {
  final ImagePicker _picker = ImagePicker();

  CameraCubit() : super(const CameraState());

  // ===== Backward Compatibility Methods (từ CameraCubit cũ) =====

  /// Lấy image file hiện tại (backward compatibility)
  File? get getImageFile => state.imageFile;

  /// Set image file (backward compatibility)
  ///
  /// Tương đương với CameraState.loaded() trong version cũ
  void setImageFile(File imageFile) {
    emit(state.copyWith(imageFile: imageFile));
  }

  /// Clear image file (backward compatibility)
  ///
  /// Tương đương với CameraState.initial() trong version cũ
  void clearImageFile() {
    emit(state.copyWith(imageFile: null));
  }

  // ===== Advanced Methods (từ CameraCubitVersionNew) =====

  /// Dismiss permission dialog
  void dismissPermissionDialog() {
    if (state.showGalleryPermissionDialog) {
      emit(state.copyWith(showGalleryPermissionDialog: false));
    }
  }

  /// Set processing state
  void setProcessing(bool value) => emit(state.copyWith(isProcessing: value));

  /// Toggle flash
  void toggleFlash(bool value) => emit(state.copyWith(isFlashOn: value));

  /// Set flash
  void setFlash(bool value) => emit(state.copyWith(isFlashOn: value));

  /// Toggle camera (front/rear)
  void toggleCamera() =>
      emit(state.copyWith(isRearCamera: !state.isRearCamera));

  /// Set rear camera
  void setRearCamera(bool value) => emit(state.copyWith(isRearCamera: value));

  /// Set scan mode
  void setScanMode(ScanMode mode) => emit(state.copyWith(scanMode: mode));

  /// Process captured path với cropper
  Future<void> processCapturedPath(
    String filePath, {
    required Cropper cropper,
  }) async {
    try {
      final cropped = await cropper(filePath);
      if (cropped != null) {
        emit(state.copyWith(resultPath: cropped));
      }
    } finally {
      emit(state.copyWith(isProcessing: false));
    }
  }

  /// Pick image từ gallery với cropper
  ///
  /// Chỉ chọn 1 ảnh duy nhất từ gallery (không hỗ trợ chọn nhiều ảnh).
  /// Sử dụng [ImagePicker.pickImage] để đảm bảo chỉ chọn 1 ảnh.
  ///
  /// **Lưu ý**: Không cần kiểm tra quyền trước vì:
  /// - Android 13+ (API 33+): `image_picker` tự động sử dụng Photo Picker API (không cần quyền storage)
  /// - Android <13: `image_picker` sẽ tự động xử lý quyền khi cần
  /// Tương tự như cách post module xử lý (gọi trực tiếp pickMultiImage không cần kiểm tra quyền)
  Future<void> pickFromGallery({required Cropper cropper}) async {
    emit(state.copyWith(isProcessing: true));

    try {
      // pickImage chỉ chọn 1 ảnh (trả về XFile?, không phải List<XFile>)
      // image_picker tự động xử lý quyền và sử dụng Photo Picker API trên Android 13+
      final picked = await _picker.pickImage(source: ImageSource.gallery);
      if (picked != null) {
        final cropped = await cropper(picked.path);
        if (cropped != null) {
          emit(state.copyWith(resultPath: cropped));
        }
      }
    } catch (e) {
      // Nếu có lỗi (ví dụ: quyền bị từ chối), có thể hiển thị dialog
      // Nhưng thông thường image_picker sẽ tự xử lý
      emit(state.copyWith(showGalleryPermissionDialog: true));
    } finally {
      emit(state.copyWith(isProcessing: false));
    }
  }

  /// Consume result path (clear sau khi đã xử lý)
  void consumeResult() {
    if (state.resultPath != null) {
      emit(state.copyWith(resultPath: null));
    }
  }

  /// Trigger capture từ FAB
  void triggerCapture() {
    emit(state.copyWith(shouldCapture: true));
  }

  /// Reset capture flag sau khi đã xử lý
  void resetCaptureFlag() {
    if (state.shouldCapture) {
      emit(state.copyWith(shouldCapture: false));
    }
  }
}
