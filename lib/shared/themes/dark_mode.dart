import 'package:flutter/material.dart';

import '../../common/generated/colors.gen.dart';

ThemeData darkMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,

  // ColorScheme cho Dark Mode
  colorScheme: ColorScheme.dark(
    // === Primary Colors ===
    primary: ColorName.primary, // #14B8A6 - Màu chính
    onPrimary: ColorName.onPrimary, // #FFFFFF - Chữ trên primary
    primaryContainer: ColorName.primary300Dark, // #5EEAD4 - Container primary
    // === Secondary Colors ===
    secondary: ColorName.secondary, // #A78BFA - Màu thứ cấp
    onSecondary: ColorName.onPrimary, // #FFFFFF - Chữ trên secondary
    secondaryContainer: ColorName.basicDark,
    tertiaryContainer: ColorName.basicLight,

    // === Background & Surface ===
    surface: ColorName.surfaceDark, // #101615 - Card/Panel
    onSurface: ColorName
        .textBodyDark, // #CDE7E3 - Chữ trên surface (tương phản >= 4.5:1)
    surfaceContainerHighest:
        ColorName.surfaceMutedDark, // #0F1B19 - Surface muted
    // === Background ===
    // Dùng surface vì Material 3 không có background trong ColorScheme
    // Nếu cần background riêng, set trong scaffoldBackgroundColor

    // === Error ===
    error: ColorName.error, // #EF4444
    onError: ColorName.onPrimary, // #FFFFFF
    // === Outline (Border/Divider) ===
    outline: ColorName.borderDark, // #16302D
    outlineVariant: ColorName.borderDark,
  ),

  // Màu nền scaffold
  scaffoldBackgroundColor: ColorName.backgroundDark, // #0C1211
  // Màu divider
  dividerColor: ColorName.borderDark,

  // TextTheme - dùng màu từ colors.xml
  textTheme: ThemeData.dark().textTheme.apply(
    bodyColor: ColorName.textBodyDark, // #CDE7E3 - Body text
    displayColor: ColorName.inkDark, // #EAF6F3 - Tiêu đề
  ),

  // AppBar Theme
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorName.surfaceDark,
    foregroundColor: ColorName.inkDark,
    elevation: 0,
  ),

  // Card Theme
  cardTheme: CardThemeData(
    color: ColorName.surfaceDark,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: const BorderSide(color: ColorName.borderDark, width: 1),
    ),
  ),

  // Chip Theme
  chipTheme: ChipThemeData(
    backgroundColor: ColorName.chipBgDark,
    selectedColor: ColorName.chipSelectedBgDark,
    labelStyle: const TextStyle(color: ColorName.textBodyDark),
    secondaryLabelStyle: const TextStyle(color: ColorName.chipSelectedTextDark),
    side: const BorderSide(color: ColorName.borderDark),
  ),
);
