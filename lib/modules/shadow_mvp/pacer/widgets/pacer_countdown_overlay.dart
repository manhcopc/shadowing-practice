import 'package:flutter/material.dart';
import '../../design/shadow_design_tokens.dart';

class PacerCountdownOverlay extends StatelessWidget {
  const PacerCountdownOverlay({
    super.key,
    required this.secondsRemaining,
  });

  final int secondsRemaining;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ShadowColors.ivory.withValues(alpha: 0.94),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'CHUẨN BỊ ĐỌC',
            style: ShadowType.metadata.copyWith(
              letterSpacing: 3.0,
              color: ShadowColors.muted,
            ),
          ),
          const SizedBox(height: ShadowSpacing.xl),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: child,
            ),
            child: Text(
              '$secondsRemaining',
              key: ValueKey<int>(secondsRemaining),
              style: ShadowType.displayLarge.copyWith(
                fontSize: 96,
                fontWeight: FontWeight.w900,
                color: ShadowColors.ink,
              ),
            ),
          ),
          const SizedBox(height: ShadowSpacing.lg),
          Text(
            'Đọc to và rõ theo nhịp chữ chạy...',
            style: ShadowType.body.copyWith(
              color: ShadowColors.graphite,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
