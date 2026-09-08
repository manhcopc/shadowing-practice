import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/app/app_router.dart';
import '../echo_foundation/echo_progress_repository.dart';
import '../echo_foundation/echo_theme.dart';
import '../echo_foundation/mock_echo_repository.dart';
import '../echo_foundation/widgets.dart';

@RoutePage()
class LearnPage extends StatelessWidget {
  const LearnPage({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = const EchoProgressRepository().lessonProgress;
    final courses = const MockEchoRepository().getCourses(progress: progress);
    return EchoScaffold(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Learn', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: EchoColors.darkText)),
          const SizedBox(height: 8),
          const Text('Choose a course and keep your speaking momentum.', style: TextStyle(color: EchoColors.secondaryText)),
          const SizedBox(height: 22),
          ...courses.map((course) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: InkWell(
                  borderRadius: BorderRadius.circular(24),
                  onTap: () => context.router.push(CourseDetailRoute(courseId: course.id)),
                  child: EchoCard(
                    child: Row(
                      children: [
                        Text(course.thumbnail, style: const TextStyle(fontSize: 34)),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(course.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: EchoColors.darkText)),
                              const SizedBox(height: 6),
                              Text(course.description, style: const TextStyle(color: EchoColors.secondaryText, height: 1.35)),
                              const SizedBox(height: 12),
                              EchoProgressBar(value: course.progress),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Icon(Icons.chevron_right_rounded, color: EchoColors.secondaryText),
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
