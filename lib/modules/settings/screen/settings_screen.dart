import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';

import '../../../common/generated/colors.gen.dart';
import '../../../core/app/app_router.dart';
import '../../../core/language/generated/l10n.dart';
import '../../../core/locators/locator.dart';
import '../../../shared/widgets/common_app_bar.dart';
import '../cubit/settings_cubit.dart';
import 'settings_body.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CommonAppBar(
        title: S.of(context).settings,
        actions: [
          // Logout Button
          IconButton(
            icon: Icon(
              Icons.logout,
              size: 20.sp,
              color: isDark ? ColorName.textBodyDark : ColorName.textBodyLight,
            ),
            onPressed: () {
              // Implement logout functionality here
              authCubit.logout();
              context.router.replaceAll([const MainRoute()]);
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => SettingsCubit(),
        child: const SettingsBody(),
      ),
    );
  }
}
