import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../echo_foundation/echo_progress_repository.dart';
import '../echo_foundation/echo_theme.dart';
import '../echo_foundation/widgets.dart';

@RoutePage()
class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = const EchoProgressRepository();
    final stats = repo.sentenceStats;
    return EchoScaffold(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Progress', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: EchoColors.darkText)),
          const SizedBox(height: 18),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.3,
            children: [
              _Stat(title: 'Current streak', value: '${repo.getProfile().currentStreak} days'),
              _Stat(title: 'This week', value: '${repo.weeklyPracticeMinutes} min'),
              _Stat(title: 'Sentences practiced', value: '${repo.sentencesPracticed}'),
              _Stat(title: 'Sentences mastered', value: '${repo.sentencesMastered}'),
              _Stat(title: 'Total attempts', value: '${repo.totalAttempts}'),
              _Stat(title: 'Best shadow score', value: '${repo.bestShadowScore}'),
              _Stat(title: 'Average score', value: '${repo.averageScore}'),
            ],
          ),
          const SizedBox(height: 24),
          const EchoSectionTitle('Weekly goal'),
          const SizedBox(height: 12),
          EchoCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${repo.weeklyPracticeMinutes} / ${repo.getProfile().weeklyGoalMinutes} minutes'),
                const SizedBox(height: 10),
                EchoProgressBar(value: repo.weeklyGoalProgress / 100),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const EchoSectionTitle('Recent activity'),
          const SizedBox(height: 12),
          if (stats.isEmpty)
            const EchoCard(
              child: Text(
                'No practice yet. Your shadowing attempts will appear here.',
                style: TextStyle(color: EchoColors.secondaryText),
              ),
            )
          else
            ...stats.take(6).map(
                  (item) => ListTile(
                    leading: const Icon(Icons.graphic_eq_rounded, color: EchoColors.primaryBlue),
                    title: Text(item.mastery),
                    subtitle: Text('Latest ${item.latestScore} · ${item.attemptCount} attempts'),
                    trailing: Text('${item.bestScore}', style: const TextStyle(fontWeight: FontWeight.w900)),
                  ),
                ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return EchoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: EchoColors.darkText)),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(color: EchoColors.secondaryText)),
        ],
      ),
    );
  }
}
