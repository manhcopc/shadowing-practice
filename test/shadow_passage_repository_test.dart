import 'package:flutter_test/flutter_test.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart' hide Storage;
import 'package:rvc_mobile_application/data/local/shared_prefs/storage.dart';
import 'package:rvc_mobile_application/modules/shadow_mvp/shadow_mvp.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await Storage.setup();
  });

  test('repository exposes the commit 2 local library', () {
    final passages = const ShadowPassageRepository().getPassages();

    expect(passages, hasLength(12));
    expect(
      passages.map((passage) => passage.level).toSet(),
      containsAll([ShadowCefrLevel.a1, ShadowCefrLevel.a2, ShadowCefrLevel.b1]),
    );
  });

  test('repository filters passages by level and topic', () {
    final repository = const ShadowPassageRepository();

    final a2Passages = repository.getPassages(level: ShadowCefrLevel.a2);
    final travelPassages = repository.getPassages(
      topic: ShadowPassageTopic.travel,
    );

    expect(a2Passages, hasLength(4));
    expect(
      a2Passages.every((passage) => passage.level == ShadowCefrLevel.a2),
      isTrue,
    );
    expect(travelPassages, hasLength(3));
    expect(
      travelPassages.every(
        (passage) => passage.topic == ShadowPassageTopic.travel,
      ),
      isTrue,
    );
  });

  test('repository builds deterministic sentence and word timestamps', () {
    final passage = const ShadowPassageRepository().getFeaturedPassage();

    expect(passage.sentences.first.startMs, 0);
    expect(passage.sentences.first.endMs, passage.sentences[1].startMs);
    expect(passage.durationMs, passage.sentences.last.endMs);
    expect(passage.sentences.first.wordTimestamps.first.word, 'You');
  });

  test('repository toggles favorite passages through storage', () async {
    const repository = ShadowPassageRepository();
    const passageId = 'motivation-a1-keep-moving';

    await repository.toggleFavorite(passageId);
    expect(repository.getPassages(favoritesOnly: true).single.id, passageId);

    await repository.toggleFavorite(passageId);
    expect(repository.getPassages(favoritesOnly: true), isEmpty);
  });
}
