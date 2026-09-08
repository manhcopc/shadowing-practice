import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/common/extensions/context_x.dart';

import '../../core/language/generated/l10n.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? errorText;
  final String? hint;
  final ValueChanged<String> onChanged;

  const PasswordTextField({
    super.key,
    required this.controller,
    this.errorText,
    required this.onChanged,
    this.hint,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: obscurePassword,
      decoration: InputDecoration(
        labelText: widget.hint ?? S.of(context).password,
        labelStyle: TextStyle(
          fontSize: 14.sp,
          color: widget.errorText != null
              ? context.colorScheme.error
              : widget.controller.text.isNotEmpty
              ? context.colorScheme.primary
              : context.colorScheme.onSurface.withValues(alpha: 0.5),
        ),
        errorStyle: TextStyle(
          fontSize: 12.sp,
          color: context.colorScheme.error,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        filled: true,
        fillColor: context.colorScheme.surface, // Nền đen như trong hình
        // Border khi không focus và không có lỗi
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: context.colorScheme.primary.withValues(
              alpha: 0.3,
            ), // Border rất mờ
            width: 1.0,
          ),
        ),
        // Border khi đang focus
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: context.colorScheme.primary.withValues(
              alpha: 0.3,
            ), // Border sáng hơn một chút khi focus
            width: 1.5,
          ),
        ),
        // Border khi có lỗi
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: context.colorScheme.error, width: 1.5),
        ),
        // Border khi focus và có lỗi
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: context.colorScheme.error, width: 2.0),
        ),
        errorText: widget.errorText,
        suffixIcon: IconButton(
          icon: Icon(
            obscurePassword ? Icons.visibility_off : Icons.visibility,
            size: 22.r,
          ),
          onPressed: () {
            setState(() {
              obscurePassword = !obscurePassword;
            });
          },
        ),
      ),
      style: TextStyle(
        fontSize: 14.sp,
        color: context.colorScheme.onSurface, // Text màu trắng
      ),
      onChanged: widget.onChanged,
    );
  }
}
