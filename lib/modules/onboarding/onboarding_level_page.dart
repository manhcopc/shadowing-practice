import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/app/app_router.dart';
import '../echo_foundation/echo_progress_repository.dart';
import '../echo_foundation/echo_theme.dart';
import '../echo_foundation/widgets.dart';

@RoutePage()
class OnboardingLevelPage extends StatefulWidget {
  const OnboardingLevelPage({super.key, required this.language});

  final String language;

  @override
  State<OnboardingLevelPage> createState() => _OnboardingLevelPageState();
}

class _OnboardingLevelPageState extends State<OnboardingLevelPage> {
  String selectedLevel = 'Beginner';
  int weeklyGoal = 30;
  final repo = const EchoProgressRepository();

  final descriptions = const {
    'Beginner': 'I can understand and use basic expressions in everyday situations.',
    'Intermediate': 'I can handle simple conversations and understand common topics.',
    'Advanced': 'I can express myself fluently and understand most real-life conversations.',
  };

  @override
  Widget build(BuildContext context) {
    return EchoScaffold(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            const Text('Step 2 of 2', style: TextStyle(color: EchoColors.secondaryText)),
            const SizedBox(height: 24),
            const Text(
              "What's your current level?",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: EchoColors.darkText),
            ),
            const SizedBox(height: 10),
            const Text(
              "We'll personalize your shadowing journey.",
              style: TextStyle(fontSize: 16, color: EchoColors.secondaryText),
            ),
            const SizedBox(height: 28),
            ...descriptions.entries.map(_levelCard),
            const SizedBox(height: 24),
            const EchoSectionTitle('Weekly goal'),
            const SizedBox(height: 12),
            SegmentedButton<int>(
              segments: const [
                ButtonSegment(value: 15, label: Text('15 min')),
                ButtonSegment(value: 30, label: Text('30 min')),
                ButtonSegment(value: 60, label: Text('60 min')),
              ],
              selected: {weeklyGoal},
              onSelectionChanged: (value) => setState(() => weeklyGoal = value.first),
            ),
            const SizedBox(height: 18),
            EchoCard(
              child: Text(
                '${widget.language} · $selectedLevel · $weeklyGoal min/week',
                style: const TextStyle(fontWeight: FontWeight.w800, color: EchoColors.darkText),
              ),
            ),
            const SizedBox(height: 24),
            EchoGradientButton(
              label: 'Start learning',
              onPressed: () async {
                await repo.saveOnboarding(
                  language: widget.language,
                  level: selectedLevel,
                  weeklyGoal: weeklyGoal,
                );
                if (context.mounted) context.router.replace(const MainRoute());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _levelCard(MapEntry<String, String> entry) {
    final selected = selectedLevel == entry.key;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () => setState(() => selectedLevel = entry.key),
        child: EchoCard(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(entry.key, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: EchoColors.darkText)),
                    const SizedBox(height: 8),
                    Text(entry.value, style: const TextStyle(color: EchoColors.secondaryText, height: 1.35)),
                  ],
                ),
              ),
              Icon(selected ? Icons.check_circle_rounded : Icons.circle_outlined, color: selected ? EchoColors.teal : EchoColors.border),
            ],
          ),
        ),
      ),
    );
  }
}
