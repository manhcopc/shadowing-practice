import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/app/app_router.dart';
import '../echo_foundation/echo_progress_repository.dart';
import '../echo_foundation/echo_theme.dart';
import '../echo_foundation/mock_echo_repository.dart';
import '../echo_foundation/widgets.dart';

@RoutePage()
class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({super.key, required this.courseId});
  final String courseId;

  @override
  Widget build(BuildContext context) {
    final progressRepo = const EchoProgressRepository();
    final repo = const MockEchoRepository();
    final course = repo.getCourse(courseId, progress: progressRepo.lessonProgress);
    final lessons = repo.getLessons(progress: progressRepo.lessonProgress);
    return EchoScaffold(
      appBar: AppBar(title: Text(course.title), backgroundColor: EchoColors.background),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          EchoCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Ordering Coffee', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: EchoColors.darkText)),
                const SizedBox(height: 8),
                const Text('Learn natural expressions for coffee shop conversations.', style: TextStyle(color: EchoColors.secondaryText)),
                const SizedBox(height: 18),
                EchoProgressBar(value: course.progress),
                const SizedBox(height: 8),
                Text('${(course.progress * 10).round()} / 10 lessons', style: const TextStyle(color: EchoColors.secondaryText)),
              ],
            ),
          ),
          const SizedBox(height: 22),
          const EchoSectionTitle('Lessons'),
          const SizedBox(height: 12),
          ...lessons.map((lesson) {
            final current = lesson.progress > 0 && lesson.progress < 1 || lesson.order == 1;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                tileColor: current ? EchoColors.primaryBlue.withValues(alpha: 0.08) : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: const BorderSide(color: EchoColors.border),
                ),
                leading: CircleAvatar(
                  backgroundColor: lesson.isCompleted ? EchoColors.teal : EchoColors.primaryBlue,
                  child: Icon(lesson.isCompleted ? Icons.check_rounded : Icons.play_arrow_rounded, color: Colors.white),
                ),
                title: Text('${lesson.order}. ${lesson.title}', style: const TextStyle(fontWeight: FontWeight.w800)),
                subtitle: Text(lesson.description),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () => context.router.push(LessonPlayerRoute(lessonId: lesson.id, sentenceIndex: 0)),
              ),
            );
          }),
        ],
      ),
    );
  }
}
