import 'package:flutter/material.dart';

class EchoColors {
  const EchoColors._();

  static const primaryBlue = Color(0xFF2F80ED);
  static const teal = Color(0xFF2ED6C4);
  static const darkText = Color(0xFF0F172A);
  static const secondaryText = Color(0xFF64748B);
  static const background = Color(0xFFF8FBFF);
  static const card = Color(0xFFFFFFFF);
  static const border = Color(0xFFE6EEF7);
  static const success = Color(0xFF10B981);
  static const warning = Color(0xFFF59E0B);
}

class EchoTheme {
  const EchoTheme._();

  static const gradient = LinearGradient(
    colors: [EchoColors.primaryBlue, EchoColors.teal],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static BoxDecoration cardDecoration({bool elevated = true}) {
    return BoxDecoration(
      color: EchoColors.card,
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: EchoColors.border),
      boxShadow: elevated
          ? [
              BoxShadow(
                color: EchoColors.primaryBlue.withValues(alpha: 0.08),
                blurRadius: 24,
                offset: const Offset(0, 12),
              ),
            ]
          : null,
    );
  }

  static ButtonStyle primaryButtonStyle = FilledButton.styleFrom(
    minimumSize: const Size.fromHeight(54),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    backgroundColor: EchoColors.primaryBlue,
    foregroundColor: Colors.white,
    textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
  );
}
