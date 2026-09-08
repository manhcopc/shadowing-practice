import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_view/photo_view.dart';

import '../../core/services/dialog/dialog_service.dart';

class FullScreenImage extends StatefulWidget {
  final String imageUrl;
  final File? imageFile;
  final bool isNetworkImage;

  const FullScreenImage({
    super.key,
    this.imageUrl = '',
    this.imageFile,
    this.isNetworkImage = true,
  });

  @override
  State<FullScreenImage> createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  bool isLandscape = false;

  // Kiểm tra và yêu cầu quyền truy cập vào thư viện ảnh
  Future<void> _requestPermission() async {
    var status = await Permission.photos.request();
    if (!status.isGranted) {
      await Permission.photos.request();
    }
  }

  // Hàm tải và lưu ảnh vào thư viện ảnh của điện thoại
  Future<void> _downloadAndSaveImage(BuildContext context) async {
    await _requestPermission();

    try {
      if (widget.isNetworkImage) {
        // Download from network
        Dio dio = Dio();
        Response response = await dio.get(
          widget.imageUrl,
          options: Options(responseType: ResponseType.bytes),
        );

        Uint8List imageBytes = Uint8List.fromList(response.data as List<int>);
        await _saveImage(imageBytes);
      } else if (widget.imageFile != null) {
        // Save from local file
        Uint8List imageBytes = await widget.imageFile!.readAsBytes();
        await _saveImage(imageBytes);
      }
    } catch (e) {
      DialogService.toast('Failed to save image: $e');
    }
  }

  // Save image to gallery
  Future<void> _saveImage(Uint8List imageBytes) async {
    String filename = 'image_${DateTime.now().millisecondsSinceEpoch}.jpg';
    await PhotoManager.editor.saveImage(imageBytes, filename: filename);

    DialogService.toast('Image saved to gallery');
  }

  // Chuyển đổi giữa chế độ ngang và dọc
  void _toggleOrientation() {
    if (isLandscape) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }

    setState(() {
      isLandscape = !isLandscape;
    });
  }

  @override
  void dispose() {
    // Khôi phục hướng màn hình khi thoát khỏi màn hình
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PhotoView(
          imageProvider: widget.isNetworkImage
              ? NetworkImage(widget.imageUrl)
              : FileImage(widget.imageFile!) as ImageProvider,
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 2,
          backgroundDecoration: const BoxDecoration(color: Colors.black),
          errorBuilder: (context, error, stackTrace) {
            return Center(
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).colorScheme.onSurface,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.broken_image, color: Colors.red, size: 50),
                    Text(
                      'Failed to load image',
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        Positioned(
          top: 40.0,
          left: 16.0,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.close, color: Colors.white, size: 20.r),
          ),
        ),
        Positioned(
          top: 40.0,
          right: 16.0,
          child: GestureDetector(
            onTap: () {
              _downloadAndSaveImage(context);
            },
            child: Icon(Icons.download, color: Colors.white, size: 20.r),
          ),
        ),
        Positioned(
          bottom: 40.0,
          right: 16.0,
          child: GestureDetector(
            onTap: _toggleOrientation,
            child: Icon(
              isLandscape ? Icons.screen_rotation : Icons.screen_lock_rotation,
              color: Colors.white,
              size: 20.r,
            ),
          ),
        ),
      ],
    );
  }
}
