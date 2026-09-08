import 'package:auto_route/auto_route.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../modules/auth/cubits/auth_cubit.dart';
import '../../modules/auth/repositories/auth_repository.dart';
import '../../modules/auth/repositories/token_repository.dart';
import '../../modules/profile/repositories/user_repository.dart';
import '../../modules/splash/cubit/splash_cubit.dart';
import '../services/camera/camera_cubit.dart';
import '../services/switch_theme/switch_theme_cubit.dart';

import '../app/app_router.dart';
import '../language/lang_cubit.dart';
import 'di/getit_utils.dart';

// ===== Instances: Navigation =====
// Gồm AppRouter (điều hướng) và AutoRouteObserver (quan sát chuyển route).

/// [AppRouter] instance for managing app navigation
final router = getIt<AppRouter>();

/// [AutoRouteObserver] instance for observing route changes
final autoRouteObserver = getIt<AutoRouteObserver>();

// ===== Instances: Repository =====
final authRepository = getIt<AuthRepository>();
final tokenRepository = getIt<TokenRepository>();
final userRepository = getIt<UserRepository>();

// ===== Instances: Cubit/Bloc =====
final themeCubit = getIt<SwitchThemeCubit>();
final langCubit = getIt<LangCubit>();
final splashCubit = getIt<SplashCubit>();
final authCubit = getIt<AuthCubit>();
final cameraCubit = getIt<CameraCubit>();

// ===== Instances: Logging =====

/// [Talker] instance for logging and debugging
final talker = getIt<Talker>();

// ===== Instances: Services =====
