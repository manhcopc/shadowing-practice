import 'package:flutter/material.dart';
import '../../design/shadow_design_tokens.dart';
import '../pacer_controller.dart';

class TeleprompterView extends StatefulWidget {
  const TeleprompterView({
    super.key,
    required this.controller,
  });

  final PacerController controller;

  @override
  State<TeleprompterView> createState() => _TeleprompterViewState();
}

class _TeleprompterViewState extends State<TeleprompterView> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sentenceKeys = [];
  int _lastIndex = -1;

  @override
  void initState() {
    super.initState();
    _initKeys();
    widget.controller.addListener(_onControllerUpdate);
  }

  void _initKeys() {
    _sentenceKeys.clear();
    for (int i = 0; i < widget.controller.totalSentences; i++) {
      _sentenceKeys.add(GlobalKey());
    }
  }

  @override
  void didUpdateWidget(covariant TeleprompterView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller.totalSentences != widget.controller.totalSentences) {
      _initKeys();
    }
  }

  void _onControllerUpdate() {
    final curIndex = widget.controller.currentIndex;
    if (curIndex != _lastIndex && curIndex >= 0 && curIndex < _sentenceKeys.length) {
      _lastIndex = curIndex;
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToActive(curIndex));
    }
  }

  void _scrollToActive(int index) {
    if (!mounted || index < 0 || index >= _sentenceKeys.length) return;
    final context = _sentenceKeys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        alignment: 0.35, // Position near 1/3 from top
      );
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerUpdate);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, _) {
        final sentences = widget.controller.passage.sentences;

        return Container(
          decoration: BoxDecoration(
            color: ShadowColors.paper,
            borderRadius: const BorderRadius.all(ShadowRadius.lg),
            border: Border.all(color: ShadowColors.divider),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(ShadowRadius.lg),
            child: ListView.separated(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(
                horizontal: ShadowSpacing.lg,
                vertical: ShadowSpacing.xl,
              ),
              itemCount: sentences.length,
              separatorBuilder: (context, index) => const SizedBox(height: ShadowSpacing.xl),
              itemBuilder: (context, index) {
                final sentence = sentences[index];
                final isActive = index == widget.controller.currentIndex;
                final isPassed = index < widget.controller.currentIndex;

                return InkWell(
                  key: _sentenceKeys[index],
                  borderRadius: const BorderRadius.all(ShadowRadius.md),
                  onTap: () => widget.controller.jumpToSentence(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.all(ShadowSpacing.md),
                    decoration: BoxDecoration(
                      color: isActive ? ShadowColors.faint : Colors.transparent,
                      borderRadius: const BorderRadius.all(ShadowRadius.md),
                      border: Border.all(
                        color: isActive ? ShadowColors.ink : Colors.transparent,
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Sentence Number + Active Badge
                        Row(
                          children: [
                            Text(
                              (index + 1).toString().padLeft(2, '0'),
                              style: ShadowType.metadata.copyWith(
                                color: isActive ? ShadowColors.ink : ShadowColors.muted,
                                fontWeight: isActive ? FontWeight.w900 : FontWeight.w500,
                              ),
                            ),
                            if (isActive && widget.controller.isRunning) ...[
                              const SizedBox(width: ShadowSpacing.sm),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: const BoxDecoration(
                                  color: ShadowColors.cta,
                                  borderRadius: BorderRadius.all(ShadowRadius.sm),
                                ),
                                child: Text(
                                  'ĐANG ĐỌC',
                                  style: ShadowType.metadata.copyWith(
                                    color: ShadowColors.paper,
                                    fontSize: 9,
                                    letterSpacing: 0.8,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: ShadowSpacing.sm),

                        // Sentence Text
                        Text(
                          sentence.text,
                          style: ShadowType.displayMedium.copyWith(
                            fontSize: 22,
                            height: 1.35,
                            color: isActive
                                ? ShadowColors.ink
                                : isPassed
                                    ? ShadowColors.muted.withValues(alpha: 0.6)
                                    : ShadowColors.graphite.withValues(alpha: 0.35),
                            fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
                          ),
                        ),

                        // Translation
                        if (widget.controller.showTranslation) ...[
                          const SizedBox(height: ShadowSpacing.xs),
                          Text(
                            sentence.translation,
                            style: ShadowType.body.copyWith(
                              fontSize: 14,
                              color: isActive
                                  ? ShadowColors.graphite
                                  : ShadowColors.muted.withValues(alpha: 0.4),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],

                        // Progress line for the active sentence
                        if (isActive) ...[
                          const SizedBox(height: ShadowSpacing.sm),
                          ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(2)),
                            child: LinearProgressIndicator(
                              value: widget.controller.sentenceProgress,
                              minHeight: 3,
                              backgroundColor: ShadowColors.divider,
                              valueColor: const AlwaysStoppedAnimation<Color>(ShadowColors.ink),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
