import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import '/common/extensions/extensions.dart';

import '../../../common/generated/assets.gen.dart';
import '../../../shared/widgets/app_text.dart';
import '../../language/generated/l10n.dart';

class DialogService {
  DialogService._();

  // ----------------------------- TOAST -----------------------------
  static Future<void> toast(
    String msg, {
    bool debounce = true,
    Duration? displayTime,
    Color? maskColor,
    Widget? maskWidget,
    bool consumeEvent = false,
  }) async {
    await SmartDialog.showToast(
      msg,
      debounce: debounce,
      consumeEvent: consumeEvent,
      displayTime: displayTime,
      maskColor: maskColor,
      maskWidget: maskWidget,
      builder: (context) => AppToast(msg: msg, icon: maskWidget),
    );
  }

  // ---------------------------- LOADING ----------------------------
  static Future<void> showLoading({String? msg}) async {
    await SmartDialog.showLoading(msg: msg ?? 'Loading...');
  }

  static Future<void> dismissLoading() async {
    await SmartDialog.dismiss(status: SmartStatus.loading);
  }

  static Future<T> withLoading<T>(
    Future<T> Function() task, {
    String? msg,
  }) async {
    await showLoading(msg: msg);
    try {
      return await task();
    } finally {
      await dismissLoading();
    }
  }

  // ----------------------------- CONFIRM ----------------------------
  /// Dialog xác nhận đơn giản, trả về true/false
  static Future<bool> confirm({
    required String title,
    String? message,
    String? okText,
    String? cancelText,
    bool barrierDismissible = true,
    String tag = 'confirm_dialog',
    Widget? icon,
    double? titleFontSize,
    double? messageFontSize,
  }) async {
    final completer = Completer<bool>();

    await SmartDialog.show(
      tag: tag,
      keepSingle: true, // đảm bảo chỉ 1 confirm hiển thị
      clickMaskDismiss: barrierDismissible,
      builder: (context) => AppConfirmDialog(
        title: title,
        message: message,
        okText: okText ?? S.of(context).ok,
        cancelText: cancelText ?? S.of(context).cancel,
        icon: icon,
        titleFontSize: titleFontSize,
        messageFontSize: messageFontSize,
        onOk: () {
          if (!completer.isCompleted) completer.complete(true);
          SmartDialog.dismiss(tag: tag);
        },
        onCancel: () {
          if (!completer.isCompleted) completer.complete(false);
          SmartDialog.dismiss(tag: tag);
        },
      ),
    );

    return completer.future;
  }

  // ----------------------------- CUSTOM ----------------------------
  /// Show custom dialog nhẹ, có tag/keepSingle để chống trùng
  static Future<T?> showCustom<T>({
    required WidgetBuilder builder,
    String? tag,
    bool keepSingle = true,
    bool barrierDismissible = true,
    AlignmentGeometry alignment = Alignment.center,
    EdgeInsetsGeometry? margin,
    bool useAnimation = true,
    bool usePenetrate = false,
  }) {
    return SmartDialog.show<T>(
      tag: tag,
      keepSingle: keepSingle,
      clickMaskDismiss: barrierDismissible,
      useAnimation: useAnimation,
      usePenetrate: usePenetrate,
      builder: builder,
    );
  }

  // ----------------------------- ERROR ----------------------------
  /// Hiển thị dialog lỗi với các callback tùy chỉnh
  static Future<void> showError({
    required String title,
    required String content,
    bool isErrorNetwork = true,
    VoidCallback? onNetworkPressed,
    VoidCallback? onErrorPressed,
    String? titleButton,
    String tag = 'error_dialog',
    bool barrierDismissible = true,
  }) async {
    await showCustom(
      tag: tag,
      keepSingle: true,
      barrierDismissible: barrierDismissible,
      builder: (context) => AppErrorDialog(
        title: title,
        content: content,
        isErrorNetwork: isErrorNetwork,
        tag: tag,
        onNetworkPressed: onNetworkPressed,
        onErrorPressed: onErrorPressed,
        titleButton: titleButton,
      ),
    );
  }

  // ----------------------------- ATTACH ----------------------------
  /// Attach dialog bám theo 1 widget (cần BuildContext của widget đó)
  static Future<T?> showAttach<T>({
    required BuildContext targetContext,
    required WidgetBuilder builder,
    AlignmentGeometry alignment = Alignment.bottomCenter,
    bool barrierDismissible = true,
  }) {
    return SmartDialog.showAttach<T>(
      targetContext: targetContext,
      clickMaskDismiss: barrierDismissible,
      builder: builder,
    );
  }

  /// Attach qua GlobalKey để không phụ thuộc context tại chỗ gọi
  static Future<T?> showAttachWithKey<T>({
    required GlobalKey key,
    required WidgetBuilder builder,
    AlignmentGeometry alignment = Alignment.bottomCenter,
    bool barrierDismissible = true,
  }) {
    final ctx = key.currentContext;
    if (ctx == null) return Future.value();
    return showAttach(
      targetContext: ctx,
      builder: builder,
      alignment: alignment,
      barrierDismissible: barrierDismissible,
    );
  }

  // --------------------------- QUẢN LÝ OVERLAY ----------------------
  static Future<void> dismissTag(String tag) => SmartDialog.dismiss(tag: tag);

  static bool exists({String? tag}) => SmartDialog.checkExist(tag: tag);

  static Future<void> dismissAll() => SmartDialog.dismiss();
}

// ========================== WIDGETS NHẸ =============================

/// Toast mặc định: nhẹ, khởi tạo nhanh
class AppToast extends StatelessWidget {
  final String msg;
  final Widget? icon;
  const AppToast({super.key, required this.msg, this.icon});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: Container(
          constraints: const BoxConstraints(minWidth: 80, maxWidth: 320),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          margin: EdgeInsets.all(30.w),
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(blurRadius: 10, spreadRadius: -4, offset: Offset(0, 4)),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[icon!, SizedBox(width: 8.w)],
              if (icon == null) ...[
                Assets.images.logoApp.image(width: 32.w),
                SizedBox(width: 8.w),
              ],
              Flexible(
                child: AppText(
                  msg,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Loading mặc định: tối giản để CPU/GPU thấp
class AppLoading extends StatelessWidget {
  final String? msg;
  const AppLoading({super.key, this.msg});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(blurRadius: 18, spreadRadius: -8, offset: Offset(0, 8)),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2.6),
            ),
            if ((msg ?? '').isNotEmpty) ...[
              const SizedBox(width: 12),
              AppText(msg!),
            ],
          ],
        ),
      ),
    );
  }
}

/// Confirm dialog mặc định: tập trung vào tốc độ render & dễ đọc
class AppConfirmDialog extends StatelessWidget {
  final String title;
  final String? message;
  final String okText;
  final String cancelText;
  final VoidCallback onOk;
  final VoidCallback onCancel;
  final Widget? icon;
  final double? titleFontSize;
  final double? messageFontSize;

  const AppConfirmDialog({
    super.key,
    required this.title,
    this.message,
    required this.okText,
    required this.cancelText,
    required this.onOk,
    required this.onCancel,
    this.icon,
    this.titleFontSize,
    this.messageFontSize,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 260, maxWidth: 360),
        child: Material(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    icon ?? Icon(Icons.help_outline, size: 28.w),
                    Expanded(
                      child: AppText(
                        title,
                        fontWeight: FontWeight.w600,
                        fontSize: titleFontSize ?? 16,
                      ),
                    ),
                    SizedBox(width: 28.w),
                  ],
                ),
                if ((message ?? '').isNotEmpty) ...[
                  const SizedBox(height: 12),
                  AppText(
                    message!,
                    fontSize: messageFontSize ?? 14,
                    textAlign: TextAlign.start,
                    textColor: Colors.grey,
                  ),
                ],
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: onCancel, child: AppText(cancelText)),
                    const SizedBox(width: 4),
                    ElevatedButton(
                      onPressed: onOk,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                      ),
                      child: AppText(okText, textColor: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Error dialog: hiển thị lỗi với tùy chọn retry hoặc đóng
class AppErrorDialog extends StatelessWidget {
  final String title;
  final String content;
  final bool isErrorNetwork;
  final String tag;
  final VoidCallback? onNetworkPressed;
  final VoidCallback? onErrorPressed;
  final String? titleButton;

  const AppErrorDialog({
    super.key,
    required this.title,
    required this.content,
    this.isErrorNetwork = true,
    required this.tag,
    this.onNetworkPressed,
    this.onErrorPressed,
    this.titleButton,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.icons.icError.image(width: 60, height: 60),
            const SizedBox(height: 16),
            AppText(title, fontSize: 20, fontWeight: FontWeight.w700),
            const SizedBox(height: 8),
            AppText(
              content,
              textColor: Colors.grey[600],
              fontSize: 14,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (!isErrorNetwork)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: OutlinedButton(
                        onPressed: () => SmartDialog.dismiss(tag: tag),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: AppText(
                          S.of(context).cancel,
                          textColor: Colors.red,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (isErrorNetwork) {
                        onNetworkPressed?.call();
                      } else {
                        onErrorPressed?.call();
                      }
                      SmartDialog.dismiss(tag: tag);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: AppText(
                      titleButton ?? S.of(context).exit,
                      textColor: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Dialog với hai nút: Cancel và một nút tùy chỉnh (thường là Open Settings)
class AppDialogWithTwoButton extends StatelessWidget {
  final String title;
  final String titleButton;
  final Widget? icon;
  final VoidCallback onTap;
  final Widget child;
  final String? tag;

  const AppDialogWithTwoButton({
    super.key,
    required this.title,
    required this.titleButton,
    this.icon,
    required this.onTap,
    required this.child,
    this.tag,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 260.w, maxWidth: 360.w),
        child: Material(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(20.r),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 18.h, 20.w, 12.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (icon != null) ...[icon!, SizedBox(width: 12.w)],
                    Expanded(
                      child: AppText(
                        title,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                child,
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Hỗ trợ cả showDialog và SmartDialog.show()
                        if (tag != null) {
                          SmartDialog.dismiss(tag: tag);
                        } else {
                          Navigator.of(context).pop();
                        }
                      },
                      child: AppText(S.of(context).cancel, fontSize: 14.sp),
                    ),
                    SizedBox(width: 8.w),
                    ElevatedButton(
                      onPressed: () {
                        onTap();
                        // Hỗ trợ cả showDialog và SmartDialog.show()
                        if (tag != null) {
                          SmartDialog.dismiss(tag: tag);
                        } else {
                          Navigator.of(context).pop();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                      ),
                      child: AppText(
                        titleButton,
                        textColor: Colors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
