import 'package:flutter/material.dart';

import '../../common/generated/colors.gen.dart';

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,

  // ColorScheme cho Light Mode
  colorScheme: ColorScheme.light(
    // === Primary Colors ===
    primary: ColorName.primary, // #14B8A6 - Màu chính
    onPrimary: ColorName.onPrimary, // #FFFFFF - Chữ trên primary
    primaryContainer: ColorName.primary300Light, // #5EEAD4 - Container primary
    // === Secondary Colors ===
    secondary: ColorName.secondary, // #A78BFA - Màu thứ cấp
    onSecondary: ColorName.onPrimary, // #FFFFFF - Chữ trên secondary
    secondaryContainer: ColorName.basicLight,
    tertiaryContainer: ColorName.basicDark,
    // === Background & Surface ===
    surface: ColorName.surfaceLight, // #FFFFFF - Card/Panel
    onSurface: ColorName.textBodyLight, // #2B3A38 - Chữ trên surface
    surfaceContainerHighest:
        ColorName.surfaceMutedLight, // #F7FAF9 - Surface muted
    // === Background ===
    // Dùng surface vì Material 3 không có background trong ColorScheme
    // Nếu cần background riêng, set trong scaffoldBackgroundColor

    // === Error ===
    error: ColorName.error, // #EF4444
    onError: ColorName.onPrimary, // #FFFFFF
    // === Outline (Border/Divider) ===
    outline: ColorName.borderLight, // #E6F0EE
    outlineVariant: ColorName.neutral, // #E6F0EE
  ),

  // Màu nền scaffold
  scaffoldBackgroundColor: ColorName.backgroundLight, // #F7FAF9
  // Màu divider
  dividerColor: ColorName.borderLight,

  // TextTheme - dùng màu từ colors.xml
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: ColorName.textBodyLight, // #2B3A38 - Body text
    displayColor: ColorName.inkLight, // #0F766E - Tiêu đề
  ),

  // AppBar Theme
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorName.surfaceLight,
    foregroundColor: ColorName.inkLight,
    elevation: 0,
  ),

  // Card Theme
  cardTheme: CardThemeData(
    color: ColorName.surfaceLight,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: const BorderSide(color: ColorName.borderLight, width: 1),
    ),
  ),

  // Chip Theme
  chipTheme: ChipThemeData(
    backgroundColor: ColorName.chipBgLight,
    selectedColor: ColorName.chipSelectedBgLight,
    labelStyle: const TextStyle(color: ColorName.textBodyLight),
    secondaryLabelStyle: const TextStyle(
      color: ColorName.chipSelectedTextLight,
    ),
    side: const BorderSide(color: ColorName.borderLight),
  ),
);
