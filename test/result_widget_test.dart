import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart' hide Storage;
import 'package:rvc_mobile_application/data/local/shared_prefs/storage.dart';
import 'package:rvc_mobile_application/modules/results/result_page.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await Storage.setup();
  });

  testWidgets('result renders deterministic score', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ResultPage(sentenceId: 'daily-3-s1')));
    await tester.pumpAndSettle();
    expect(find.text('Shadow Score'), findsOneWidget);
    expect(find.text('Words matched'), findsOneWidget);
    expect(find.text('Transcript feedback'), findsOneWidget);
  });
}
