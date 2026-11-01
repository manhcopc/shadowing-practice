import 'package:flutter/material.dart';
import '../../design/shadow_design_tokens.dart';
import '../pacer_controller.dart';

class PacerControlsBar extends StatelessWidget {
  const PacerControlsBar({
    super.key,
    required this.controller,
    required this.onFinish,
  });

  final PacerController controller;
  final VoidCallback onFinish;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final isRunning = controller.isRunning;
        final isIdle = controller.isIdle;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Recording status badge
            if (isRunning || controller.isPaused) ...[
              Padding(
                padding: const EdgeInsets.only(bottom: ShadowSpacing.sm),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: isRunning ? Colors.redAccent : Colors.amber,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      isRunning ? 'ĐANG THU ÂM' : 'ĐANG TẠM DỪNG',
                      style: ShadowType.metadata.copyWith(
                        fontSize: 10,
                        color: isRunning ? Colors.redAccent : ShadowColors.muted,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: ShadowSpacing.lg,
                vertical: ShadowSpacing.md,
              ),
              decoration: BoxDecoration(
                color: ShadowColors.paper,
                borderRadius: const BorderRadius.all(ShadowRadius.lg),
                border: Border.all(color: ShadowColors.divider),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Reset / Restart
                  IconButton(
                    icon: const Icon(Icons.refresh_rounded),
                    iconSize: 24,
                    color: ShadowColors.ink,
                    tooltip: 'Bắt đầu lại',
                    onPressed: isIdle ? null : controller.reset,
                  ),

                  // Previous sentence
                  IconButton(
                    icon: const Icon(Icons.skip_previous_rounded),
                    iconSize: 28,
                    color: ShadowColors.ink,
                    tooltip: 'Câu trước',
                    onPressed: isIdle ? null : controller.previousSentence,
                  ),

                  // Big Center Action Button (Start / Pause / Resume)
                  GestureDetector(
                    onTap: () {
                      if (isIdle || controller.isCompleted) {
                        controller.start();
                      } else {
                        controller.togglePlayPause();
                      }
                    },
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: const BoxDecoration(
                        color: ShadowColors.cta,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isIdle || controller.isCompleted
                            ? Icons.play_arrow_rounded
                            : isRunning
                                ? Icons.pause_rounded
                                : Icons.play_arrow_rounded,
                        color: ShadowColors.paper,
                        size: 34,
                      ),
                    ),
                  ),

                  // Next sentence
                  IconButton(
                    icon: const Icon(Icons.skip_next_rounded),
                    iconSize: 28,
                    color: ShadowColors.ink,
                    tooltip: 'Câu tiếp theo',
                    onPressed: isIdle ? null : controller.nextSentence,
                  ),

                  // Finish Button
                  IconButton(
                    icon: const Icon(Icons.check_circle_outline_rounded),
                    iconSize: 26,
                    color: (isRunning || controller.isPaused) ? ShadowColors.success : ShadowColors.muted,
                    tooltip: 'Hoàn thành',
                    onPressed: (isRunning || controller.isPaused) ? onFinish : null,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
