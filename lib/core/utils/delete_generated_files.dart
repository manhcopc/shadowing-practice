import 'dart:io';

import 'package:flutter/foundation.dart';

// Helper function để print chỉ trong debug mode
void _debugPrint(String message) {
  debugPrint(message);
}

// Các đuôi file generate mà bạn muốn xóa
const List<String> generatedExtensions = [
  '.g.dart',
  '.freezed.dart',
  '.mocks.dart',
  '.gr.dart',
  '.config.dart',
];

// Hàm để lấy đường dẫn đến thư mục lib từ vị trí hiện tại
String getLibFolderPath() {
  // Lấy thư mục hiện tại của project (thư mục gốc)
  final currentDir = Directory.current;
  // Tạo đường dẫn đến thư mục lib
  return '${currentDir.path}${Platform.pathSeparator}lib';
}

// Hàm để kiểm tra và xóa file nếu nó là file generate
Future<void> deleteGeneratedFiles(String folderPath) async {
  final directory = Directory(folderPath);

  if (!await directory.exists()) {
    _debugPrint('Thư mục không tồn tại: $folderPath');
    return;
  }

  await for (final entity in directory.list(recursive: true)) {
    if (entity is File) {
      final fileName = entity.path.split(Platform.pathSeparator).last;

      // Kiểm tra nếu file có đuôi là một trong các đuôi file generate
      if (generatedExtensions.any((ext) => fileName.endsWith(ext))) {
        try {
          await entity.delete();
          _debugPrint('Deleted: ${entity.path}');
        } catch (e) {
          _debugPrint('Error deleting ${entity.path}: $e');
        }
      }
    }
  }
}

// Hàm main để chạy script
Future<void> main() async {
  _debugPrint('Bắt đầu xóa các file generated...');
  final libFolderPath = getLibFolderPath();
  _debugPrint('Đường dẫn thư mục lib: $libFolderPath');
  await deleteGeneratedFiles(libFolderPath);
  _debugPrint('Hoàn thành!');
}
