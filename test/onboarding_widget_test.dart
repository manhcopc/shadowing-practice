import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rvc_mobile_application/modules/onboarding/onboarding_language_page.dart';

void main() {
  testWidgets('onboarding language selection renders English by default', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: OnboardingLanguagePage()));
    expect(find.text('What language do you want to speak?'), findsOneWidget);
    expect(find.text('English'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
  });
}
