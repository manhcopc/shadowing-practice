import 'package:flutter/material.dart';
import '../../design/shadow_design_tokens.dart';
import '../../design/shadow_editorial_widgets.dart';
import '../pacer_calculator.dart';
import '../pacer_controller.dart';

class PacerReviewSheet extends StatelessWidget {
  const PacerReviewSheet({
    super.key,
    required this.controller,
    required this.onRetry,
  });

  final PacerController controller;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final timeFormatted = PacerCalculator.formatDurationMs(
      controller.totalElapsedMs,
    );

    return Container(
      padding: const EdgeInsets.all(ShadowSpacing.xl),
      decoration: const BoxDecoration(
        color: ShadowColors.paper,
        borderRadius: BorderRadius.vertical(top: ShadowRadius.lg),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: const BoxDecoration(
                  color: ShadowColors.divider,
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
              ),
            ),
            const SizedBox(height: ShadowSpacing.lg),

            // Header
            Row(
              children: [
                const Icon(
                  Icons.check_circle_rounded,
                  color: ShadowColors.success,
                  size: 28,
                ),
                const SizedBox(width: ShadowSpacing.sm),
                Text(
                  'HOÀN THÀNH BÀI ĐỌC',
                  style: ShadowType.title.copyWith(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: ShadowSpacing.xs),
            Text(
              controller.passage.title,
              style: ShadowType.displayMedium.copyWith(fontSize: 22),
            ),
            const SizedBox(height: ShadowSpacing.lg),

            // Stats grid
            Row(
              children: [
                Expanded(
                  child: _ReviewStatCard(
                    label: 'TỐC ĐỘ',
                    value: '${controller.wpm}',
                    unit: 'WPM',
                  ),
                ),
                const SizedBox(width: ShadowSpacing.md),
                Expanded(
                  child: _ReviewStatCard(
                    label: 'THỜI GIAN',
                    value: timeFormatted,
                    unit: 'phút',
                  ),
                ),
                const SizedBox(width: ShadowSpacing.md),
                Expanded(
                  child: _ReviewStatCard(
                    label: 'SỐ CÂU',
                    value: '${controller.totalSentences}',
                    unit: 'câu',
                  ),
                ),
              ],
            ),
            const SizedBox(height: ShadowSpacing.xl),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onRetry,
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      side: const BorderSide(color: ShadowColors.ink),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(ShadowRadius.sm),
                      ),
                    ),
                    child: Text(
                      'LUYỆN LẠI',
                      style: ShadowType.metadata.copyWith(
                        color: ShadowColors.ink,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: ShadowSpacing.md),
                Expanded(
                  child: ShadowCtaButton(
                    label: 'Đóng',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ReviewStatCard extends StatelessWidget {
  const _ReviewStatCard({
    required this.label,
    required this.value,
    required this.unit,
  });

  final String label;
  final String value;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(ShadowSpacing.md),
      decoration: const BoxDecoration(
        color: ShadowColors.faint,
        borderRadius: BorderRadius.all(ShadowRadius.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: ShadowType.metadata.copyWith(fontSize: 9)),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: ShadowType.title.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 2),
              Text(unit, style: ShadowType.metadata.copyWith(fontSize: 9)),
            ],
          ),
        ],
      ),
    );
  }
}
