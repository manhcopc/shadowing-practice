/// [Routers] contains the routes path.
/// These can be used to make push screen call via Routers.
class Routers {
  // Path routers
  ///[splashScreen] is the first screen of the app.
  static const splashScreen = '/';

  ///[welcomeScreen] screen route.
  static const welcomeScreen = '/welcome';

  static const onboardingLanguage = '/onboarding/language';

  static const onboardingLevel = '/onboarding/level';

  ///[mainScreen] screen route.
  static const mainScreen = '/main';

  ///[homePage] page route.
  static const homePage = 'home';

  ///[profilePage] page route.
  static const profilePage = 'profile';

  static const libraryPage = 'library';

  static const practicePage = 'practice';

  static const levelPage = '/library/level';

  static const learnPage = 'learn';

  static const progressPage = 'progress';

  static const courseDetail = '/course/:courseId';

  static const lessonPlayer = '/lesson/:lessonId';

  static const shadowing = '/shadow/:sentenceId';

  static const pacerPractice = '/pacer/:passageId';

  static const result = '/result/:sentenceId';

  ///[settingsScreen] screen route.
  static const settingsScreen = '/settings';
}
