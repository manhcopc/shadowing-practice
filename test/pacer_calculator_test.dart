import 'package:flutter_test/flutter_test.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart' hide Storage;
import 'package:rvc_mobile_application/data/local/shared_prefs/storage.dart';
import 'package:rvc_mobile_application/modules/shadow_mvp/data/shadow_passage_repository.dart';
import 'package:rvc_mobile_application/modules/shadow_mvp/pacer/pacer_calculator.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await Storage.setup();
  });

  group('PacerCalculator Tests', () {
    test('calculateSentenceDurationMs calculates word and pause time correctly', () {
      // 120 WPM => 500ms per word
      // "Hi, I am Alex."
      // words: 4 => 4 * 500 = 2000ms
      // comma: 1 => +250ms
      // period: 1 => +500ms
      // total = 2750ms
      final duration = PacerCalculator.calculateSentenceDurationMs(
        text: 'Hi, I am Alex.',
        wpm: 120,
      );
      expect(duration, equals(2750));
    });

    test('calculateSentenceDurationMs clamps very short text to minimum duration', () {
      // "Yes." at 120 WPM would be 500 + 500 = 1000ms, clamped to 1500ms
      final duration = PacerCalculator.calculateSentenceDurationMs(
        text: 'Yes.',
        wpm: 120,
      );
      expect(duration, equals(PacerCalculator.minSentenceDurationMs));
    });

    test('higher WPM results in faster (shorter) duration', () {
      const sentence = 'Small habits can change your whole day.';
      final durationSlow = PacerCalculator.calculateSentenceDurationMs(
        text: sentence,
        wpm: 90,
      );
      final durationFast = PacerCalculator.calculateSentenceDurationMs(
        text: sentence,
        wpm: 160,
      );
      expect(durationFast, lessThan(durationSlow));
    });

    test('calculatePassageTiming builds cumulative startMs and endMs', () {
      final repository = const ShadowPassageRepository();
      final passage = repository.getFeaturedPassage();

      final timing = PacerCalculator.calculatePassageTiming(
        passage: passage,
        wpm: 120,
      );

      expect(timing.sentenceTimings.length, equals(passage.sentences.length));
      expect(timing.sentenceTimings.first.startMs, equals(0));

      for (int i = 0; i < timing.sentenceTimings.length; i++) {
        final current = timing.sentenceTimings[i];
        expect(current.endMs, equals(current.startMs + current.durationMs));
        if (i > 0) {
          final previous = timing.sentenceTimings[i - 1];
          expect(current.startMs, equals(previous.endMs));
        }
      }

      expect(timing.totalDurationMs, equals(timing.sentenceTimings.last.endMs));
    });

    test('formatDurationMs formats mm:ss cleanly', () {
      expect(PacerCalculator.formatDurationMs(65000), equals('1:05'));
      expect(PacerCalculator.formatDurationMs(9000), equals('0:09'));
      expect(PacerCalculator.formatDurationMs(120000), equals('2:00'));
    });
  });
}
