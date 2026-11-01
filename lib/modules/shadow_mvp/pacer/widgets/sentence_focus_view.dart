import 'package:flutter/material.dart';
import '../../design/shadow_design_tokens.dart';
import '../pacer_controller.dart';

class SentenceFocusView extends StatefulWidget {
  const SentenceFocusView({
    super.key,
    required this.controller,
  });

  final PacerController controller;

  @override
  State<SentenceFocusView> createState() => _SentenceFocusViewState();
}

class _SentenceFocusViewState extends State<SentenceFocusView> {
  static const double _wheelItemExtent = 168.0;

  late FixedExtentScrollController _wheelController;
  int _lastSyncedIndex = 0;
  bool _isProgrammaticScroll = false;

  @override
  void initState() {
    super.initState();
    _lastSyncedIndex = widget.controller.currentIndex;
    _wheelController = FixedExtentScrollController(
      initialItem: _lastSyncedIndex,
    );
    widget.controller.addListener(_onControllerChanged);
  }

  @override
  void didUpdateWidget(covariant SentenceFocusView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_onControllerChanged);
      _lastSyncedIndex = widget.controller.currentIndex;
      _wheelController.dispose();
      _wheelController = FixedExtentScrollController(
        initialItem: _lastSyncedIndex,
      );
      widget.controller.addListener(_onControllerChanged);
    }
  }

  void _onControllerChanged() {
    final targetIndex = widget.controller.currentIndex;
    if (targetIndex != _lastSyncedIndex) {
      _lastSyncedIndex = targetIndex;
      if (_wheelController.hasClients) {
        _isProgrammaticScroll = true;
        _wheelController
            .animateToItem(
              targetIndex,
              duration: const Duration(milliseconds: 420),
              curve: Curves.easeOutCubic,
            )
            .whenComplete(() {
              _isProgrammaticScroll = false;
            });
      }
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerChanged);
    _wheelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, _) {
        final sentences = widget.controller.passage.sentences;
        final timing = widget.controller.currentSentenceTiming;
        final remainingMs =
            (timing.durationMs * (1.0 - widget.controller.sentenceProgress))
                .round();
        final remainingSec = (remainingMs / 1000).toStringAsFixed(1);

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ShadowColors.paper,
            borderRadius: const BorderRadius.all(ShadowRadius.lg),
            border: Border.all(color: ShadowColors.divider),
          ),
          child: Column(
            children: [
              // Top Metadata Bar
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: ShadowSpacing.lg,
                  vertical: ShadowSpacing.sm,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          (widget.controller.currentIndex + 1)
                              .toString()
                              .padLeft(2, '0'),
                          style: ShadowType.displayMedium.copyWith(
                            fontSize: 20,
                            color: ShadowColors.ink,
                          ),
                        ),
                        Text(
                          ' / ${widget.controller.totalSentences.toString().padLeft(2, '0')}',
                          style: ShadowType.metadata.copyWith(
                            color: ShadowColors.muted,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer_outlined,
                          size: 14,
                          color: widget.controller.isRunning
                              ? ShadowColors.warning
                              : ShadowColors.muted,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${remainingSec}s',
                          style: ShadowType.metadata.copyWith(
                            fontWeight: FontWeight.w700,
                            color: widget.controller.isRunning
                                ? ShadowColors.ink
                                : ShadowColors.muted,
                          ),
                        ),
                        const SizedBox(width: ShadowSpacing.sm),
                        IconButton(
                          icon: Icon(
                            widget.controller.showTranslation
                                ? Icons.translate_rounded
                                : Icons.visibility_off_outlined,
                            size: 18,
                          ),
                          color: widget.controller.showTranslation
                              ? ShadowColors.ink
                              : ShadowColors.muted,
                          tooltip: widget.controller.showTranslation
                              ? 'Ẩn bản dịch'
                              : 'Hiện bản dịch',
                          onPressed: widget.controller.toggleTranslation,
                          visualDensity: VisualDensity.compact,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(height: 1, color: ShadowColors.faint),

              // Wheel Picker Area
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Center Selection Highlight Window (Wheel Picker style)
                    IgnorePointer(
                      child: Container(
                        height: _wheelItemExtent,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                          horizontal: ShadowSpacing.md,
                        ),
                        decoration: BoxDecoration(
                          color: ShadowColors.faint.withValues(alpha: 0.65),
                          borderRadius: const BorderRadius.all(ShadowRadius.md),
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              color: ShadowColors.ink.withValues(alpha: 0.22),
                              width: 1.2,
                            ),
                          ),
                        ),
                        alignment: Alignment.bottomCenter,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            bottom: ShadowRadius.md,
                          ),
                          child: LinearProgressIndicator(
                            value: widget.controller.sentenceProgress,
                            minHeight: 4,
                            backgroundColor: Colors.transparent,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              widget.controller.isRunning
                                  ? ShadowColors.ink
                                  : ShadowColors.divider,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // 3D Wheel Scroll View
                    ListWheelScrollView.useDelegate(
                      controller: _wheelController,
                      itemExtent: _wheelItemExtent,
                      diameterRatio: 2.2,
                      perspective: 0.0025,
                      overAndUnderCenterOpacity: 0.28,
                      physics: const FixedExtentScrollPhysics(),
                      onSelectedItemChanged: (index) {
                        if (!_isProgrammaticScroll) {
                          _lastSyncedIndex = index;
                          widget.controller.jumpToSentence(index);
                        }
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: sentences.length,
                        builder: (context, index) {
                          if (index < 0 || index >= sentences.length) {
                            return null;
                          }
                          final sentence = sentences[index];
                          final isActive =
                              index == widget.controller.currentIndex;

                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () =>
                                widget.controller.jumpToSentence(index),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: ShadowSpacing.xl,
                                vertical: ShadowSpacing.sm,
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      sentence.text,
                                      textAlign: TextAlign.center,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: ShadowType.displayMedium.copyWith(
                                        fontSize: isActive ? 22 : 19,
                                        height: 1.3,
                                        fontWeight: isActive
                                            ? FontWeight.w700
                                            : FontWeight.w500,
                                        color: ShadowColors.ink,
                                      ),
                                    ),
                                    if (widget.controller.showTranslation) ...[
                                      const SizedBox(height: 6),
                                      Text(
                                        sentence.translation,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: ShadowType.body.copyWith(
                                          fontSize: 13,
                                          color: ShadowColors.muted,
                                          fontStyle: FontStyle.italic,
                                          height: 1.3,
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
