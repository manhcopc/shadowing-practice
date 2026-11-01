import 'package:flutter/material.dart';
import '../../design/shadow_design_tokens.dart';
import '../pacer_calculator.dart';
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

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_syncContinuousScroll);
  }

  @override
  void didUpdateWidget(covariant TeleprompterView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_syncContinuousScroll);
      widget.controller.addListener(_syncContinuousScroll);
    }
  }

  void _syncContinuousScroll() {
    if (!mounted || !_scrollController.hasClients) return;
    final position = _scrollController.position;
    if (!position.hasContentDimensions) return;

    final maxExtent = position.maxScrollExtent;
    if (maxExtent <= 0) return;

    final targetOffset =
        (widget.controller.overallProgress * maxExtent).clamp(0.0, maxExtent);
    if ((position.pixels - targetOffset).abs() > 0.5) {
      _scrollController.jumpTo(targetOffset);
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_syncContinuousScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, _) {
        final sentences = widget.controller.passage.sentences;
        final totalMs = widget.controller.timingPlan.totalDurationMs;
        final remainingTotalMs =
            (totalMs * (1.0 - widget.controller.overallProgress)).round();

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ShadowColors.paper,
            borderRadius: const BorderRadius.all(ShadowRadius.lg),
            border: Border.all(color: ShadowColors.divider),
          ),
          child: Column(
            children: [
              // Top bar: Continuous mode label, remaining total time, translation toggle
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: ShadowSpacing.lg,
                  vertical: ShadowSpacing.sm,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'CUỘN LIÊN TỤC · ${(widget.controller.overallProgress * 100).round()}%',
                      style: ShadowType.metadata.copyWith(
                        color: ShadowColors.muted,
                        fontSize: 10,
                      ),
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
                          PacerCalculator.formatDurationMs(remainingTotalMs),
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

              // Continuous Scrolling Text Area
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final viewportHeight = constraints.maxHeight;
                    final topLeadHeight = viewportHeight * 0.26;
                    final bottomTrailHeight = viewportHeight * 0.74;

                    return Stack(
                      children: [
                        // Subtle Eye-level Reading Guide Line
                        Positioned(
                          top: topLeadHeight,
                          left: 0,
                          right: 0,
                          child: IgnorePointer(
                            child: Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 2,
                                  color: ShadowColors.ink.withValues(alpha: 0.35),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    color: ShadowColors.divider.withValues(
                                      alpha: 0.45,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 10,
                                  height: 2,
                                  color: ShadowColors.ink.withValues(alpha: 0.35),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Continuous borderless text stream
                        SingleChildScrollView(
                          controller: _scrollController,
                          padding: EdgeInsets.fromLTRB(
                            ShadowSpacing.xl,
                            topLeadHeight,
                            ShadowSpacing.xl,
                            bottomTrailHeight,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (int i = 0; i < sentences.length; i++)
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () =>
                                      widget.controller.jumpToSentence(i),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: ShadowSpacing.lg,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          sentences[i].text,
                                          style: ShadowType.displayMedium
                                              .copyWith(
                                                fontSize: 25,
                                                height: 1.48,
                                                fontWeight:
                                                    i ==
                                                        widget
                                                            .controller
                                                            .currentIndex
                                                    ? FontWeight.w700
                                                    : FontWeight.w400,
                                                color:
                                                    i ==
                                                        widget
                                                            .controller
                                                            .currentIndex
                                                    ? ShadowColors.ink
                                                    : i <
                                                          widget
                                                              .controller
                                                              .currentIndex
                                                    ? ShadowColors.muted
                                                          .withValues(
                                                            alpha: 0.45,
                                                          )
                                                    : ShadowColors.graphite
                                                          .withValues(
                                                            alpha: 0.78,
                                                          ),
                                              ),
                                        ),
                                        if (widget
                                            .controller
                                            .showTranslation) ...[
                                          const SizedBox(height: 4),
                                          Text(
                                            sentences[i].translation,
                                            style: ShadowType.body.copyWith(
                                              fontSize: 14,
                                              height: 1.4,
                                              fontStyle: FontStyle.italic,
                                              color:
                                                  i ==
                                                      widget
                                                          .controller
                                                          .currentIndex
                                                  ? ShadowColors.muted
                                                  : ShadowColors.muted
                                                        .withValues(
                                                          alpha: 0.45,
                                                        ),
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              // Continuous overall progress bar at bottom
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: ShadowRadius.lg,
                ),
                child: LinearProgressIndicator(
                  value: widget.controller.overallProgress,
                  minHeight: 5,
                  backgroundColor: ShadowColors.faint,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    widget.controller.isRunning
                        ? ShadowColors.ink
                        : ShadowColors.divider,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
