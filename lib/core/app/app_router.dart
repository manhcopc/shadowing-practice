import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../modules/home/page/home_page.dart';
import '../../modules/learn/learn_page.dart';
import '../../modules/library/level_page.dart';
import '../../modules/library/library_page.dart';
import '../../modules/onboarding/onboarding_language_page.dart';
import '../../modules/onboarding/onboarding_level_page.dart';
import '../../modules/practice/practice_page.dart';
import '../../modules/profile/pages/profile_page.dart';
import '../../modules/progress/progress_page.dart';
import '../../modules/courses/course_detail_page.dart';
import '../../modules/lessons/lesson_player_page.dart';
import '../../modules/results/result_page.dart';
import '../../modules/settings/screen/settings_screen.dart';
import '../../modules/shadowing/shadowing_page.dart';
import '../../modules/shadow_mvp/presentation/pacer_practice_page.dart';

import '../../modules/splash/presentation/splash_screen.dart';
import '../../modules/main/screen/main_screen.dart';

import 'route_path.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig(
  replaceInRouteName: 'Screen|Page,Route',
) //HomePage -> HomeRoute
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    CustomRoute(
      page: SplashRoute.page,
      path: Routers.splashScreen,
      transitionsBuilder:
          TransitionsBuilders.fadeIn, // Sử dụng hiệu ứng fade-in
      duration: Duration(milliseconds: 500), // Thời gian chuyển cảnh
    ), // Màn hình splash đầu tiên

    AutoRoute(
      page: MainRoute.page,
      path: Routers.mainScreen,
      children: [
        AutoRoute(page: HomeRoute.page, path: Routers.homePage),
        AutoRoute(page: LibraryRoute.page, path: Routers.libraryPage),
        AutoRoute(page: PracticeRoute.page, path: Routers.practicePage),
        AutoRoute(page: ProfileRoute.page, path: Routers.profilePage),
      ],
    ),

    AutoRoute(page: LevelRoute.page, path: Routers.levelPage),
    AutoRoute(
      page: OnboardingLanguageRoute.page,
      path: Routers.onboardingLanguage,
    ),
    AutoRoute(page: OnboardingLevelRoute.page, path: Routers.onboardingLevel),
    AutoRoute(page: CourseDetailRoute.page, path: Routers.courseDetail),
    AutoRoute(page: LessonPlayerRoute.page, path: Routers.lessonPlayer),
    AutoRoute(page: ShadowingRoute.page, path: Routers.shadowing),
    AutoRoute(page: PacerPracticeRoute.page, path: Routers.pacerPractice),
    AutoRoute(page: ResultRoute.page, path: Routers.result),
    AutoRoute(page: SettingsRoute.page, path: Routers.settingsScreen),
  ];
}
