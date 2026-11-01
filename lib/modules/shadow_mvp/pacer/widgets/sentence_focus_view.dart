import 'package:flutter/material.dart';
import '../../design/shadow_design_tokens.dart';
import '../pacer_controller.dart';

class SentenceFocusView extends StatelessWidget {
  const SentenceFocusView({
    super.key,
    required this.controller,
  });

  final PacerController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final sentence = controller.currentSentence;
        final timing = controller.currentSentenceTiming;
        final remainingMs = (timing.durationMs * (1.0 - controller.sentenceProgress)).round();
        final remainingSec = (remainingMs / 1000).toStringAsFixed(1);

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ShadowColors.paper,
            borderRadius: const BorderRadius.all(ShadowRadius.lg),
            border: Border.all(color: ShadowColors.divider),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Meta: Sentence counter + Time remaining
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  ShadowSpacing.lg,
                  ShadowSpacing.lg,
                  ShadowSpacing.lg,
                  ShadowSpacing.sm,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          (controller.currentIndex + 1).toString().padLeft(2, '0'),
                          style: ShadowType.displayMedium.copyWith(
                            fontSize: 22,
                            color: ShadowColors.ink,
                          ),
                        ),
                        Text(
                          ' / ${controller.totalSentences.toString().padLeft(2, '0')}',
                          style: ShadowType.metadata.copyWith(color: ShadowColors.muted),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer_outlined,
                          size: 14,
                          color: controller.isRunning ? ShadowColors.warning : ShadowColors.muted,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${remainingSec}s',
                          style: ShadowType.metadata.copyWith(
                            fontWeight: FontWeight.w700,
                            color: controller.isRunning ? ShadowColors.ink : ShadowColors.muted,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Divider(height: 1, color: ShadowColors.faint),

              // Main Sentence Content
              Padding(
                padding: const EdgeInsets.all(ShadowSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sentence.text,
                      style: ShadowType.displayLarge.copyWith(
                        fontSize: 26,
                        height: 1.35,
                        color: ShadowColors.ink,
                      ),
                    ),
                    const SizedBox(height: ShadowSpacing.lg),

                    // Translation section
                    if (controller.showTranslation) ...[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              sentence.translation,
                              style: ShadowType.body.copyWith(
                                color: ShadowColors.muted,
                                fontStyle: FontStyle.italic,
                                height: 1.4,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.visibility_off_outlined, size: 18),
                            color: ShadowColors.muted,
                            tooltip: 'Ẩn bản dịch',
                            onPressed: controller.toggleTranslation,
                          ),
                        ],
                      ),
                    ] else ...[
                      InkWell(
                        onTap: controller.toggleTranslation,
                        borderRadius: const BorderRadius.all(ShadowRadius.sm),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.visibility_outlined, size: 16, color: ShadowColors.muted),
                              const SizedBox(width: 6),
                              Text(
                                'Hiện bản dịch',
                                style: ShadowType.metadata.copyWith(
                                  color: ShadowColors.muted,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              const SizedBox(height: ShadowSpacing.sm),

              // Countdown / Progress Bar at bottom of card
              ClipRRect(
                borderRadius: const BorderRadius.vertical(bottom: ShadowRadius.lg),
                child: LinearProgressIndicator(
                  value: controller.sentenceProgress,
                  minHeight: 6,
                  backgroundColor: ShadowColors.faint,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    controller.isRunning ? ShadowColors.ink : ShadowColors.divider,
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
