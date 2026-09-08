import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text.dart';

class AppButtonSendForm extends StatelessWidget {
  const AppButtonSendForm({
    super.key,
    this.onPressed,
    this.isEnableButton = false,
    this.isLoading = false,
    this.buttonText = 'Send',
  });
  final bool isEnableButton;
  final bool isLoading;
  final VoidCallback? onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 16.h),
        width: MediaQuery.of(context).size.width * 0.9,
        height: 50.h,
        child: ElevatedButton(
          onPressed: isEnableButton && !isLoading
              ? () {
                  // Ẩn bàn phím trước khi xử lý sự kiện
                  FocusScope.of(context).unfocus();

                  // Gọi hàm onPressed nếu không null
                  if (onPressed != null) {
                    onPressed!();
                  }
                }
              : null,
          style: ElevatedButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            backgroundColor: isEnableButton && !isLoading
                ? Theme.of(context).colorScheme.primary
                : Colors.grey,
            padding: EdgeInsets.symmetric(vertical: 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: isLoading
              ? SizedBox(
                  height: 20.h,
                  width: 20.w,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                )
              : AppText(
                  buttonText,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  textColor: Theme.of(context).colorScheme.onPrimary,
                ),
        ),
      ),
    );
  }
}
