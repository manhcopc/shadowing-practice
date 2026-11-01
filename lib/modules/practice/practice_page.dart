import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/app/app_router.dart';
import '../shadow_mvp/shadow_mvp.dart';

@RoutePage()
class PracticePage extends StatelessWidget {
  const PracticePage({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = const ShadowPassageRepository();
    final featured = repository.getFeaturedPassage();
    final allPassages = repository.getPassages();
    final savedPassages = repository.getPassages(favoritesOnly: true);

    return ShadowEditorialScaffold(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const ShadowEditorialHeader(
            wordmark: 'Practice',
            metadata: 'Shadow Pacer Engine',
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              ShadowSpacing.lg,
              ShadowSpacing.lg,
              ShadowSpacing.lg,
              ShadowSpacing.xxl,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Practice Room', style: ShadowType.displayMedium),
                const SizedBox(height: ShadowSpacing.sm),
                const Text(
                  'Follow the paced running text. Choose between Sentence Focus and Teleprompter scroll.',
                  style: ShadowType.body,
                ),
                const SizedBox(height: ShadowSpacing.xl),

                // Featured Drill Hero Card
                ShadowPanel(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const ShadowMetadataLabel("Current Drill"),
                          ShadowPill(label: featured.level.code, selected: true),
                        ],
                      ),
                      const SizedBox(height: ShadowSpacing.md),
                      Text(featured.title, style: ShadowType.displayMedium.copyWith(fontSize: 24)),
                      const SizedBox(height: ShadowSpacing.xs),
                      Text(featured.description, style: ShadowType.body),
                      const SizedBox(height: ShadowSpacing.lg),
                      Wrap(
                        spacing: ShadowSpacing.sm,
                        children: [
                          ShadowPill(label: featured.topic.label),
                          ShadowPill(label: '${featured.sentences.length} sentences'),
                        ],
                      ),
                      const SizedBox(height: ShadowSpacing.lg),
                      ShadowCtaButton(
                        label: 'Start Shadowing',
                        onPressed: () => context.router.push(
                          PacerPracticeRoute(passageId: featured.id),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: ShadowSpacing.xl),

                // Quick Drills Section
                const ShadowMetadataLabel('Quick Drills by Topic'),
                const SizedBox(height: ShadowSpacing.md),

                for (final passage in allPassages.take(4)) ...[
                  InkWell(
                    borderRadius: const BorderRadius.all(ShadowRadius.md),
                    onTap: () => context.router.push(
                      PacerPracticeRoute(passageId: passage.id),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: ShadowSpacing.md),
                      padding: const EdgeInsets.all(ShadowSpacing.md),
                      decoration: BoxDecoration(
                        color: ShadowColors.paper,
                        borderRadius: const BorderRadius.all(ShadowRadius.md),
                        border: Border.all(color: ShadowColors.divider),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ShadowPill(label: passage.level.code, selected: true),
                                    const SizedBox(width: ShadowSpacing.xs),
                                    Text(
                                      passage.topic.label.toUpperCase(),
                                      style: ShadowType.metadata.copyWith(fontSize: 9),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: ShadowSpacing.sm),
                                Text(passage.title, style: ShadowType.title.copyWith(fontSize: 16)),
                                const SizedBox(height: 2),
                                Text(
                                  passage.sentences.first.text,
                                  style: ShadowType.caption.copyWith(
                                    fontStyle: FontStyle.italic,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: ShadowSpacing.sm),
                          const Icon(
                            Icons.play_circle_outline_rounded,
                            color: ShadowColors.ink,
                            size: 32,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],

                const SizedBox(height: ShadowSpacing.lg),

                // Saved drills summary
                ShadowPanel(
                  child: Row(
                    children: [
                      const Icon(Icons.bookmark_added_rounded, color: ShadowColors.ink, size: 28),
                      const SizedBox(width: ShadowSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const ShadowMetadataLabel('Saved Passages'),
                            const SizedBox(height: 2),
                            Text(
                              '${savedPassages.length} bài đã lưu',
                              style: ShadowType.title.copyWith(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () => context.router.push(const LibraryRoute()),
                        child: Text(
                          'MỞ THƯ VIỆN',
                          style: ShadowType.metadata.copyWith(color: ShadowColors.ink),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
