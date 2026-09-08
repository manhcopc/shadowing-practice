import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/app/app_router.dart';
import '../echo_foundation/echo_progress_repository.dart';
import '../echo_foundation/echo_theme.dart';
import '../echo_foundation/mock_echo_repository.dart';
import '../echo_foundation/models.dart';
import '../echo_foundation/pronunciation_service.dart';
import '../echo_foundation/widgets.dart';
import '../shadowing/audio_player_widget.dart';

@RoutePage()
class ResultPage extends StatefulWidget {
  const ResultPage({
    super.key,
    required this.sentenceId,
    this.recordingPath,
    this.recordingDurationMs,
  });

  final String sentenceId;
  final String? recordingPath;
  final int? recordingDurationMs;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late final Future<ShadowAttempt> _attempt = _analyzeAndPersist();

  Future<ShadowAttempt> _analyzeAndPersist() async {
    final repo = const MockEchoRepository();
    final sentence = repo.findSentence(widget.sentenceId);
    final lesson = repo.lessonForSentence(widget.sentenceId);
    if (sentence == null || lesson == null) {
      throw StateError('Result not found');
    }
    final progressRepo = const EchoProgressRepository();
    final attempt = await const MockPronunciationService().analyzeAttempt(
      sentenceId: widget.sentenceId,
      targetText: sentence.text,
      nativeDuration: sentence.duration,
      recordingPath: widget.recordingPath,
      recordingDuration: Duration(
        milliseconds: widget.recordingDurationMs ?? sentence.duration.inMilliseconds,
      ),
      previousBestScore: progressRepo.bestScoreForSentence(widget.sentenceId),
    );
    await progressRepo.completeSentence(
      lessonId: lesson.id,
      totalSentences: lesson.sentences.length,
      sentenceOrder: sentence.order,
      sentenceId: sentence.id,
      score: attempt.overallShadowScore,
    );
    return attempt;
  }

  @override
  Widget build(BuildContext context) {
    final repo = const MockEchoRepository();
    final sentence = repo.findSentence(widget.sentenceId);
    final lesson = repo.lessonForSentence(widget.sentenceId);
    if (sentence == null || lesson == null) {
      return const EchoScaffold(child: Center(child: Text('Result not found')));
    }
    return EchoScaffold(
      appBar: AppBar(
        title: const Text('Your result'),
        backgroundColor: EchoColors.background,
      ),
      child: FutureBuilder<ShadowAttempt>(
        future: _attempt,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Speech analysis failed.'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final attempt = snapshot.data!;
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              EchoCard(
                child: Column(
                  children: [
                    const Text(
                      'Shadow Score',
                      style: TextStyle(
                        color: EchoColors.secondaryText,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${attempt.overallShadowScore}',
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                        color: EchoColors.darkText,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _headline(attempt),
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: EchoColors.darkText,
                      ),
                    ),
                    if (attempt.improvement != null) ...[
                      const SizedBox(height: 8),
                      Chip(
                        label: Text(
                          attempt.improvement! >= 0
                              ? '+${attempt.improvement} improvement'
                              : '${attempt.improvement} from best',
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 18),
              EchoCard(
                child: Column(
                  children: [
                    _Score(label: 'Words matched', score: attempt.wordsMatchedScore),
                    _Score(label: 'Timing', score: attempt.timingScore),
                    _Score(label: 'Pacing', score: attempt.pacingScore),
                    _Score(label: 'Completion', score: attempt.completionScore),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              EchoCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const EchoSectionTitle('Transcript feedback'),
                    const SizedBox(height: 14),
                    const Text('Target', style: TextStyle(color: EchoColors.secondaryText)),
                    const SizedBox(height: 6),
                    Text(sentence.text, style: const TextStyle(fontWeight: FontWeight.w800)),
                    const SizedBox(height: 14),
                    const Text('You said', style: TextStyle(color: EchoColors.secondaryText)),
                    const SizedBox(height: 6),
                    Text(attempt.transcript, style: const TextStyle(fontWeight: FontWeight.w800)),
                    const SizedBox(height: 14),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: attempt.comparison.map(_comparisonChip).toList(),
                    ),
                    const SizedBox(height: 14),
                    Text(attempt.feedback, style: const TextStyle(color: EchoColors.secondaryText, height: 1.4)),
                  ],
                ),
              ),
              if (attempt.wordFeedback.isNotEmpty) ...[
                const SizedBox(height: 18),
                EchoCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const EchoSectionTitle('Try this phrase'),
                      const SizedBox(height: 10),
                      ...attempt.wordFeedback.entries.map(
                        (entry) => ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(entry.key),
                          subtitle: Text(entry.value),
                          trailing: IconButton(
                            tooltip: 'Listen to full sentence',
                            onPressed: () {},
                            icon: const Icon(Icons.volume_up_rounded),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 18),
              const EchoSectionTitle('Reference audio'),
              const SizedBox(height: 10),
              EchoCard(child: EchoAudioPlayerWidget(duration: sentence.duration)),
              if (widget.recordingPath != null) ...[
                const SizedBox(height: 18),
                const EchoSectionTitle('Your recording'),
                const SizedBox(height: 10),
                EchoCard(
                  child: EchoAudioPlayerWidget(
                    duration: Duration(milliseconds: attempt.durationMs),
                    filePath: widget.recordingPath,
                  ),
                ),
              ],
              const SizedBox(height: 18),
              EchoCard(
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EchoSectionTitle('Pronunciation analysis'),
                    SizedBox(height: 8),
                    Text(
                      'Coming soon. Current V2 scoring uses transcript matching and timing heuristics, not acoustic pronunciation analysis.',
                      style: TextStyle(color: EchoColors.secondaryText, height: 1.4),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => context.router.replace(
                        ShadowingRoute(sentenceId: widget.sentenceId),
                      ),
                      icon: const Icon(Icons.replay_rounded),
                      label: const Text('Try again'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: () {
                        final nextIndex = sentence.order;
                        if (nextIndex < lesson.sentences.length) {
                          context.router.replace(
                            LessonPlayerRoute(
                              lessonId: lesson.id,
                              sentenceIndex: nextIndex,
                            ),
                          );
                        } else {
                          context.router.replace(
                            CourseDetailRoute(courseId: lesson.courseId),
                          );
                        }
                      },
                      icon: const Icon(Icons.arrow_forward_rounded),
                      label: Text(
                        sentence.order < lesson.sentences.length
                            ? 'Next sentence'
                            : 'Complete lesson',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  String _headline(ShadowAttempt attempt) {
    if (attempt.overallShadowScore >= 85) return 'Mastered';
    if (attempt.overallShadowScore >= 70) return 'Good attempt';
    return 'Needs practice';
  }

  Widget _comparisonChip(WordComparison item) {
    final color = switch (item.status) {
      WordComparisonStatus.correct => EchoColors.teal,
      WordComparisonStatus.incorrect => EchoColors.warning,
      WordComparisonStatus.missing => Colors.redAccent,
      WordComparisonStatus.extra => EchoColors.secondaryText,
    };
    final text = switch (item.status) {
      WordComparisonStatus.correct => item.targetWord ?? '',
      WordComparisonStatus.incorrect =>
        '${item.targetWord} → ${item.spokenWord}',
      WordComparisonStatus.missing => '${item.targetWord} missing',
      WordComparisonStatus.extra => '${item.spokenWord} extra',
    };
    return Chip(
      label: Text(text),
      side: BorderSide(color: color.withValues(alpha: 0.4)),
      backgroundColor: color.withValues(alpha: 0.1),
    );
  }
}

class _Score extends StatelessWidget {
  const _Score({required this.label, required this.score});
  final String label;
  final int score;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [Expanded(child: Text(label)), Text('$score')]),
          const SizedBox(height: 8),
          EchoProgressBar(value: score / 100),
        ],
      ),
    );
  }
}
