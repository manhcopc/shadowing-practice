// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:auto_route/auto_route.dart' as _i790;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:rvc_mobile_application/core/app/app_module.dart' as _i773;
import 'package:rvc_mobile_application/core/app/app_router.dart' as _i742;
import 'package:rvc_mobile_application/core/language/lang_cubit.dart' as _i390;
import 'package:rvc_mobile_application/core/language/lang_repository.dart'
    as _i914;
import 'package:rvc_mobile_application/core/language/lang_repository_interface.dart'
    as _i964;
import 'package:rvc_mobile_application/core/services/api_service/api_service.dart'
    as _i393;
import 'package:rvc_mobile_application/core/services/camera/camera_cubit.dart'
    as _i750;
import 'package:rvc_mobile_application/core/services/network/network_cubit.dart'
    as _i808;
import 'package:rvc_mobile_application/core/services/switch_theme/switch_theme_cubit.dart'
    as _i1002;
import 'package:rvc_mobile_application/core/utils/logger.dart' as _i1021;
import 'package:rvc_mobile_application/data/local/hive/hive_util.dart' as _i171;
import 'package:rvc_mobile_application/modules/auth/api/auth_service.dart'
    as _i108;
import 'package:rvc_mobile_application/modules/auth/cubits/auth_cubit.dart'
    as _i789;
import 'package:rvc_mobile_application/modules/auth/modules/sign_up/cubit/sign_up_cubit.dart'
    as _i182;
import 'package:rvc_mobile_application/modules/auth/repositories/auth_repository.dart'
    as _i629;
import 'package:rvc_mobile_application/modules/auth/repositories/token_repository.dart'
    as _i1052;
import 'package:rvc_mobile_application/modules/profile/api/user_service.dart'
    as _i161;
import 'package:rvc_mobile_application/modules/profile/models/ticker.dart'
    as _i700;
import 'package:rvc_mobile_application/modules/profile/repositories/user_repository.dart'
    as _i1049;
import 'package:rvc_mobile_application/modules/splash/cubit/splash_cubit.dart'
    as _i381;
import 'package:talker_flutter/talker_flutter.dart' as _i207;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final loggerModule = _$LoggerModule();
    final appModule = _$AppModule();
    final apiModule = _$ApiModule();
    gh.factory<_i700.Ticker>(() => const _i700.Ticker());
    gh.singleton<_i742.AppRouter>(() => _i742.AppRouter());
    gh.singleton<_i750.CameraCubit>(() => _i750.CameraCubit());
    gh.singleton<_i808.NetworkCubit>(() => _i808.NetworkCubit());
    gh.singleton<_i1002.SwitchThemeCubit>(() => _i1002.SwitchThemeCubit());
    gh.singleton<_i207.Talker>(() => loggerModule.talker());
    gh.singleton<_i171.HiveUtils>(() => _i171.HiveUtils());
    gh.singleton<_i789.AuthCubit>(() => _i789.AuthCubit());
    gh.singleton<_i381.SplashCubit>(() => _i381.SplashCubit());
    gh.lazySingleton<_i790.AutoRouteObserver>(
      () => appModule.autoRouteObserver,
    );
    gh.lazySingleton<_i182.SignUpCubit>(() => _i182.SignUpCubit());
    gh.lazySingleton<_i1052.TokenRepository>(() => _i1052.TokenRepository());
    gh.lazySingleton<_i964.ILangRepository>(() => _i914.LangRepository());
    gh.factory<String>(() => apiModule.apiUrl, instanceName: 'baseUrl');
    gh.singleton<_i390.LangCubit>(
      () => _i390.LangCubit(gh<_i964.ILangRepository>()),
    );
    gh.singleton<_i361.Dio>(
      () => apiModule.dio(
        gh<String>(instanceName: 'baseUrl'),
        gh<_i964.ILangRepository>(),
        gh<_i207.Talker>(),
      ),
      instanceName: 'baseDioClient',
    );
    gh.factory<_i108.AuthService>(
      () => _i108.AuthService(gh<_i361.Dio>(instanceName: 'baseDioClient')),
    );
    gh.factory<_i161.UserService>(
      () => _i161.UserService(gh<_i361.Dio>(instanceName: 'baseDioClient')),
    );
    gh.lazySingleton<_i1049.UserRepository>(
      () => _i1049.UserRepository(gh<_i161.UserService>()),
    );
    gh.lazySingleton<_i629.AuthRepository>(
      () => _i629.AuthRepository(gh<_i108.AuthService>()),
    );
    return this;
  }
}

class _$LoggerModule extends _i1021.LoggerModule {}

class _$AppModule extends _i773.AppModule {}

class _$ApiModule extends _i393.ApiModule {}
