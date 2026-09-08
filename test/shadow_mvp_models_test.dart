import 'package:flutter_test/flutter_test.dart';
import 'package:rvc_mobile_application/modules/shadow_mvp/shadow_mvp.dart';

void main() {
  test('passage progress ratio is derived from completed sentences', () {
    final progress = ShadowPassageProgress(
      passageId: 'p1',
      status: ShadowPassageStatus.inProgress,
      lastPositionMs: 12000,
      sentencesCompleted: 3,
      totalSentences: 6,
      lastPracticedAt: DateTime(2026, 9, 8),
    );

    expect(progress.ratio, 0.5);
  });

  test('playback settings default to reader-first behavior', () {
    const settings = ShadowPlaybackSettings();

    expect(settings.showText, isTrue);
    expect(settings.showTranslation, isFalse);
    expect(settings.musicPreset, AmbientMusicPreset.off);
    expect(settings.playbackSpeed, 1);
  });

  test('passage sentence duration is timestamp based', () {
    const sentence = ShadowPassageSentence(
      id: 's1',
      passageId: 'p1',
      text: 'You do not have to be perfect.',
      translation: 'Ban khong can phai hoan hao.',
      startMs: 1000,
      endMs: 4200,
      phraseSegments: [],
      wordTimestamps: [],
      vocabulary: [],
      phrases: [],
      grammarPoints: [],
    );

    expect(sentence.duration, const Duration(milliseconds: 3200));
  });
}
