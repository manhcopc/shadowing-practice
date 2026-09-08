import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../shadow_mvp/shadow_mvp.dart';

@RoutePage()
class LevelPage extends StatelessWidget {
  const LevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    final levels = const ShadowPassageRepository().getLevels();

    return ShadowEditorialScaffold(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ShadowEditorialHeader(
            wordmark: 'Levels',
            metadata: 'Pick a comfortable range',
            trailing: IconButton(
              tooltip: 'Close',
              icon: const Icon(Icons.close_rounded, color: ShadowColors.ink),
              onPressed: () => context.router.maybePop(),
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
                const Text(
                  'Start where your voice stays relaxed.',
                  style: ShadowType.displayMedium,
                ),
                const SizedBox(height: ShadowSpacing.md),
                const Text(
                  'Move up when you can repeat the full passage without chasing the audio.',
                  style: ShadowType.body,
                ),
                const SizedBox(height: ShadowSpacing.xl),
                for (final level in levels) ...[
                  _LevelTile(level: level),
                  const SizedBox(height: ShadowSpacing.md),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LevelTile extends StatelessWidget {
  const _LevelTile({required this.level});

  final ShadowLevelOverview level;

  @override
  Widget build(BuildContext context) {
    final isLocked = level.passageCount == 0;

    return ShadowPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(level.level.code, style: ShadowType.displayMedium),
              const SizedBox(width: ShadowSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(level.level.title, style: ShadowType.title),
                    const SizedBox(height: ShadowSpacing.xs),
                    Text(
                      isLocked
                          ? 'Preparing future passages'
                          : '${level.passageCount} passages available',
                      style: ShadowType.caption,
                    ),
                  ],
                ),
              ),
              if (level.isRecommended)
                const ShadowPill(label: 'Recommended', selected: true),
            ],
          ),
          const SizedBox(height: ShadowSpacing.md),
          Text(level.description, style: ShadowType.body),
          const SizedBox(height: ShadowSpacing.md),
          Wrap(
            spacing: ShadowSpacing.sm,
            runSpacing: ShadowSpacing.sm,
            children: level.topics
                .map((topic) => ShadowPill(label: topic.label))
                .toList(),
          ),
        ],
      ),
    );
  }
}
