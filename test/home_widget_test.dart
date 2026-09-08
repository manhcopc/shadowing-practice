import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart' hide Storage;
import 'package:rvc_mobile_application/data/local/shared_prefs/storage.dart';
import 'package:rvc_mobile_application/modules/home/page/home_page.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await Storage.setup();
  });

  testWidgets('home loads continue learning content', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    expect(find.text('Continue learning'), findsOneWidget);
    expect(find.text('Daily English'), findsOneWidget);
  });
}
