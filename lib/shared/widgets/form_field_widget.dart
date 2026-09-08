import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/common/extensions/context_x.dart';

class FormFieldWidget extends StatefulWidget {
  const FormFieldWidget({
    super.key,
    required this.controller,
    required this.textError,
    required this.label,
    required this.onTextChanged, // 👈 Định nghĩa kiểu callback đúng
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String? textError;
  final String label;
  final ValueChanged<String> onTextChanged; // 👈 Sử dụng ValueChanged<String>
  final int? maxLines;

  @override
  State<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  late final FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: widget.controller,
      builder: (context, value, child) {
        final bool hasText = value.text.isNotEmpty;
        final bool isError = widget.textError != null;

        return TextField(
          controller: widget.controller,
          focusNode: _focusNode,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            labelText: widget.label,
            alignLabelWithHint: true,
            suffixIcon: hasText && _isFocused
                ? IconButton(
                    icon: Icon(
                      Icons.clear,
                      size: 20.r,
                      color: context.colorScheme.onSurface.withValues(
                        alpha: 0.6,
                      ),
                    ),
                    onPressed: () {
                      widget.controller.clear();
                      widget.onTextChanged('');
                    },
                  )
                : null,
            suffixIconConstraints: BoxConstraints(
              minHeight: 40.h,
              minWidth: 40.w,
            ),
            labelStyle: TextStyle(
              fontSize: 14.sp,
              color: isError
                  ? context.colorScheme.error
                  : hasText
                  ? context.colorScheme.primary
                  : context.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
            errorStyle: TextStyle(
              fontSize: 12.sp,
              color: context.colorScheme.error,
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 16.h,
              horizontal: 16.w,
            ),
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
              borderSide: BorderSide(
                color: context.colorScheme.error,
                width: 1.5,
              ),
            ),
            // Border khi focus và có lỗi
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: context.colorScheme.error,
                width: 2.0,
              ),
            ),
            errorText: widget.textError,
          ),
          style: TextStyle(
            fontSize: 14.sp,
            color: context.colorScheme.onSurface, // Text màu trắng
          ),
          onChanged: (value) {
            widget.onTextChanged(value);
          },
        );
      },
    );
  }
}
