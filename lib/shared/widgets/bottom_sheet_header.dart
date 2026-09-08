import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/generated/colors.gen.dart';
import 'app_text.dart';


/// Reusable header component for bottom sheets
/// Supports three styles: simple (title + close), withIcon (icon + title + close), dragHandle (drag handle + title)
class BottomSheetHeader extends StatelessWidget {
  /// Header title text
  final String title;

  /// Optional leading icon
  final IconData? leadingIcon;

  /// Whether to show drag handle instead of close button
  final bool showDragHandle;

  /// Whether to show close button (ignored if showDragHandle is true)
  final bool showCloseButton;

  /// Optional callback when close button is pressed
  final VoidCallback? onClose;

  /// Title font size (default: 20 for standard, 16 for drag handle)
  final double? titleFontSize;

  /// Title font weight
  final FontWeight titleFontWeight;

  /// Title letter spacing (used for drag handle style)
  final double? letterSpacing;

  /// Whether to uppercase the title (used for drag handle style)
  final bool uppercaseTitle;

  /// Title alignment (default: start)
  final TextAlign titleAlignment;

  const BottomSheetHeader({
    super.key,
    required this.title,
    this.leadingIcon,
    this.showDragHandle = false,
    this.showCloseButton = true,
    this.onClose,
    this.titleFontSize,
    this.titleFontWeight = FontWeight.bold,
    this.letterSpacing,
    this.uppercaseTitle = false,
    this.titleAlignment = TextAlign.start,
  });

  /// Factory constructor for drag handle style (like gender_bottom_sheet.dart)
  factory BottomSheetHeader.dragHandle({
    required String title,
    double? titleFontSize,
    FontWeight titleFontWeight = FontWeight.bold,
    double letterSpacing = 1.2,
    bool uppercaseTitle = true,
  }) {
    return BottomSheetHeader(
      title: title,
      showDragHandle: true,
      showCloseButton: false,
      titleFontSize: titleFontSize ?? 16,
      titleFontWeight: titleFontWeight,
      letterSpacing: letterSpacing,
      uppercaseTitle: uppercaseTitle,
      titleAlignment: TextAlign.center,
    );
  }

  /// Factory constructor for simple style (like bottom_sheet_language.dart)
  factory BottomSheetHeader.simple({
    required String title,
    VoidCallback? onClose,
    double? titleFontSize,
  }) {
    return BottomSheetHeader(
      title: title,
      showDragHandle: false,
      showCloseButton: true,
      onClose: onClose,
      titleFontSize: titleFontSize ?? 20,
    );
  }

  /// Factory constructor for icon style (like bottom_sheet_profile.dart)
  factory BottomSheetHeader.withIcon({
    required String title,
    required IconData icon,
    VoidCallback? onClose,
    double? titleFontSize,
  }) {
    return BottomSheetHeader(
      title: title,
      leadingIcon: icon,
      showDragHandle: false,
      showCloseButton: true,
      onClose: onClose,
      titleFontSize: titleFontSize ?? 22,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textColor = isDark ? ColorName.textBodyDark : ColorName.textBodyLight;

    if (showDragHandle) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: textColor.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(height: 20.h),
          // Title
          AppText(
            uppercaseTitle ? title.toUpperCase() : title,
            fontSize: titleFontSize ?? 16,
            fontWeight: titleFontWeight,
            textColor: ColorName.primary,
            letterSpacing: letterSpacing,
            textAlign: titleAlignment,
          ),
          SizedBox(height: 20.h),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Leading icon + title
        if (leadingIcon != null)
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorName.primary.withValues(alpha: 0.15),
                      ColorName.primary.withValues(alpha: 0.05),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(leadingIcon, size: 24.sp, color: ColorName.primary),
              ),
              SizedBox(width: 12.w),
              AppText(
                title,
                fontSize: titleFontSize ?? 22,
                fontWeight: titleFontWeight,
                textColor: textColor,
              ),
            ],
          )
        else
          // Simple title
          AppText(
            title,
            fontSize: titleFontSize ?? 20,
            fontWeight: titleFontWeight,
            textColor: textColor,
            maxLines: 1,
            enableAutoResize: true,
          ),

        // Close button
        if (showCloseButton)
          IconButton(
            onPressed: onClose ?? () => Navigator.of(context).pop(),
            icon: Icon(Icons.close_rounded, size: 24.w, color: textColor),
          ),
      ],
    );
  }
}
