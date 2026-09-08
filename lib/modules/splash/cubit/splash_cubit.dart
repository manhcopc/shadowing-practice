import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '/common/extensions/string_x.dart';

import '../../../core/app/app_router.dart';
import '../../../core/locators/locator.dart';
import '../../../core/utils/logger.dart';
import '../../../core/utils/utility.dart';
import '../../../data/local/shared_prefs/storage.dart';
import '../../auth/models/request/refresh_token_request.dart';
import '../../profile/models/user_model.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

@singleton
class SplashCubit extends Cubit<SplashState> {
  StreamSubscription<int>? _tickerSubscription;
  static const int _splashDuration = 1; // Set splash duration to 1 second
  Timer? _timer;

  SplashCubit() : super(SplashState.initial());

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    _timer?.cancel();
    return super.close();
  }

  /// 🔄 Hàm khởi tạo
  void initialize(BuildContext context) async {
    final isConnected = await _checkInternetConnection();
    if (!isConnected) {
      logger.i('SPLASH CUBIT: No internet connection');
    }

    if (Storage.userDefault == null) {
      logger.i('SPLASH CUBIT: Creating new userDefault');
      await _createUserDefault();
    }

    await _checkToken(context);

    await Storage.incrementAppLaunchCount();

    // Load products và filters sau khi check token thành công
    await _loadInitialData();
  }

  /// Load products và filters data khi khởi tạo app
  Future<void> _loadInitialData() async {
    try {
      logger.i('SPLASH CUBIT: Loading initial products and filters...');
      // Load filters và products song song để tối ưu thời gian
      await Future.wait([]);

      logger.i(
        'SPLASH CUBIT: Initial products and filters loaded successfully',
      );
    } catch (e) {
      logger.e('SPLASH CUBIT: Failed to load initial data: ${e.toString()}');
      // Không block app nếu load products thất bại
    }
  }

  /// 🛜 Hàm kiểm tra kết nối mạng
  Future<bool> _checkInternetConnection() async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    return connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi);
  }

  /// 🕒 Hàm bắt đầu timer cho splash screen
  void _startSplashTimer(BuildContext context, PageRouteInfo route) {
    // Start the timer for splash screen
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int remaining = _splashDuration - timer.tick;
      if (remaining > 0) {
        emit(_RunInProgress(remaining));
      } else {
        _moveToApp(context, route);
      }
    });
  }

  /// 🔄 Hàm chuyển đến app
  void _moveToApp(BuildContext context, PageRouteInfo route) {
    context.router.replace(route);
    _timer?.cancel();
  }

  /// 🔄 Hàm tạo userDefault
  Future<void> _createUserDefault() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String deviceName = "";
    String deviceId = "";

    if (Platform.isAndroid) {
      // Android
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceName = androidInfo.model; // Lấy tên mô hình thiết bị Android
      deviceId = await Utility.getStableId(); // Lấy Android ID
    } else if (Platform.isIOS) {
      // iOS
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceName = iosInfo.name; // Tên thiết bị iOS
      deviceId = await Utility.getStableId(); // Lấy iOS ID
    }

    final userDefault = UserModel(userId: deviceId, displayName: deviceName);

    logger.i(
      'SPLASH BLOC: Creating new userDefault with Device Name: $deviceName',
    );
    logger.i('SPLASH BLOC: Creating new userDefault with Device ID: $deviceId');

    Storage.setDeviceId(deviceId);
    Storage.setDeviceName(deviceName);
    Storage.setUserDefault(userDefault);
  }

  Future<void> _checkToken(BuildContext context) async {
    final accessToken = await authRepository.getAccessToken();
    final refreshToken = await authRepository.getRefreshToken();
    if (accessToken == null ||
        refreshToken == null ||
        accessToken == "" ||
        refreshToken == "") {
      logger.i('SPLASH BLOC: Access token or refresh token is null');
      _startSplashTimer(context, _initialEchoRoute());
    } else if (accessToken.isTokenExpired()) {
      logger.i('SPLASH BLOC: Access token is expired, refreshing token...');

      final requestRefreshToken = RefreshTokenRequest(
        refreshToken: refreshToken,
      );
      try {
        final response = await tokenRepository.getNewToken(requestRefreshToken);
        authRepository.saveToken(
          response.meta.accessToken,
          response.meta.refreshToken,
        );
        logger.i('SPLASH BLOC: Token refreshed successfully');

        final userInfo = await userRepository.getProfile();
        userInfo.fold(
          (userInfo) {
            emit(const _Completed());
            logger.i('SPLASH BLOC: User info fetched successfully');
            authRepository.saveUserInfo(userInfo.userInfo);
            authCubit.login(userInfo.userInfo);

            // Kiểm tra premium status để quyết định route
            PageRouteInfo targetRoute;
            // Tạm để là luôn vào main route
            if (!userInfo.userInfo.entitlement.premium) {
              targetRoute = _initialEchoRoute();
            } else {
              targetRoute = _initialEchoRoute();
            }

            _startSplashTimer(context, targetRoute);
          },
          (error) {
            emit(const _Error("Failed to get user info"));
            logger.e('SPLASH BLOC: Failed to get user info: $error');
            authCubit.logout();
            _startSplashTimer(context, _initialEchoRoute());
          },
        );
      } catch (e) {
        emit(const _Error("Failed to refresh token"));
        logger.e('SPLASH BLOC: Failed to refresh token: ${e.toString()}');
        authCubit.logout();
        _startSplashTimer(context, _initialEchoRoute());
      }
    } else {
      logger.i('SPLASH BLOC: Access token is not expired');

      final userInfo = await userRepository.getProfile();
      userInfo.fold(
        (userInfo) {
          emit(const _Completed());
          logger.i('SPLASH BLOC: User info fetched successfully');
          authRepository.saveUserInfo(userInfo.userInfo);
          authCubit.login(userInfo.userInfo);

          // Kiểm tra premium status để quyết định route
          PageRouteInfo targetRoute;
          if (!userInfo.userInfo.entitlement.premium) {
            targetRoute = _initialEchoRoute();
          } else {
            targetRoute = _initialEchoRoute();
          }

          _startSplashTimer(context, targetRoute);
        },
        (error) {
          emit(const _Error("Failed to get user info"));
          logger.e('SPLASH BLOC: Failed to get user info: $error');
          authCubit.logout();
          _startSplashTimer(context, _initialEchoRoute());
        },
      );
    }
  }

  PageRouteInfo _initialEchoRoute() {
    return Storage.echoOnboardingCompleted
        ? const MainRoute()
        : const OnboardingLanguageRoute();
  }
}
