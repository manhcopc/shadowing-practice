import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart' hide Storage;
import 'package:rvc_mobile_application/data/local/shared_prefs/storage.dart';
import 'package:rvc_mobile_application/modules/library/level_page.dart';
import 'package:rvc_mobile_application/modules/library/library_page.dart';
import 'package:rvc_mobile_application/modules/practice/practice_page.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await Storage.setup();
  });

  testWidgets('level page lists recommended CEFR levels', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LevelPage()));

    expect(find.text('Levels'), findsOneWidget);
    expect(find.text('A2'), findsOneWidget);
    expect(find.text('RECOMMENDED'), findsOneWidget);
  });

  testWidgets('library page shows filters and featured drill', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LibraryPage()));

    expect(find.text('Shadowing Library'), findsOneWidget);
    expect(find.text("TODAY'S DRILL"), findsOneWidget);
    expect(find.text('Keep Moving'), findsWidgets);
    expect(find.text('MOTIVATION'), findsWidgets);
  });

  testWidgets('practice page renders pacer room state', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: PracticePage()));

    expect(find.text('Practice'), findsWidgets);
    expect(find.text('SHADOW PACER ENGINE'), findsOneWidget);
    expect(find.text('Practice Room'), findsOneWidget);
    expect(find.text('START SHADOWING'), findsOneWidget);
  });
}
