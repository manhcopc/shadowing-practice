// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [CourseDetailPage]
class CourseDetailRoute extends PageRouteInfo<CourseDetailRouteArgs> {
  CourseDetailRoute({
    Key? key,
    required String courseId,
    List<PageRouteInfo>? children,
  }) : super(
         CourseDetailRoute.name,
         args: CourseDetailRouteArgs(key: key, courseId: courseId),
         initialChildren: children,
       );

  static const String name = 'CourseDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CourseDetailRouteArgs>();
      return CourseDetailPage(key: args.key, courseId: args.courseId);
    },
  );
}

class CourseDetailRouteArgs {
  const CourseDetailRouteArgs({this.key, required this.courseId});

  final Key? key;

  final String courseId;

  @override
  String toString() {
    return 'CourseDetailRouteArgs{key: $key, courseId: $courseId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CourseDetailRouteArgs) return false;
    return key == other.key && courseId == other.courseId;
  }

  @override
  int get hashCode => key.hashCode ^ courseId.hashCode;
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [LearnPage]
class LearnRoute extends PageRouteInfo<void> {
  const LearnRoute({List<PageRouteInfo>? children})
    : super(LearnRoute.name, initialChildren: children);

  static const String name = 'LearnRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LearnPage();
    },
  );
}

/// generated route for
/// [LessonPlayerPage]
class LessonPlayerRoute extends PageRouteInfo<LessonPlayerRouteArgs> {
  LessonPlayerRoute({
    Key? key,
    required String lessonId,
    int sentenceIndex = 0,
    List<PageRouteInfo>? children,
  }) : super(
         LessonPlayerRoute.name,
         args: LessonPlayerRouteArgs(
           key: key,
           lessonId: lessonId,
           sentenceIndex: sentenceIndex,
         ),
         initialChildren: children,
       );

  static const String name = 'LessonPlayerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LessonPlayerRouteArgs>();
      return LessonPlayerPage(
        key: args.key,
        lessonId: args.lessonId,
        sentenceIndex: args.sentenceIndex,
      );
    },
  );
}

class LessonPlayerRouteArgs {
  const LessonPlayerRouteArgs({
    this.key,
    required this.lessonId,
    this.sentenceIndex = 0,
  });

  final Key? key;

  final String lessonId;

  final int sentenceIndex;

  @override
  String toString() {
    return 'LessonPlayerRouteArgs{key: $key, lessonId: $lessonId, sentenceIndex: $sentenceIndex}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LessonPlayerRouteArgs) return false;
    return key == other.key &&
        lessonId == other.lessonId &&
        sentenceIndex == other.sentenceIndex;
  }

  @override
  int get hashCode => key.hashCode ^ lessonId.hashCode ^ sentenceIndex.hashCode;
}

/// generated route for
/// [LevelPage]
class LevelRoute extends PageRouteInfo<void> {
  const LevelRoute({List<PageRouteInfo>? children})
    : super(LevelRoute.name, initialChildren: children);

  static const String name = 'LevelRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LevelPage();
    },
  );
}

/// generated route for
/// [LibraryPage]
class LibraryRoute extends PageRouteInfo<void> {
  const LibraryRoute({List<PageRouteInfo>? children})
    : super(LibraryRoute.name, initialChildren: children);

  static const String name = 'LibraryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LibraryPage();
    },
  );
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainScreen();
    },
  );
}

/// generated route for
/// [OnboardingLanguagePage]
class OnboardingLanguageRoute extends PageRouteInfo<void> {
  const OnboardingLanguageRoute({List<PageRouteInfo>? children})
    : super(OnboardingLanguageRoute.name, initialChildren: children);

  static const String name = 'OnboardingLanguageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardingLanguagePage();
    },
  );
}

/// generated route for
/// [OnboardingLevelPage]
class OnboardingLevelRoute extends PageRouteInfo<OnboardingLevelRouteArgs> {
  OnboardingLevelRoute({
    Key? key,
    required String language,
    List<PageRouteInfo>? children,
  }) : super(
         OnboardingLevelRoute.name,
         args: OnboardingLevelRouteArgs(key: key, language: language),
         initialChildren: children,
       );

  static const String name = 'OnboardingLevelRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OnboardingLevelRouteArgs>();
      return OnboardingLevelPage(key: args.key, language: args.language);
    },
  );
}

class OnboardingLevelRouteArgs {
  const OnboardingLevelRouteArgs({this.key, required this.language});

  final Key? key;

  final String language;

  @override
  String toString() {
    return 'OnboardingLevelRouteArgs{key: $key, language: $language}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OnboardingLevelRouteArgs) return false;
    return key == other.key && language == other.language;
  }

  @override
  int get hashCode => key.hashCode ^ language.hashCode;
}

/// generated route for
/// [PacerPracticePage]
class PacerPracticeRoute extends PageRouteInfo<PacerPracticeRouteArgs> {
  PacerPracticeRoute({
    Key? key,
    required String passageId,
    List<PageRouteInfo>? children,
  }) : super(
         PacerPracticeRoute.name,
         args: PacerPracticeRouteArgs(key: key, passageId: passageId),
         initialChildren: children,
       );

  static const String name = 'PacerPracticeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PacerPracticeRouteArgs>();
      return PacerPracticePage(key: args.key, passageId: args.passageId);
    },
  );
}

class PacerPracticeRouteArgs {
  const PacerPracticeRouteArgs({this.key, required this.passageId});

  final Key? key;

  final String passageId;

  @override
  String toString() {
    return 'PacerPracticeRouteArgs{key: $key, passageId: $passageId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PacerPracticeRouteArgs) return false;
    return key == other.key && passageId == other.passageId;
  }

  @override
  int get hashCode => key.hashCode ^ passageId.hashCode;
}

/// generated route for
/// [PracticePage]
class PracticeRoute extends PageRouteInfo<void> {
  const PracticeRoute({List<PageRouteInfo>? children})
    : super(PracticeRoute.name, initialChildren: children);

  static const String name = 'PracticeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PracticePage();
    },
  );
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfilePage();
    },
  );
}

/// generated route for
/// [ProgressPage]
class ProgressRoute extends PageRouteInfo<void> {
  const ProgressRoute({List<PageRouteInfo>? children})
    : super(ProgressRoute.name, initialChildren: children);

  static const String name = 'ProgressRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProgressPage();
    },
  );
}

/// generated route for
/// [ResultPage]
class ResultRoute extends PageRouteInfo<ResultRouteArgs> {
  ResultRoute({
    Key? key,
    required String sentenceId,
    String? recordingPath,
    int? recordingDurationMs,
    List<PageRouteInfo>? children,
  }) : super(
         ResultRoute.name,
         args: ResultRouteArgs(
           key: key,
           sentenceId: sentenceId,
           recordingPath: recordingPath,
           recordingDurationMs: recordingDurationMs,
         ),
         initialChildren: children,
       );

  static const String name = 'ResultRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResultRouteArgs>();
      return ResultPage(
        key: args.key,
        sentenceId: args.sentenceId,
        recordingPath: args.recordingPath,
        recordingDurationMs: args.recordingDurationMs,
      );
    },
  );
}

class ResultRouteArgs {
  const ResultRouteArgs({
    this.key,
    required this.sentenceId,
    this.recordingPath,
    this.recordingDurationMs,
  });

  final Key? key;

  final String sentenceId;

  final String? recordingPath;

  final int? recordingDurationMs;

  @override
  String toString() {
    return 'ResultRouteArgs{key: $key, sentenceId: $sentenceId, recordingPath: $recordingPath, recordingDurationMs: $recordingDurationMs}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ResultRouteArgs) return false;
    return key == other.key &&
        sentenceId == other.sentenceId &&
        recordingPath == other.recordingPath &&
        recordingDurationMs == other.recordingDurationMs;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      sentenceId.hashCode ^
      recordingPath.hashCode ^
      recordingDurationMs.hashCode;
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsScreen();
    },
  );
}

/// generated route for
/// [ShadowingPage]
class ShadowingRoute extends PageRouteInfo<ShadowingRouteArgs> {
  ShadowingRoute({
    Key? key,
    required String sentenceId,
    List<PageRouteInfo>? children,
  }) : super(
         ShadowingRoute.name,
         args: ShadowingRouteArgs(key: key, sentenceId: sentenceId),
         initialChildren: children,
       );

  static const String name = 'ShadowingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ShadowingRouteArgs>();
      return ShadowingPage(key: args.key, sentenceId: args.sentenceId);
    },
  );
}

class ShadowingRouteArgs {
  const ShadowingRouteArgs({this.key, required this.sentenceId});

  final Key? key;

  final String sentenceId;

  @override
  String toString() {
    return 'ShadowingRouteArgs{key: $key, sentenceId: $sentenceId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ShadowingRouteArgs) return false;
    return key == other.key && sentenceId == other.sentenceId;
  }

  @override
  int get hashCode => key.hashCode ^ sentenceId.hashCode;
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}
