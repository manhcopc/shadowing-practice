// initializer.dart
// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:isolate';
import 'dart:ui';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_flutter/talker_flutter.dart';

// 🔧 Cập nhật các import dưới đây theo cấu trúc dự án của bạn
import 'core/locators/di/getit_utils.dart';
import 'core/locators/locator.dart';
import 'data/local/shared_prefs/storage.dart';
import 'shared/widgets/app_text.dart';
import 'core/services/switch_theme/switch_theme_cubit.dart';

/// ============================================================================
/// Initializer
/// - Khởi tạo các SDK (Firebase, dotenv, v.v.)
/// - Cấu hình DI, Storage, ScreenUtil, định hướng màn hình
/// - Gắn observer cho Bloc (TalkerBlocObserver)
/// - Thiết lập hooks bắt lỗi toàn cục (FlutterError / PlatformDispatcher / Isolate)
/// - Thiết lập StatusBar, ErrorWidget
/// - Bọc trong runZonedGuarded để bắt lỗi "rơi tự do"
/// ============================================================================

class Initializer {
  Initializer._();
  static final Initializer _singleton = Initializer._();

  /// Singleton
  static Initializer get instance => _singleton;

  /// Hàm khởi tạo toàn ứng dụng.
  /// - [runApp] là callback để gọi `runApp(const MyApp())` sau khi init xong.
  void init(VoidCallback runApp) {
    runZonedGuarded<Future<void>>(
      () async {
        // Bắt buộc: đảm bảo binding đã sẵn sàng (plugins có thể cần)
        WidgetsFlutterBinding.ensureInitialized();

        // (Tuỳ dự án) Nếu .env được dùng cho config init, hãy load .env TRƯỚC khi dùng
        await dotenv.load(fileName: '.env');

        // Firebase config is optional for the local-first ECHO Ver1 flow.
        final firebaseReady = await _tryInitializeFirebase();
        if (firebaseReady) {
          await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
        }

        // Local storage (SharedPreferences, RxSharedPreferences, SecureStorage)
        await Storage.setup();

        // Dependency Injection (get_it / injectable)
        await GetItUtils.setup();

        // Thiết lập hooks bắt lỗi toàn cục (Flutter / Engine / Isolate)
        await _setupErrorHooks(talker);

        // Observer cho Bloc/Cubit → log lifecycle & events bằng Talker
        Bloc.observer = TalkerBlocObserver(talker: talker);

        // Giới hạn hướng màn hình (ví dụ: chỉ portraitUp)
        await preferredOrientations();

        // ScreenUtil cần đảm bảo có kích thước window trước khi dùng
        await ScreenUtil.ensureScreenSize();

        // Tuỳ biến StatusBar / NavigationBar theo theme
        final themeCubit = getIt<SwitchThemeCubit>();
        _initStatusBar(themeCubit);

        // UI lỗi mặc định (tránh hiển thị khung đỏ to tướng ở release)
        ErrorWidget.builder = (details) {
          return Material(
            color: Colors.transparent,
            child: Center(
              child: AppText(
                kDebugMode ? details.exceptionAsString() : 'Đã xảy ra lỗi',
                textAlign: TextAlign.center,
              ),
            ),
          );
        };

        // ✅ Toàn bộ init xong → chạy ứng dụng
        runApp();
      },
      // Fallback: nếu lỗi xảy ra ngoài try/catch
      (Object error, StackTrace stack) {
        // Nếu DI chưa sẵn sàng (chưa có Talker) → fallback ra console
        if (getIt.isRegistered<Talker>()) {
          getIt<Talker>().handle(error, stack);
        } else {
          FlutterError.dumpErrorToConsole(
            FlutterErrorDetails(exception: error, stack: stack),
          );
          if (kDebugMode) {
            print('Unhandled (pre-DI) error: $error');
          }
        }
      },
    );
  }

  Future<bool> _tryInitializeFirebase() async {
    try {
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp();
      }
      return true;
    } catch (error) {
      if (kDebugMode) {
        debugPrint('Firebase initialization skipped: $error');
      }
      return false;
    }
  }

  /// Tuỳ biến thanh trạng thái và thanh điều hướng hệ thống theo theme
  void _initStatusBar(SwitchThemeCubit themeCubit) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: SystemUiOverlay.values,
    );

    // Adapt theo theme hiện tại
    _updateSystemUIOverlayStyle(themeCubit.state.themeMode);
  }

  /// Cập nhật SystemUIOverlayStyle theo theme mode
  void _updateSystemUIOverlayStyle(ThemeMode themeMode) {
    final isDarkMode = themeMode == ThemeMode.dark;

    SystemChrome.setSystemUIOverlayStyle(
      isDarkMode
          ? SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness:
                  Brightness.light, // Icon sáng trên nền tối
              systemNavigationBarColor: const Color(0xFF121212), // Màu nền tối
              systemNavigationBarIconBrightness: Brightness.light, // Icon sáng
            )
          : SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness:
                  Brightness.dark, // Icon tối trên nền sáng
              systemNavigationBarColor: const Color(
                0xFFFFFFFF,
              ), // Màu nền trắng
              systemNavigationBarIconBrightness: Brightness.dark, // Icon tối
            ),
    );
  }

  /// Method public để update status bar khi theme thay đổi
  void updateStatusBarTheme(ThemeMode themeMode) {
    _updateSystemUIOverlayStyle(themeMode);
  }

  /// Khoá orientation theo nhu cầu (ở đây: chỉ portraitUp)
  static Future<void> preferredOrientations() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  /// Gắn hooks bắt lỗi toàn cục:
  /// - FlutterError.onError: lỗi xảy ra trong khuôn khổ Flutter
  /// - PlatformDispatcher.instance.onError: lỗi từ Engine (không qua Flutter zone)
  /// - Isolate.current.addErrorListener: lỗi không thuộc main zone (không áp dụng cho web)
  Future<void> _setupErrorHooks(
    Talker talker, {
    bool catchFlutterErrors = true,
  }) async {
    if (catchFlutterErrors) {
      FlutterError.onError = (FlutterErrorDetails details) async {
        _reportError(details.exception, details.stack, talker);
        // Ở debug vẫn hiển thị khung lỗi mặc định để dev dễ thấy stack
        if (kDebugMode) FlutterError.presentError(details);
      };
    }

    // Lỗi từ runtime engine (không qua zone của Flutter)
    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      _reportError(error, stack, talker);
      return true; // true = đã xử lý, chặn luồng mặc định
    };

    // Web không hỗ trợ Isolate error listener
    if (!kIsWeb) {
      Isolate.current.addErrorListener(
        RawReceivePort((dynamic pair) async {
          // pair = [error, stackTrace] ở dạng List<dynamic> (thường là String)
          final isolateError = pair as List<dynamic>;
          final err = isolateError.isNotEmpty ? isolateError.first : null;
          final st = isolateError.length > 1 ? isolateError.last : null;
          _reportError(
            err?.toString(),
            st == null ? null : StackTrace.fromString(st.toString()),
            talker,
          );
        }).sendPort,
      );
    }
  }

  /// Gửi lỗi đến Talker
  void _reportError(dynamic error, StackTrace? stackTrace, Talker talker) {
    // Tuỳ chiến lược: có thể push lên Sentry/Crashlytics tại đây
    talker.error('Unhandled Exception', error, stackTrace);
  }
}
