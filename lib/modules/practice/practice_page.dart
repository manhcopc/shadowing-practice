import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../shadow_mvp/shadow_mvp.dart';

@RoutePage()
class PracticePage extends StatelessWidget {
  const PracticePage({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = const ShadowPassageRepository();
    final featured = repository.getFeaturedPassage();
    final savedCount = repository.getPassages(favoritesOnly: true).length;

    return ShadowEditorialScaffold(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const ShadowEditorialHeader(
            wordmark: 'Practice',
            metadata: 'Player shell',
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
                const Text('Practice', style: ShadowType.displayMedium),
                const SizedBox(height: ShadowSpacing.sm),
                const Text(
                  'Your shadow player, saved drills, and quick review will sit here.',
                  style: ShadowType.body,
                ),
                const SizedBox(height: ShadowSpacing.xl),
                _PracticeBlock(
                  label: 'Continue',
                  title: featured.title,
                  body: featured.description,
                ),
                const SizedBox(height: ShadowSpacing.md),
                _PracticeBlock(
                  label: 'Saved passages',
                  title: '$savedCount saved',
                  body: savedCount == 0
                      ? 'Save passages from the library to build a repeat list.'
                      : 'Return to the passages you marked for repetition.',
                ),
                const SizedBox(height: ShadowSpacing.md),
                const _PracticeBlock(
                  label: 'Quick review',
                  title: 'No review queue yet',
                  body:
                      'Words, phrases, and grammar points will appear after learning tools are added.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PracticeBlock extends StatelessWidget {
  const _PracticeBlock({
    required this.label,
    required this.title,
    required this.body,
  });

  final String label;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return ShadowPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShadowMetadataLabel(label),
          const SizedBox(height: ShadowSpacing.sm),
          Text(title, style: ShadowType.title),
          const SizedBox(height: ShadowSpacing.xs),
          Text(body, style: ShadowType.caption),
        ],
      ),
    );
  }
}
