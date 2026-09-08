# 001 - ECHO Ver1 + Ver2 Implementation Report

Date: 2026-09-07
Project: ECHO - English shadowing mobile app
Workspace: `/Users/copc/Workspace/mobile/ShadowingApp/shadowing-app`

## V1 Architecture Summary

The existing Flutter project was kept on its current architecture instead of being rewritten:

- Routing: `auto_route`
- State/app wiring: existing BLoC/Cubit + `get_it`/`injectable`
- Local persistence: existing `Storage` wrapper over SharedPreferences/SecureStorage
- UI structure: existing `lib/modules/*` layout, extended with ECHO modules
- Audio playback: `just_audio`
- Voice recording: `record`
- Permission handling: `permission_handler`

No API secrets were added to the Flutter client. Firebase startup was made optional for the local-first prototype so missing iOS Firebase config does not crash the app.

## Ver1 Completed

Ver1 delivered a working local-first shadowing learning flow:

- Onboarding language screen
- Onboarding level and weekly goal screen
- Splash routing into onboarding or main app based on local completion state
- Main bottom navigation:
  - Home
  - Learn
  - Progress
  - Profile
- Course list
- Course detail
- Lesson player
- Shadowing recorder
- Result screen
- Local progress persistence
- Profile/settings placeholder UI

The core learning flow works as:

Launch app -> Onboarding -> Home -> Learn/Course -> Lesson -> Listen -> Shadow/Record -> Result -> Next sentence/Retry -> Progress.

## Ver1 Data + Services

Created local mock course content for:

- Course: Daily English
- Topic: Ordering Coffee
- Six lessons:
  - Greetings
  - Ordering a drink
  - Asking for recommendations
  - Customizing your order
  - Paying at the counter
  - Saying thank you
- Each lesson includes sample sentences, translations, durations, and vocabulary.

Created foundational models:

- `EchoUserProfile`
- `Course`
- `Lesson`
- `ShadowSentence`
- `VocabularyItem`
- `ShadowAttempt`

Created local-first service/repository layer:

- `MockEchoRepository`
- `EchoProgressRepository`
- `PronunciationService`
- `MockPronunciationService`

## Ver1 Audio + Recording

Implemented:

- Mock native audio playback through `just_audio`
- Real temporary mock WAV generation for native audio testing
- Microphone permission requested only when user starts recording
- iOS `NSMicrophoneUsageDescription`
- iOS `PERMISSION_MICROPHONE=1` Podfile flag
- Recording to temporary `.m4a`
- Replay recorded voice after recording stops
- Replay recording on Result screen

Important fix:

The recording player is now created only after `_recorder.stop()` returns the final file path. This avoids loading a partially written `.m4a` file.

## Ver1 Files Created

- `lib/modules/echo_foundation/echo_theme.dart`
- `lib/modules/echo_foundation/models.dart`
- `lib/modules/echo_foundation/mock_echo_repository.dart`
- `lib/modules/echo_foundation/echo_progress_repository.dart`
- `lib/modules/echo_foundation/pronunciation_service.dart`
- `lib/modules/echo_foundation/widgets.dart`
- `lib/modules/onboarding/onboarding_language_page.dart`
- `lib/modules/onboarding/onboarding_level_page.dart`
- `lib/modules/learn/learn_page.dart`
- `lib/modules/courses/course_detail_page.dart`
- `lib/modules/lessons/lesson_player_page.dart`
- `lib/modules/shadowing/audio_player_widget.dart`
- `lib/modules/shadowing/shadowing_page.dart`
- `lib/modules/results/result_page.dart`
- `lib/modules/progress/progress_page.dart`
- `test/echo_progress_repository_test.dart`
- `test/onboarding_widget_test.dart`
- `test/home_widget_test.dart`
- `test/result_widget_test.dart`
- `.env`

## Ver1 Files Modified

- `pubspec.yaml`
- `pubspec.lock`
- `lib/core/app/app_router.dart`
- `lib/core/app/app_router.gr.dart`
- `lib/core/app/route_path.dart`
- `lib/modules/splash/cubit/splash_cubit.dart`
- `lib/modules/main/screen/main_screen.dart`
- `lib/modules/home/page/home_page.dart`
- `lib/modules/profile/pages/profile_page.dart`
- `lib/data/local/shared_prefs/storage.dart`
- `lib/initializer.dart`
- `lib/core/services/speech/speech_service.dart`
- `lib/core/utils/create_file_of_bloc.dart`
- `lib/core/utils/delete_generated_files.dart`
- `ios/Runner/Info.plist`
- `ios/Podfile`
- `ios/Podfile.lock`
- `ios/Runner.xcodeproj/project.pbxproj`

## Ver1 Dependencies Added

- `just_audio`
- `record`

## Ver2 Completed

Ver2 upgraded the prototype from a UI demo into a more convincing intelligent shadowing prototype while keeping the Ver1 architecture.

Completed V2 areas:

- Better shadowing modes
- Shadow session state machine
- Countdown UX
- Recording amplitude visualization
- Speech-to-text abstraction
- Transcript comparison
- Local heuristic shadow scoring
- Result feedback redesign
- Learning progress upgrade
- Home/Progress real local data instead of hard-coded demo values

## Ver2 Shadowing Modes

Added three modes:

- Repeat
  - Reference audio plays first.
  - User records after countdown.
  - Intended for beginners.
- Delayed
  - Reference audio starts.
  - Recording starts after configurable delay.
  - Delay options: `1.0s`, `1.5s`, `2.0s`.
  - Default: `1.5s`.
- Real-time
  - Reference audio and recording start together.
  - Marked experimental in UI copy.

## Ver2 State Machine

Created `ShadowSessionState` with explicit session statuses:

- `idle`
- `preparing`
- `playingNative`
- `waitingForUser`
- `recording`
- `paused`
- `processing`
- `completed`
- `error`

This replaced the earlier boolean-heavy shadowing logic.

## Ver2 Speech Recognition Architecture

Created:

- `SpeechRecognitionService`
- `MockSpeechRecognitionService`
- `RealSpeechRecognitionService`

`RealSpeechRecognitionService` is intentionally a placeholder. Any real STT provider should be called through a backend or Edge Function, not directly from Flutter with a secret.

Speech recognition result model includes:

- transcript
- confidence
- duration
- optional words list

## Ver2 Transcript Comparison

Created `TranscriptComparisonService`.

It compares target text and recognized transcript at word level and marks each token as:

- correct
- incorrect
- missing
- extra

Example supported comparison:

- Target: `I was wondering if you could help me.`
- User: `I was wondering if you can help me.`
- Output: `could -> can`

## Ver2 Local Shadow Scoring

Created `LocalShadowScoringService`.

It computes:

- Words matched
- Timing
- Pacing
- Completion
- Overall Shadow Score

This is deliberately not labeled as real acoustic pronunciation scoring. The UI now says `Shadow Score`, not `Pronunciation Score`.

## Ver2 Result Screen

Result screen now shows:

- Shadow Score
- Words matched
- Timing
- Pacing
- Completion
- Transcript feedback
- Target sentence
- Recognized transcript
- Word-level comparison chips
- Phrase feedback
- Reference audio playback
- User recording playback
- Pronunciation analysis block marked `Coming soon`

It no longer presents mock `Pronunciation / Intonation` values as if they were real acoustic analysis.

## Ver2 Learning Progress

Extended local persistence to track:

- sentence attempt count
- best score per sentence
- latest score per sentence
- last practiced timestamp
- practice dates
- current streak
- total attempts
- sentences practiced
- sentences mastered
- average score
- best shadow score
- weekly goal progress

Sentence mastery levels:

- Score below 70: Needs practice
- Score 70-84: Good
- Score 85+: Mastered

Home and Progress now use local attempt data. If the user has no practice data, the app shows empty/new-user states instead of fake analytics.

## Ver2 Files Created

- `lib/modules/shadowing/shadow_session_state.dart`
- `lib/modules/echo_foundation/speech_recognition_service.dart`
- `lib/modules/echo_foundation/transcript_comparison_service.dart`
- `lib/modules/echo_foundation/local_shadow_scoring_service.dart`

## Ver2 Files Modified

- `lib/modules/shadowing/shadowing_page.dart`
- `lib/modules/shadowing/audio_player_widget.dart`
- `lib/modules/results/result_page.dart`
- `lib/modules/echo_foundation/models.dart`
- `lib/modules/echo_foundation/pronunciation_service.dart`
- `lib/modules/echo_foundation/echo_progress_repository.dart`
- `lib/data/local/shared_prefs/storage.dart`
- `lib/modules/home/page/home_page.dart`
- `lib/modules/progress/progress_page.dart`
- `test/echo_progress_repository_test.dart`
- `test/result_widget_test.dart`

## Known Limitations

- STT is still mock/deterministic.
- Native lesson audio is still generated mock tone audio, not real spoken lesson audio.
- No acoustic pronunciation, rhythm, intonation, or stress analysis yet.
- No backend or Supabase integration yet.
- No real AI feedback service yet.
- Sentence segment replay model exists, but segment timestamp playback is not implemented.
- Practice session summary screen is not implemented yet.
- Streak logic is local-only and based on practicing at least one sentence per day.
- Weekly practice minutes are estimated from attempt count, not exact session duration aggregation yet.

## Remaining App Store TODO

- Replace old template app name and bundle identity when product identity is finalized.
- Add ECHO launcher icon and splash assets.
- Add real iOS Firebase config only if Firebase remains part of the product.
- Confirm microphone/privacy copy for production.
- Replace mock tone audio with licensed/native English audio assets.
- Add proper signing profiles before TestFlight.
- Review unused legacy dependencies such as payment/social/Firebase modules before release.

## Build Status

Latest verification completed:

- `dart run build_runner build --delete-conflicting-outputs`: passed
- `flutter analyze`: passed
- `flutter test`: passed, 8 tests
- `flutter build ios --no-codesign`: passed

Latest iOS build artifact:

- `build/ios/iphoneos/Runner.app`

## Next Recommended Step

Implement a real speech-to-text backend path:

1. Add Supabase Edge Function or another backend endpoint for STT.
2. Keep provider API keys only on the backend.
3. Replace `MockSpeechRecognitionService` with a remote implementation.
4. Store real transcripts and confidence values locally.
5. Then improve scoring from transcript-only heuristic toward acoustic analysis.
ư