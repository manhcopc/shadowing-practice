import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../../core/app/app_router.dart';
import '../../echo_foundation/echo_progress_repository.dart';
import '../../echo_foundation/echo_theme.dart';
import '../../echo_foundation/mock_echo_repository.dart';
import '../../echo_foundation/widgets.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final progressRepo = const EchoProgressRepository();
    final profile = progressRepo.getProfile();
    final course = const MockEchoRepository().getCourse(
      'daily-english',
      progress: progressRepo.lessonProgress,
    );
    final hasPractice = progressRepo.totalAttempts > 0;
    return EchoScaffold(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Good morning, ${profile.name}',
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: EchoColors.darkText),
          ),
          const SizedBox(height: 6),
          const Text("Let's practice your speaking today", style: TextStyle(color: EchoColors.secondaryText, fontSize: 16)),
          const SizedBox(height: 22),
          EchoCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.local_fire_department_rounded, color: EchoColors.warning),
                    const SizedBox(width: 10),
                    Text(
                      hasPractice
                          ? '${profile.currentStreak} day streak'
                          : 'Start your first streak',
                      style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: EchoColors.darkText),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  hasPractice
                      ? 'Weekly goal: ${progressRepo.weeklyPracticeMinutes} / ${profile.weeklyGoalMinutes} minutes'
                      : 'Practice one sentence today to start tracking progress.',
                  style: const TextStyle(color: EchoColors.secondaryText),
                ),
                const SizedBox(height: 10),
                EchoProgressBar(value: progressRepo.weeklyGoalProgress / 100),
              ],
            ),
          ),
          const SizedBox(height: 22),
          const EchoSectionTitle('Continue learning'),
          const SizedBox(height: 12),
          EchoCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(course.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: EchoColors.darkText)),
                const SizedBox(height: 6),
                const Text('Ordering Coffee', style: TextStyle(color: EchoColors.secondaryText)),
                const SizedBox(height: 16),
                EchoProgressBar(value: course.progress),
                const SizedBox(height: 8),
                Text('${(course.progress * 10).round()} / 10 lessons', style: const TextStyle(color: EchoColors.secondaryText)),
                const SizedBox(height: 16),
                EchoGradientButton(
                  label: 'Continue',
                  icon: Icons.play_arrow_rounded,
                  onPressed: () => context.router.push(CourseDetailRoute(courseId: course.id)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          const EchoSectionTitle('Explore'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: ['Daily Life', 'Travel', 'Business', 'Movies']
                .map((label) => Chip(label: Text(label)))
                .toList(),
          ),
          const SizedBox(height: 22),
          const EchoSectionTitle('Recent performance'),
          const SizedBox(height: 12),
          if (hasPractice)
            EchoCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _Metric(label: 'Average Score', value: '${progressRepo.averageScore}'),
                  _Metric(label: 'Best Score', value: '${progressRepo.bestShadowScore}'),
                  _Metric(label: 'Attempts', value: '${progressRepo.totalAttempts}'),
                ],
              ),
            )
          else
            const EchoCard(
              child: Text(
                'Your attempts will appear here after your first shadowing session.',
                style: TextStyle(color: EchoColors.secondaryText),
              ),
            ),
        ],
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: EchoColors.darkText)),
        const SizedBox(height: 4),
        SizedBox(
          width: 92,
          child: Text(label, textAlign: TextAlign.center, style: const TextStyle(color: EchoColors.secondaryText, fontSize: 12)),
        ),
      ],
    );
  }
}
