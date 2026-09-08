import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/generated/colors.gen.dart';
import '../../../shared/widgets/app_text.dart';

class SettingItem extends StatefulWidget {
  final IconData? icon;
  final String? svgPath;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? iconColor;

  const SettingItem({
    super.key,
    this.icon,
    this.svgPath,
    required this.title,
    this.subtitle,
    this.onTap,
    this.backgroundColor,
    this.iconColor,
  }) : assert(
         icon != null || svgPath != null,
         'Either icon or svgPath must be provided',
       );

  @override
  State<SettingItem> createState() => _SettingItemState();
}

class _SettingItemState extends State<SettingItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    _controller.reverse();
    widget.onTap?.call();
  }

  void _onTapCancel() {
    setState(() => _isPressed = false);
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final hasOnTap = widget.onTap != null;

    return GestureDetector(
      onTapDown: hasOnTap ? _onTapDown : null,
      onTapUp: hasOnTap ? _onTapUp : null,
      onTapCancel: hasOnTap ? _onTapCancel : null,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: widget.backgroundColor != null
                  ? [widget.backgroundColor!, widget.backgroundColor!]
                  : isDark
                  ? [
                      ColorName.surfaceDark,
                      ColorName.surfaceDark.withValues(alpha: 0.8),
                    ]
                  : [
                      ColorName.surfaceLight,
                      ColorName.surfaceLight.withValues(alpha: 0.95),
                    ],
            ),
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: _isPressed
                    ? (widget.iconColor ?? ColorName.primary).withValues(
                        alpha: 0.2,
                      )
                    : Colors.black.withValues(alpha: isDark ? 0.3 : 0.08),
                blurRadius: _isPressed ? 8.r : 15.r,
                offset: Offset(0, _isPressed ? 2.h : 4.h),
                spreadRadius: _isPressed ? -2.r : 0,
              ),
            ],
            border: Border.all(
              color: _isPressed
                  ? (widget.iconColor ?? ColorName.primary).withValues(
                      alpha: 0.3,
                    )
                  : (isDark ? ColorName.borderDark : ColorName.borderLight)
                        .withValues(alpha: 0.5),
              width: 1.5,
            ),
          ),
          child: Stack(
            children: [
              // Decorative circle in top right
              Positioned(
                top: -20.h,
                right: -20.w,
                child: Container(
                  width: 80.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        (widget.iconColor ?? ColorName.primary).withValues(
                          alpha: 0.05,
                        ),
                        (widget.iconColor ?? ColorName.primary).withValues(
                          alpha: 0.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Main content
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 20.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Icon container with gradient background
                      Container(
                        width: 56.w,
                        height: 56.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              (widget.iconColor ?? ColorName.primary)
                                  .withValues(alpha: 0.15),
                              (widget.iconColor ?? ColorName.primary)
                                  .withValues(alpha: 0.08),
                            ],
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: (widget.iconColor ?? ColorName.primary)
                                  .withValues(alpha: 0.2),
                              blurRadius: 8.r,
                              offset: Offset(0, 2.h),
                            ),
                          ],
                        ),
                        child: Center(
                          child: widget.svgPath != null
                              ? SvgPicture.asset(
                                  widget.svgPath!,
                                  width: 26.w,
                                  height: 26.h,
                                  colorFilter: ColorFilter.mode(
                                    widget.iconColor ?? ColorName.primary,
                                    BlendMode.srcIn,
                                  ),
                                )
                              : Icon(
                                  widget.icon,
                                  size: 26.sp,
                                  color: widget.iconColor ?? ColorName.primary,
                                ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      // Title
                      AppText(
                        widget.title,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        textColor: isDark
                            ? ColorName.textBodyDark
                            : ColorName.textBodyLight,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                      if (widget.subtitle != null) ...[
                        SizedBox(height: 4.h),
                        // Subtitle text
                        AppText(
                          widget.subtitle!,
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          textColor:
                              (isDark
                                      ? ColorName.textBodyDark
                                      : ColorName.textBodyLight)
                                  .withValues(alpha: 0.6),
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
