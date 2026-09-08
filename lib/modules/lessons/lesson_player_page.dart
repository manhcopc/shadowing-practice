import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/app/app_router.dart';
import '../echo_foundation/echo_theme.dart';
import '../echo_foundation/mock_echo_repository.dart';
import '../echo_foundation/widgets.dart';
import '../shadowing/audio_player_widget.dart';

@RoutePage()
class LessonPlayerPage extends StatelessWidget {
  const LessonPlayerPage({super.key, required this.lessonId, this.sentenceIndex = 0});
  final String lessonId;
  final int sentenceIndex;

  @override
  Widget build(BuildContext context) {
    final lesson = const MockEchoRepository().findLesson(lessonId);
    if (lesson == null) return const _MissingLesson();
    final index = sentenceIndex.clamp(0, lesson.sentences.length - 1);
    final sentence = lesson.sentences[index];
    return EchoScaffold(
      appBar: AppBar(title: Text('Lesson ${lesson.order} of 10'), backgroundColor: EchoColors.background),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Listen carefully', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: EchoColors.darkText)),
          const SizedBox(height: 8),
          const Text('Hear the sentence and focus on the natural rhythm.', style: TextStyle(color: EchoColors.secondaryText)),
          const SizedBox(height: 20),
          EchoCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sentence.text, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: EchoColors.darkText, height: 1.25)),
                const SizedBox(height: 10),
                Text(sentence.translation, style: const TextStyle(color: EchoColors.secondaryText)),
                const SizedBox(height: 18),
                EchoAudioPlayerWidget(duration: sentence.duration),
              ],
            ),
          ),
          const SizedBox(height: 18),
          DefaultTabController(
            length: 3,
            child: EchoCard(
              child: SizedBox(
                height: 220,
                child: Column(
                  children: [
                    const TabBar(tabs: [Tab(text: 'Transcript'), Tab(text: 'Translation'), Tab(text: 'Vocabulary')]),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Center(child: Text(sentence.text, textAlign: TextAlign.center)),
                          Center(child: Text(sentence.translation, textAlign: TextAlign.center)),
                          ListView(
                            children: sentence.vocabulary
                                .map((item) => ListTile(
                                      title: Text(item.word),
                                      subtitle: Text('${item.type} · ${item.meaning}'),
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          EchoGradientButton(
            label: 'Continue to shadow',
            icon: Icons.mic_rounded,
            onPressed: () => context.router.push(ShadowingRoute(sentenceId: sentence.id)),
          ),
        ],
      ),
    );
  }
}

class _MissingLesson extends StatelessWidget {
  const _MissingLesson();
  @override
  Widget build(BuildContext context) {
    return const EchoScaffold(child: Center(child: Text('Lesson not found')));
  }
}
