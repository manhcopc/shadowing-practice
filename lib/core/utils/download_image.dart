import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;
import 'package:image/image.dart' as img;
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

import 'logger.dart';

Future<File> cacheAvatarImage(String url) async {
  final directory = await getTemporaryDirectory();

  // Generate a unique file name using URL and timestamp
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  final fileName = 'cached_avatar_${url.hashCode}_$timestamp.jpg';
  final filePath = path.join(directory.path, fileName);
  final file = File(filePath);

  logger.d('Downloading and caching avatar from $url');
  try {
    Dio dio = Dio();
    Response response = await dio.get(
      url,
      options: Options(responseType: ResponseType.bytes),
    );
    await file.writeAsBytes(response.data);
    logger.d('Avatar cached at $filePath');

    // Kiểm tra tính hợp lệ của ảnh
    if (!await isValidImage(file)) {
      logger.e(
        'Downloaded file is not a valid image. Replacing with default asset.',
      );
      return await replaceWithDefaultAsset(file);
    }

    return file;
  } catch (e) {
    logger.e('Failed to cache avatar: $e. Replacing with default asset.');
    return await replaceWithDefaultAsset(file);
  }
}

Future<File> replaceWithDefaultAsset(File file) async {
  try {
    final bytes = await rootBundle.load('assets/images/default_avatar.jpg');
    await file.writeAsBytes(bytes.buffer.asUint8List());
    logger.d('Replaced invalid file with default asset at ${file.path}');
    return file;
  } catch (e) {
    logger.e('Failed to replace with default asset: $e');
    throw Exception('Failed to replace with default asset');
  }
}

Future<bool> isValidImage(File file) async {
  try {
    final bytes = await file.readAsBytes();
    final image = img.decodeImage(bytes);
    return image != null; // Trả về true nếu tệp là ảnh hợp lệ
  } catch (e) {
    logger.e('Error validating image file: $e');
    return false; // Trả về false nếu không thể đọc được ảnh
  }
}

Future<void> clearOldCache(String url) async {
  final directory = await getTemporaryDirectory();
  final files = directory.listSync();

  for (var file in files) {
    if (file is File && file.path.contains('cached_avatar_${url.hashCode}')) {
      await file.delete();
      logger.d('Deleted old cached file: ${file.path}');
    }
  }
}

Future<void> clearAllCache() async {
  final directory = await getTemporaryDirectory();
  final files = directory.listSync();

  for (var file in files) {
    if (file is File && file.path.contains('cached_avatar_')) {
      await file.delete();
      logger.d('Deleted cached file: ${file.path}');
    }
  }
}
