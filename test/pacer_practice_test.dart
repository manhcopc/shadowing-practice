import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart' hide Storage;
import 'package:rvc_mobile_application/data/local/shared_prefs/storage.dart';
import 'package:rvc_mobile_application/modules/shadow_mvp/data/shadow_passage_repository.dart';
import 'package:rvc_mobile_application/modules/shadow_mvp/pacer/pacer_controller.dart';
import 'package:rvc_mobile_application/modules/shadow_mvp/pacer/pacer_models.dart';
import 'package:rvc_mobile_application/modules/shadow_mvp/presentation/pacer_practice_page.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await Storage.setup();
  });

  group('PacerController Unit Tests', () {
    test('initial state is idle at sentence 0', () {
      final passage = const ShadowPassageRepository().getFeaturedPassage();
      final controller = PacerController(
        passage: passage,
        initialWpm: 120,
        enableAudioRecording: false,
      );

      expect(controller.status, equals(PacerStatus.idle));
      expect(controller.currentIndex, equals(0));
      expect(controller.sentenceProgress, equals(0.0));
      expect(controller.wpm, equals(120));
      expect(controller.mode, equals(PacerMode.sentenceFocus));

      controller.dispose();
    });

    test('nextSentence advances and wraps or completes', () {
      final passage = const ShadowPassageRepository().getFeaturedPassage();
      final controller = PacerController(
        passage: passage,
        enableAudioRecording: false,
      );

      expect(controller.currentIndex, equals(0));
      controller.nextSentence();
      expect(controller.currentIndex, equals(1));

      // Advance to end
      for (int i = 1; i < passage.sentences.length; i++) {
        controller.nextSentence();
      }
      expect(controller.isCompleted, isTrue);

      controller.dispose();
    });

    test('setMode and setWpm reset completed status back to idle', () async {
      final passage = const ShadowPassageRepository().getFeaturedPassage();
      final controller = PacerController(
        passage: passage,
        enableAudioRecording: false,
      );

      await controller.finish();
      expect(controller.isCompleted, isTrue);

      controller.setMode(PacerMode.teleprompter);
      expect(controller.isCompleted, isFalse);
      expect(controller.isIdle, isTrue);

      await controller.finish();
      expect(controller.isCompleted, isTrue);

      controller.setWpm(150);
      expect(controller.isCompleted, isFalse);
      expect(controller.isIdle, isTrue);

      controller.dispose();
    });

    test('setWpm dynamically recalculates timing plan', () {
      final passage = const ShadowPassageRepository().getFeaturedPassage();
      final controller = PacerController(
        passage: passage,
        initialWpm: 100,
        enableAudioRecording: false,
      );

      final durationAt100 = controller.timingPlan.totalDurationMs;
      controller.setWpm(150);
      final durationAt150 = controller.timingPlan.totalDurationMs;

      expect(durationAt150, lessThan(durationAt100));

      controller.dispose();
    });
  });

  group('PacerPracticePage Widget Tests', () {
    testWidgets(
      'renders WPM bar, wheel picker sentences, and controls in sentence mode',
      (tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        final passage = const ShadowPassageRepository().getFeaturedPassage();

        await tester.pumpWidget(
          MaterialApp(
            home: PacerPracticePage(
              passageId: passage.id,
              enableAudioRecording: false,
            ),
          ),
        );

        // Verify header and passage title
        expect(find.text(passage.title), findsOneWidget);

        // Verify WPM bar components
        expect(find.text('TỪNG CÂU'), findsOneWidget);
        expect(find.text('CUỘN CHỮ'), findsOneWidget);
        expect(find.text('WPM'), findsOneWidget);

        // Verify wheel picker is present and active sentence text is rendered
        expect(find.byType(ListWheelScrollView), findsOneWidget);
        expect(find.text(passage.sentences.first.text), findsOneWidget);

        // Verify sentence counter: 01 / 03
        expect(find.text('01'), findsOneWidget);

        // Verify play button is present
        expect(find.byIcon(Icons.play_arrow_rounded), findsOneWidget);
      },
    );

    testWidgets(
      'switching mode or speed does not prematurely show completion sheet',
      (tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        final passage = const ShadowPassageRepository().getFeaturedPassage();

        await tester.pumpWidget(
          MaterialApp(
            home: PacerPracticePage(
              passageId: passage.id,
              enableAudioRecording: false,
            ),
          ),
        );

        // Tap on 'CUỘN CHỮ'
        await tester.tap(find.text('CUỘN CHỮ'));
        await tester.pumpAndSettle();

        expect(find.text('HOÀN THÀNH BÀI ĐỌC'), findsNothing);

        // Verify that sentences in passage are visible in the continuous teleprompter
        for (final s in passage.sentences) {
          expect(find.text(s.text), findsWidgets);
        }

        // Tap speed preset 'Nhanh (150)'
        await tester.tap(find.text('Nhanh (150)'));
        await tester.pumpAndSettle();

        expect(find.text('HOÀN THÀNH BÀI ĐỌC'), findsNothing);
      },
    );
  });
}
