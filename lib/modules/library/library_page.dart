import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/app/app_router.dart';
import '../shadow_mvp/shadow_mvp.dart';

@RoutePage()
class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  final ShadowPassageRepository _repository = const ShadowPassageRepository();
  ShadowCefrLevel? _level;
  ShadowPassageTopic? _topic;
  bool _favoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    final featured = _repository.getFeaturedPassage();
    final passages = _repository.getPassages(
      level: _level,
      topic: _topic,
      favoritesOnly: _favoritesOnly,
    );

    return ShadowEditorialScaffold(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const ShadowEditorialHeader(
            wordmark: 'Library',
            metadata: 'Read, listen, shadow',
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
                  'Shadowing Library',
                  style: ShadowType.displayMedium,
                ),
                const SizedBox(height: ShadowSpacing.sm),
                const Text(
                  'Read, listen, and shadow curated passages.',
                  style: ShadowType.body,
                ),
                const SizedBox(height: ShadowSpacing.xl),
                _FeaturedPassage(passage: featured),
                const SizedBox(height: ShadowSpacing.xl),
                const ShadowMetadataLabel('Level'),
                const SizedBox(height: ShadowSpacing.sm),
                _LevelFilters(
                  selected: _level,
                  onSelected: (level) => setState(() => _level = level),
                ),
                const SizedBox(height: ShadowSpacing.lg),
                const ShadowMetadataLabel('Topic'),
                const SizedBox(height: ShadowSpacing.sm),
                _TopicFilters(
                  selected: _topic,
                  onSelected: (topic) => setState(() => _topic = topic),
                ),
                const SizedBox(height: ShadowSpacing.lg),
                ShadowPill(
                  label: _favoritesOnly ? 'Saved only' : 'Saved',
                  selected: _favoritesOnly,
                  onTap: () => setState(() => _favoritesOnly = !_favoritesOnly),
                ),
                const SizedBox(height: ShadowSpacing.xl),
                if (passages.isEmpty)
                  const _EmptyLibraryState()
                else
                  for (final entry in passages.indexed) ...[
                    _PassageTile(
                      index: entry.$1 + 1,
                      passage: entry.$2,
                      onFavorite: () async {
                        await _repository.toggleFavorite(entry.$2.id);
                        if (mounted) setState(() {});
                      },
                    ),
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

class _FeaturedPassage extends StatelessWidget {
  const _FeaturedPassage({required this.passage});

  final ShadowPassage passage;

  @override
  Widget build(BuildContext context) {
    return ShadowPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ShadowMetadataLabel("Today's drill"),
          const SizedBox(height: ShadowSpacing.md),
          Text(passage.title, style: ShadowType.displayMedium),
          const SizedBox(height: ShadowSpacing.sm),
          Text(passage.transcript, style: ShadowType.body),
          const SizedBox(height: ShadowSpacing.lg),
          _PassageMeta(passage: passage),
          const SizedBox(height: ShadowSpacing.lg),
          ShadowCtaButton(
            label: 'Practice Featured Drill',
            onPressed: () => context.router.push(
              PacerPracticeRoute(passageId: passage.id),
            ),
          ),
        ],
      ),
    );
  }
}

class _LevelFilters extends StatelessWidget {
  const _LevelFilters({required this.selected, required this.onSelected});

  final ShadowCefrLevel? selected;
  final ValueChanged<ShadowCefrLevel?> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: ShadowSpacing.sm,
      runSpacing: ShadowSpacing.sm,
      children: [
        ShadowPill(
          label: 'All',
          selected: selected == null,
          onTap: () => onSelected(null),
        ),
        for (final level in ShadowCefrLevel.values)
          ShadowPill(
            label: level.code,
            selected: selected == level,
            onTap: () => onSelected(level),
          ),
      ],
    );
  }
}

class _TopicFilters extends StatelessWidget {
  const _TopicFilters({required this.selected, required this.onSelected});

  final ShadowPassageTopic? selected;
  final ValueChanged<ShadowPassageTopic?> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: ShadowSpacing.sm,
      runSpacing: ShadowSpacing.sm,
      children: [
        ShadowPill(
          label: 'All',
          selected: selected == null,
          onTap: () => onSelected(null),
        ),
        for (final topic in ShadowPassageTopic.values)
          ShadowPill(
            label: topic.label,
            selected: selected == topic,
            onTap: () => onSelected(topic),
          ),
      ],
    );
  }
}

class _PassageTile extends StatelessWidget {
  const _PassageTile({
    required this.index,
    required this.passage,
    required this.onFavorite,
  });

  final int index;
  final ShadowPassage passage;
  final VoidCallback onFavorite;

  @override
  Widget build(BuildContext context) {
    return ShadowPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                index.toString().padLeft(2, '0'),
                style: ShadowType.metadata,
              ),
              const SizedBox(width: ShadowSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(passage.title, style: ShadowType.title),
                    const SizedBox(height: ShadowSpacing.xs),
                    Text(passage.description, style: ShadowType.caption),
                  ],
                ),
              ),
              IconButton(
                tooltip: passage.isFavorite ? 'Remove saved' : 'Save passage',
                onPressed: onFavorite,
                icon: Icon(
                  passage.isFavorite
                      ? Icons.bookmark_rounded
                      : Icons.bookmark_border_rounded,
                  color: ShadowColors.ink,
                ),
              ),
            ],
          ),
          const SizedBox(height: ShadowSpacing.md),
          _PassageMeta(passage: passage),
          const SizedBox(height: ShadowSpacing.md),
          ShadowCtaButton(
            label: 'Practice',
            onPressed: () => context.router.push(
              PacerPracticeRoute(passageId: passage.id),
            ),
          ),
        ],
      ),
    );
  }
}

class _PassageMeta extends StatelessWidget {
  const _PassageMeta({required this.passage});

  final ShadowPassage passage;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: ShadowSpacing.sm,
      runSpacing: ShadowSpacing.sm,
      children: [
        ShadowPill(label: passage.level.code, selected: true),
        ShadowPill(label: passage.topic.label),
        ShadowPill(label: _formatDuration(passage.duration)),
      ],
    );
  }
}

class _EmptyLibraryState extends StatelessWidget {
  const _EmptyLibraryState();

  @override
  Widget build(BuildContext context) {
    return const ShadowPanel(
      child: Text(
        'No passages match these filters yet.',
        style: ShadowType.body,
      ),
    );
  }
}

String _formatDuration(Duration duration) {
  final minutes = duration.inMinutes;
  final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
  return '$minutes:$seconds';
}
