import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../data/shadow_passage_repository.dart';
import '../design/shadow_design_tokens.dart';
import '../design/shadow_editorial_widgets.dart';
import '../models/shadow_mvp_models.dart';
import '../pacer/pacer_controller.dart';
import '../pacer/pacer_models.dart';
import '../pacer/widgets/pacer_controls_bar.dart';
import '../pacer/widgets/pacer_countdown_overlay.dart';
import '../pacer/widgets/pacer_review_sheet.dart';
import '../pacer/widgets/sentence_focus_view.dart';
import '../pacer/widgets/teleprompter_view.dart';
import '../pacer/widgets/wpm_selector_bar.dart';

@RoutePage()
class PacerPracticePage extends StatefulWidget {
  const PacerPracticePage({
    super.key,
    required this.passageId,
    this.enableAudioRecording = true,
  });

  final String passageId;
  final bool enableAudioRecording;

  @override
  State<PacerPracticePage> createState() => _PacerPracticePageState();
}

class _PacerPracticePageState extends State<PacerPracticePage> {
  late final PacerController _controller;
  late final ShadowPassage _passage;
  bool _reviewShown = false;

  @override
  void initState() {
    super.initState();
    final repository = const ShadowPassageRepository();
    final all = repository.getPassages();
    _passage = all.firstWhere(
      (p) => p.id == widget.passageId,
      orElse: () => repository.getFeaturedPassage(),
    );

    _controller = PacerController(
      passage: _passage,
      initialWpm: 110,
      initialMode: PacerMode.sentenceFocus,
      enableAudioRecording: widget.enableAudioRecording,
    );

    _controller.addListener(_handleStateChange);
  }

  void _handleStateChange() {
    if (_controller.isCompleted && !_reviewShown) {
      _reviewShown = true;
      _showReviewSheet();
    }
  }

  void _showReviewSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => PacerReviewSheet(
        controller: _controller,
        onRetry: () {
          Navigator.of(context).pop();
          _reviewShown = false;
          _controller.start();
        },
      ),
    ).then((_) {
      _reviewShown = false;
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_handleStateChange);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShadowEditorialScaffold(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: ShadowSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: ShadowSpacing.sm),
                // Top Navigation Bar
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_rounded, color: ShadowColors.ink),
                      onPressed: () => context.router.maybePop(),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(width: ShadowSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _passage.title,
                            style: ShadowType.title.copyWith(fontSize: 18),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '${_passage.level.code} · ${_passage.topic.label}',
                            style: ShadowType.metadata.copyWith(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    ShadowPill(label: _passage.level.code, selected: true),
                  ],
                ),
                const SizedBox(height: ShadowSpacing.md),

                // WPM & Mode Selector Bar
                WpmSelectorBar(controller: _controller),
                const SizedBox(height: ShadowSpacing.md),

                // Main Reading View (Dual Mode)
                Expanded(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, _) {
                      switch (_controller.mode) {
                        case PacerMode.sentenceFocus:
                          return Center(
                            child: SingleChildScrollView(
                              child: SentenceFocusView(controller: _controller),
                            ),
                          );
                        case PacerMode.teleprompter:
                          return TeleprompterView(controller: _controller);
                      }
                    },
                  ),
                ),
                const SizedBox(height: ShadowSpacing.md),

                // Bottom Controls Bar
                PacerControlsBar(
                  controller: _controller,
                  onFinish: _controller.finish,
                ),
                const SizedBox(height: ShadowSpacing.md),
              ],
            ),
          ),

          // Countdown Overlay
          AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              if (_controller.isCountdown) {
                return PacerCountdownOverlay(
                  secondsRemaining: _controller.countdownSeconds,
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
