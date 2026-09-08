import 'package:flutter/material.dart';

/// Custom TextTheme wrapper để dễ dàng truy cập và mở rộng
class AppTextTheme {
  final TextTheme _textTheme;

  const AppTextTheme(this._textTheme);

  /// TextStyle mặc định cho app (bodyMedium)
  TextStyle get regular => _textTheme.bodyMedium ?? const TextStyle();

  /// Body styles
  TextStyle get small => _textTheme.bodySmall ?? const TextStyle();

  TextStyle get large => _textTheme.bodyLarge ?? const TextStyle();

  /// Title styles
  TextStyle get titleLarge => _textTheme.titleLarge ?? const TextStyle();

  TextStyle get titleMedium => _textTheme.titleMedium ?? const TextStyle();

  TextStyle get titleSmall => _textTheme.titleSmall ?? const TextStyle();

  /// Headline styles
  TextStyle get headlineLarge => _textTheme.headlineLarge ?? const TextStyle();

  TextStyle get headlineMedium =>
      _textTheme.headlineMedium ?? const TextStyle();

  TextStyle get headlineSmall => _textTheme.headlineSmall ?? const TextStyle();

  /// Label styles
  TextStyle get labelLarge => _textTheme.labelLarge ?? const TextStyle();

  TextStyle get labelMedium => _textTheme.labelMedium ?? const TextStyle();

  TextStyle get labelSmall => _textTheme.labelSmall ?? const TextStyle();
}

/// Extension cho BuildContext để truy cập theme dễ dàng hơn
extension BuildContextThemeExtension on BuildContext {
  /// Truy cập TextTheme với wrapper tùy chỉnh
  AppTextTheme get textTheme => AppTextTheme(Theme.of(this).textTheme);

  /// Truy cập ColorScheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Truy cập ThemeData
  ThemeData get theme => Theme.of(this);

  /// Kiểm tra xem có đang ở dark mode không
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// Kiểm tra xem có đang ở light mode không
  bool get isLightMode => Theme.of(this).brightness == Brightness.light;

  /// Lấy màu text mặc định theo theme
  /// - Dark mode: màu trắng
  /// - Light mode: màu đen
  Color get defaultTextColor => colorScheme.onSurface;

  /// Lấy màu background mặc định theo theme
  Color get defaultBackgroundColor => colorScheme.surface;

  /// Lấy màu primary
  Color get primaryColor => colorScheme.primary;

  /// Lấy màu secondary
  Color get secondaryColor => colorScheme.secondary;

  /// Lấy kích thước màn hình
  Size get screenSize => MediaQuery.of(this).size;

  /// Lấy chiều rộng màn hình
  double get screenWidth => screenSize.width;

  /// Lấy chiều cao màn hình
  double get screenHeight => screenSize.height;

  /// Lấy padding an toàn (safe area)
  EdgeInsets get safeAreaPadding => MediaQuery.of(this).padding;

  /// Kiểm tra xem bàn phím có đang hiển thị không
  bool get isKeyboardVisible => MediaQuery.of(this).viewInsets.bottom > 0;
}
