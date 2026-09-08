import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/app/app_router.dart';
import '../../shadow_mvp/shadow_mvp.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = const ShadowPassageRepository();
    final featured = repository.getFeaturedPassage();
    final recommendedLevel = repository.getLevels().firstWhere(
      (level) => level.isRecommended,
    );
    final passages = repository.getPassages();
    final favorites = passages.where((passage) => passage.isFavorite).length;

    return ShadowEditorialScaffold(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ShadowEditorialHeader(
            wordmark: 'ECHO',
            metadata: 'Guided shadowing reader',
            trailing: IconButton(
              tooltip: 'Choose level',
              icon: const Icon(Icons.tune_rounded, color: ShadowColors.ink),
              onPressed: () => context.router.push(const LevelRoute()),
            ),
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
                const Text('Speak better.', style: ShadowType.displayLarge),
                const SizedBox(height: ShadowSpacing.sm),
                const Text(
                  'Read, listen, and repeat short English passages with a calmer rhythm.',
                  style: ShadowType.body,
                ),
                const SizedBox(height: ShadowSpacing.xl),
                _TodayPanel(passage: featured),
                const SizedBox(height: ShadowSpacing.xl),
                Row(
                  children: [
                    Expanded(
                      child: _HomeStat(
                        label: 'LEVEL',
                        value: recommendedLevel.level.code,
                        detail: recommendedLevel.level.title,
                      ),
                    ),
                    const SizedBox(width: ShadowSpacing.md),
                    Expanded(
                      child: _HomeStat(
                        label: 'LIBRARY',
                        value: '${passages.length}',
                        detail: 'Passages ready',
                      ),
                    ),
                    const SizedBox(width: ShadowSpacing.md),
                    Expanded(
                      child: _HomeStat(
                        label: 'SAVED',
                        value: '$favorites',
                        detail: 'Favorites',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: ShadowSpacing.xl),
                const ShadowMetadataLabel('Study path'),
                const SizedBox(height: ShadowSpacing.md),
                _PathTile(
                  index: '01',
                  title: 'Choose your level',
                  body:
                      'Start with A2 if you can handle short opinions and simple routines.',
                  actionLabel: 'OPEN LEVELS',
                  onPressed: () => context.router.push(const LevelRoute()),
                ),
                const SizedBox(height: ShadowSpacing.md),
                _PathTile(
                  index: '02',
                  title: 'Pick a passage',
                  body:
                      'Browse by level and topic, then save the pieces you want to repeat.',
                  actionLabel: 'OPEN LIBRARY',
                  onPressed: () => context.router.push(const LibraryRoute()),
                ),
                const SizedBox(height: ShadowSpacing.md),
                const _PathTile(
                  index: '03',
                  title: 'Shadow with the transcript',
                  body:
                      'The running transcript and player arrive in the next commits.',
                  actionLabel: 'COMING NEXT',
                  onPressed: null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TodayPanel extends StatelessWidget {
  const _TodayPanel({required this.passage});

  final ShadowPassage passage;

  @override
  Widget build(BuildContext context) {
    return ShadowPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ShadowMetadataLabel("Today's shadowing"),
          const SizedBox(height: ShadowSpacing.md),
          Text(passage.title, style: ShadowType.displayMedium),
          const SizedBox(height: ShadowSpacing.sm),
          Text(passage.description, style: ShadowType.body),
          const SizedBox(height: ShadowSpacing.lg),
          Wrap(
            spacing: ShadowSpacing.sm,
            runSpacing: ShadowSpacing.sm,
            children: [
              ShadowPill(label: passage.level.code, selected: true),
              ShadowPill(label: passage.topic.label),
              ShadowPill(label: _formatDuration(passage.duration)),
            ],
          ),
          const SizedBox(height: ShadowSpacing.lg),
          ShadowCtaButton(
            label: 'Open Library',
            onPressed: () => context.router.push(const LibraryRoute()),
          ),
        ],
      ),
    );
  }
}

class _HomeStat extends StatelessWidget {
  const _HomeStat({
    required this.label,
    required this.value,
    required this.detail,
  });

  final String label;
  final String value;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return ShadowPanel(
      padding: const EdgeInsets.all(ShadowSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShadowMetadataLabel(label),
          const SizedBox(height: ShadowSpacing.sm),
          Text(value, style: ShadowType.displayMedium),
          const SizedBox(height: ShadowSpacing.xs),
          Text(detail, style: ShadowType.caption),
        ],
      ),
    );
  }
}

class _PathTile extends StatelessWidget {
  const _PathTile({
    required this.index,
    required this.title,
    required this.body,
    required this.actionLabel,
    required this.onPressed,
  });

  final String index;
  final String title;
  final String body;
  final String actionLabel;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ShadowPanel(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(index, style: ShadowType.metadata),
          const SizedBox(width: ShadowSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: ShadowType.title),
                const SizedBox(height: ShadowSpacing.xs),
                Text(body, style: ShadowType.caption),
                const SizedBox(height: ShadowSpacing.md),
                TextButton(
                  onPressed: onPressed,
                  style: TextButton.styleFrom(
                    foregroundColor: ShadowColors.ink,
                    padding: EdgeInsets.zero,
                    textStyle: ShadowType.metadata,
                  ),
                  child: Text(actionLabel),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String _formatDuration(Duration duration) {
  final minutes = duration.inMinutes;
  final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
  return '$minutes:$seconds';
}
