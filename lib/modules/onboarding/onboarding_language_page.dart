import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/app/app_router.dart';
import '../echo_foundation/echo_theme.dart';
import '../echo_foundation/widgets.dart';

@RoutePage()
class OnboardingLanguagePage extends StatefulWidget {
  const OnboardingLanguagePage({super.key});

  @override
  State<OnboardingLanguagePage> createState() => _OnboardingLanguagePageState();
}

class _OnboardingLanguagePageState extends State<OnboardingLanguagePage> {
  String selectedLanguage = 'English';
  final languages = const ['English', 'Korean', 'Japanese', 'Chinese', 'French', 'Spanish'];

  @override
  Widget build(BuildContext context) {
    return EchoScaffold(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Step 1 of 2', style: TextStyle(color: EchoColors.secondaryText)),
            const SizedBox(height: 24),
            const Text(
              'What language do you want to speak?',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: EchoColors.darkText),
            ),
            const SizedBox(height: 10),
            const Text(
              'Choose your target language to start shadowing.',
              style: TextStyle(fontSize: 16, color: EchoColors.secondaryText, height: 1.4),
            ),
            const SizedBox(height: 28),
            Expanded(
              child: ListView.separated(
                itemCount: languages.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final language = languages[index];
                  final selected = selectedLanguage == language;
                  return Semantics(
                    button: true,
                    selected: selected,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(22),
                      onTap: () => setState(() => selectedLanguage = language),
                      child: EchoCard(
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                language,
                                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: EchoColors.darkText),
                              ),
                            ),
                            if (language != 'English')
                              const Text('Soon', style: TextStyle(color: EchoColors.secondaryText)),
                            const SizedBox(width: 12),
                            Icon(
                              selected ? Icons.check_circle_rounded : Icons.circle_outlined,
                              color: selected ? EchoColors.teal : EchoColors.border,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            EchoGradientButton(
              label: 'Continue',
              onPressed: () => context.router.push(OnboardingLevelRoute(language: selectedLanguage)),
            ),
            TextButton(
              onPressed: () => context.router.push(OnboardingLevelRoute(language: 'English')),
              child: const Center(child: Text('Skip for now')),
            ),
          ],
        ),
      ),
    );
  }
}
