import 'package:flutter/material.dart';
import '../../design/shadow_design_tokens.dart';
import '../pacer_calculator.dart';
import '../pacer_controller.dart';
import '../pacer_models.dart';

class WpmSelectorBar extends StatelessWidget {
  const WpmSelectorBar({
    super.key,
    required this.controller,
  });

  final PacerController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final estimatedTime = PacerCalculator.formatDurationMs(
          controller.timingPlan.totalDurationMs,
        );

        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: ShadowSpacing.lg,
            vertical: ShadowSpacing.md,
          ),
          decoration: BoxDecoration(
            color: ShadowColors.paper,
            border: Border.all(color: ShadowColors.divider),
            borderRadius: const BorderRadius.all(ShadowRadius.md),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row: Mode toggle + Estimated time
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _ModePill(
                        label: 'Từng câu',
                        selected: controller.mode == PacerMode.sentenceFocus,
                        onTap: () => controller.setMode(PacerMode.sentenceFocus),
                      ),
                      const SizedBox(width: ShadowSpacing.sm),
                      _ModePill(
                        label: 'Cuộn chữ',
                        selected: controller.mode == PacerMode.teleprompter,
                        onTap: () => controller.setMode(PacerMode.teleprompter),
                      ),
                    ],
                  ),
                  Text(
                    'Ước tính: $estimatedTime',
                    style: ShadowType.metadata.copyWith(color: ShadowColors.muted),
                  ),
                ],
              ),
              const SizedBox(height: ShadowSpacing.md),

              // WPM Slider & Value
              Row(
                children: [
                  Text(
                    '${controller.wpm}',
                    style: ShadowType.displayMedium.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: ShadowSpacing.xs),
                  Text('WPM', style: ShadowType.metadata.copyWith(fontSize: 10)),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: ShadowColors.ink,
                        inactiveTrackColor: ShadowColors.divider,
                        thumbColor: ShadowColors.ink,
                        overlayColor: ShadowColors.ink.withValues(alpha: 0.1),
                        trackHeight: 3,
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
                      ),
                      child: Slider(
                        value: controller.wpm.toDouble(),
                        min: 80,
                        max: 200,
                        divisions: 24,
                        onChanged: (val) => controller.setWpm(val.round()),
                      ),
                    ),
                  ),
                ],
              ),

              // Presets quick buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _PresetChip(
                    label: 'Chậm (90)',
                    isSelected: controller.wpm == 90,
                    onTap: () => controller.setWpm(90),
                  ),
                  const SizedBox(width: ShadowSpacing.xs),
                  _PresetChip(
                    label: 'Vừa (120)',
                    isSelected: controller.wpm == 120,
                    onTap: () => controller.setWpm(120),
                  ),
                  const SizedBox(width: ShadowSpacing.xs),
                  _PresetChip(
                    label: 'Nhanh (150)',
                    isSelected: controller.wpm == 150,
                    onTap: () => controller.setWpm(150),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ModePill extends StatelessWidget {
  const _ModePill({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(ShadowRadius.sm),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: selected ? ShadowColors.ink : ShadowColors.faint,
          borderRadius: const BorderRadius.all(ShadowRadius.sm),
        ),
        child: Text(
          label.toUpperCase(),
          style: ShadowType.metadata.copyWith(
            fontSize: 10,
            color: selected ? ShadowColors.paper : ShadowColors.graphite,
            letterSpacing: 1.0,
          ),
        ),
      ),
    );
  }
}

class _PresetChip extends StatelessWidget {
  const _PresetChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(ShadowRadius.sm),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: isSelected ? ShadowColors.ink : Colors.transparent,
          border: Border.all(
            color: isSelected ? ShadowColors.ink : ShadowColors.divider,
          ),
          borderRadius: const BorderRadius.all(ShadowRadius.sm),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: isSelected ? ShadowColors.paper : ShadowColors.muted,
          ),
        ),
      ),
    );
  }
}
