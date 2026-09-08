// app.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'core/language/lang_cubit.dart';
import 'core/language/generated/l10n.dart';
import 'common/constants/constants.dart';
import 'core/locators/locator.dart';
import 'core/services/dialog/dialog_service.dart';
import 'core/services/switch_theme/switch_theme_cubit.dart';
import 'shared/themes/dark_mode.dart';
import 'shared/themes/light_mode.dart';
import 'initializer.dart';

/**
 *  Ứng dụng chính:
 * - Khởi tạo responsive (ScreenUtil)
 * - Chờ DI sẵn sàng rồi build MaterialApp.router
 * - Tích hợp Talker, SmartDialog, Localizations, Theme/Locale
 */
/// [App] root widget
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return _buildWithProviders(child: _AppContent());
      },
    );
  }
}

/// Bọc các Repository/Bloc providers ở một chỗ cho gọn
Widget _buildWithProviders({required Widget child}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => langCubit),
      BlocProvider(create: (_) => splashCubit),
      BlocProvider(create: (_) => themeCubit),
      BlocProvider(create: (_) => authCubit),
      BlocProvider(create: (_) => cameraCubit),
    ],
    child: child,
  );
}

/// Phần App chính sau khi DI đã sẵn sàng
class _AppContent extends StatelessWidget {
  const _AppContent();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => primaryFocus?.unfocus(), // Ẩn bàn phím khi chạm ngoài
      child: BlocBuilder<LangCubit, Locale>(
        builder: (context, locale) {
          return BlocListener<SwitchThemeCubit, SwitchThemeState>(
            listener: (context, state) {
              // Update status bar khi theme thay đổi
              Initializer.instance.updateStatusBarTheme(state.themeMode);
            },
            child: BlocBuilder<SwitchThemeCubit, SwitchThemeState>(
              builder: (context, state) {
                return MaterialApp.router(
                  theme: lightMode, // Sử dụng theme lightMode
                  title: AppConstants.nameApp,
                  darkTheme: darkMode, // Sử dụng theme darkMode
                  themeMode: state.themeMode,
                  debugShowCheckedModeBanner: false, // Tắt banner debug
                  // 🌐 Localizations
                  supportedLocales: S.delegate.supportedLocales,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  locale: locale,

                  // 🧭 Router + Talker + AutoRoute observer
                  routerConfig: router.config(
                    navigatorObservers: () => [
                      FlutterSmartDialog.observer,
                      TalkerRouteObserver(talker),
                      autoRouteObserver,
                    ],
                  ),

                  // 🔔 SmartDialog + clamp text scale (thay vì tắt hẳn)
                  builder: FlutterSmartDialog.init(
                    toastBuilder: (msg) => AppToast(msg: msg),
                    loadingBuilder: (msg) => AppLoading(msg: msg),
                    builder: (context, child) {
                      final mq = MediaQuery.of(context);
                      final clamped = mq.textScaler.clamp(
                        minScaleFactor: 0.85,
                        maxScaleFactor: 1.30,
                      );
                      return MediaQuery(
                        data: mq.copyWith(textScaler: clamped),
                        child: child!,
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
