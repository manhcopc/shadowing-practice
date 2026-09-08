import 'package:flutter/material.dart';

class ShadowColors {
  const ShadowColors._();

  static const ivory = Color(0xFFFAF7F0);
  static const paper = Color(0xFFFFFFFF);
  static const ink = Color(0xFF111111);
  static const graphite = Color(0xFF303030);
  static const muted = Color(0xFF77736B);
  static const faint = Color(0xFFF1EDE5);
  static const divider = Color(0xFFD9D3C8);
  static const cta = Color(0xFF0A0A0A);
  static const success = Color(0xFF2F6F4E);
  static const warning = Color(0xFF9A6A1E);
}

class ShadowSpacing {
  const ShadowSpacing._();

  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const xl = 32.0;
  static const xxl = 48.0;
}

class ShadowRadius {
  const ShadowRadius._();

  static const sm = Radius.circular(8);
  static const md = Radius.circular(12);
  static const lg = Radius.circular(18);
}

class ShadowType {
  const ShadowType._();

  static const String displayFont = 'Georgia';
  static const String bodyFont = 'Roboto';

  static const metadata = TextStyle(
    fontFamily: bodyFont,
    fontSize: 11,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.6,
    color: ShadowColors.muted,
  );

  static const displayLarge = TextStyle(
    fontFamily: displayFont,
    fontSize: 44,
    height: 1.02,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    color: ShadowColors.ink,
  );

  static const displayMedium = TextStyle(
    fontFamily: displayFont,
    fontSize: 32,
    height: 1.08,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    color: ShadowColors.ink,
  );

  static const title = TextStyle(
    fontFamily: bodyFont,
    fontSize: 18,
    height: 1.25,
    fontWeight: FontWeight.w800,
    letterSpacing: 0,
    color: ShadowColors.ink,
  );

  static const body = TextStyle(
    fontFamily: bodyFont,
    fontSize: 16,
    height: 1.45,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    color: ShadowColors.graphite,
  );

  static const caption = TextStyle(
    fontFamily: bodyFont,
    fontSize: 13,
    height: 1.35,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    color: ShadowColors.muted,
  );
}

class ShadowDecorations {
  const ShadowDecorations._();

  static BoxDecoration panel({Color color = ShadowColors.paper}) {
    return BoxDecoration(
      color: color,
      border: Border.all(color: ShadowColors.divider),
      borderRadius: const BorderRadius.all(ShadowRadius.md),
    );
  }
}
