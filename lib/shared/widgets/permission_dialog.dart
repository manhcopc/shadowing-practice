import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../common/generated/colors.gen.dart';

enum PermissionType { camera, storage, microphone }

class PermissionDialog extends StatelessWidget {
  const PermissionDialog({
    super.key,
    required this.permissionType,
    this.onSettingsPressed,
  });

  final PermissionType permissionType;
  final VoidCallback? onSettingsPressed;

  @override
  Widget build(BuildContext context) {
    final permissionInfo = _getPermissionInfo(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildDialogContent(context, permissionInfo),
    );
  }

  Widget _buildDialogContent(BuildContext context, _PermissionInfo info) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20.r,
            offset: Offset(0, 10.h),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              color: info.color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(info.icon, size: 40.w, color: info.color),
          ),
          SizedBox(height: 20.h),

          // Title
          Text(
            info.title,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12.h),

          // Description
          Text(
            info.description,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),

          // Settings instruction
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Colors.grey[200]!, width: 1),
            ),
            child: Text(
              info.settingsPath,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey[700],
                fontFamily: 'monospace',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 24.h),

          // Buttons
          Row(
            children: [
              // Cancel button
              Expanded(
                child: TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      side: BorderSide(color: Colors.grey[300]!, width: 1),
                    ),
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),

              // Open Settings button
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    if (onSettingsPressed != null) {
                      onSettingsPressed!();
                    } else {
                      await openAppSettings();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: info.color,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Open Settings',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _PermissionInfo _getPermissionInfo(BuildContext context) {
    switch (permissionType) {
      case PermissionType.camera:
        return _PermissionInfo(
          icon: Icons.camera_alt_outlined,
          color: ColorName.secondary,
          title: 'Camera Permission Required',
          description:
              'This app needs camera permission to take photos. Please enable it in your device settings.',
          settingsPath: 'Settings > Apps > Skin Scanner > Camera',
        );
      case PermissionType.storage:
        return _PermissionInfo(
          icon: Icons.photo_library_outlined,
          color: Colors.green,
          title: 'Storage Permission Required',
          description:
              'This app needs storage permission to access your photos. Please enable it in your device settings.',
          settingsPath: 'Settings > Apps > Skin Scanner > Storage',
        );
      case PermissionType.microphone:
        return _PermissionInfo(
          icon: Icons.mic_outlined,
          color: Colors.orange,
          title: 'Microphone Permission Required',
          description:
              'This app needs microphone permission to use voice recognition features. Please enable it in your device settings.',
          settingsPath: 'Settings > Apps > Skin Scanner > Microphone',
        );
    }
  }

  /// Static method để show dialog dễ dàng
  static Future<void> show({
    required BuildContext context,
    required PermissionType permissionType,
    VoidCallback? onSettingsPressed,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => PermissionDialog(
        permissionType: permissionType,
        onSettingsPressed: onSettingsPressed,
      ),
    );
  }
}

class _PermissionInfo {
  final IconData icon;
  final Color color;
  final String title;
  final String description;
  final String settingsPath;

  const _PermissionInfo({
    required this.icon,
    required this.color,
    required this.title,
    required this.description,
    required this.settingsPath,
  });
}
