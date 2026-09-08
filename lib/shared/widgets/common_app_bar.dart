import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';

import '../../common/generated/colors.gen.dart';
import 'app_text.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool centerTitle;
  final VoidCallback? onBackPressed;

  const CommonAppBar({
    super.key,
    required this.title,
    this.actions,
    this.centerTitle = true,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return AppBar(
      backgroundColor: theme.appBarTheme.backgroundColor,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      centerTitle: centerTitle,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          size: 20.sp,
          color: isDark ? ColorName.textBodyDark : ColorName.textBodyLight,
        ),
        onPressed: onBackPressed ?? () => context.router.maybePop(),
      ),
      title: AppText(
        title,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        textColor: isDark ? ColorName.textBodyDark : ColorName.textBodyLight,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
