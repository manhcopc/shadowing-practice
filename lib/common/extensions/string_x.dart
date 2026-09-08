// Extension methods for String class
import 'dart:convert';
import 'package:intl/intl.dart';

// ============================================================================
// STRING VALIDATION EXTENSIONS
// ============================================================================

extension StringValidator on String {
  /// Kiểm tra email hợp lệ
  bool isValidEmail() {
    return RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(this);
  }

  /// Kiểm tra username hợp lệ
  bool isValidUsername() {
    return RegExp(r'^[a-zA-Z0-9._%+-]{3,}$').hasMatch(this);
  }

  /// Kiểm tra tên hợp lệ
  bool isName() {
    // Trim để loại bỏ khoảng trắng đầu cuối, sau đó kiểm tra
    final trimmed = trim();
    return RegExp(r'^[a-zA-ZÀ-ỹ\s]{3,}$').hasMatch(trimmed);
  }

  /// Kiểm tra số điện thoại (10 chữ số)
  bool isPhoneNumber() {
    return RegExp(r'^\d{10}$').hasMatch(this);
  }

  // --- Password Validation ---

  /// Mật khẩu có ít nhất 8 ký tự
  bool passwordHasAtLeast8Characters() {
    return length >= 8;
  }

  /// Mật khẩu có ít nhất 1 chữ hoa
  bool passwordHasAtLeast1Uppercase() {
    return RegExp(r'[A-Z]').hasMatch(this);
  }

  /// Mật khẩu có ít nhất 1 chữ thường
  bool passwordHasAtLeast1Lowercase() {
    return RegExp(r'[a-z]').hasMatch(this);
  }

  /// Mật khẩu có ít nhất 1 số
  bool passwordHasAtLeast1Number() {
    return RegExp(r'[0-9]').hasMatch(this);
  }

  /// Mật khẩu có ít nhất 1 ký tự đặc biệt
  bool passwordHasAtLeast1SpecialCharacter() {
    return RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(this);
  }

  /// Kiểm tra mật khẩu hợp lệ (tất cả các điều kiện)
  bool isValidPassword() {
    return passwordHasAtLeast8Characters() &&
        passwordHasAtLeast1Uppercase() &&
        passwordHasAtLeast1Lowercase() &&
        passwordHasAtLeast1Number() &&
        passwordHasAtLeast1SpecialCharacter();
  }

  // --- Error Messages ---

  /// Lấy thông báo lỗi password
  String? getErrorPasswordMessage() {
    if (isEmpty) {
      return 'Password cannot be empty';
    } else if (!passwordHasAtLeast8Characters()) {
      return 'Password must be at least 8 characters long';
    } else if (!passwordHasAtLeast1Uppercase()) {
      return 'Password must have at least 1 uppercase letter';
    } else if (!passwordHasAtLeast1Lowercase()) {
      return 'Password must have at least 1 lowercase letter';
    } else if (!passwordHasAtLeast1Number()) {
      return 'Password must have at least 1 number';
    } else if (!passwordHasAtLeast1SpecialCharacter()) {
      return 'Password must have at least 1 special character';
    }
    return null;
  }

  /// Lấy thông báo lỗi email
  String? getErrorEmailMessage() {
    if (isEmpty) {
      return 'Email cannot be empty';
    } else if (!isValidEmail()) {
      return 'Invalid email';
    }
    return null;
  }

  /// Lấy thông báo lỗi username
  String? getErrorUsernameMessage() {
    if (isEmpty) {
      return 'Username cannot be empty';
    } else if (!isValidUsername()) {
      return 'Invalid username';
    }
    return null;
  }

  /// Lấy thông báo lỗi số điện thoại
  String? getErrorPhoneNumberMessage() {
    if (isEmpty) {
      return 'Phone number cannot be empty';
    } else if (!isPhoneNumber()) {
      return 'Invalid phone number';
    }
    return null;
  }

  /// Lấy thông báo lỗi code system
  String? getErrorCodeSystemMessage() {
    if (isEmpty) {
      return 'Code system cannot be empty';
    }
    return null;
  }

  /// Lấy thông báo lỗi tên
  String? getErrorNameMessage() {
    if (isEmpty) {
      return 'Name cannot be empty';
    } else if (!isName()) {
      return 'Invalid name';
    }
    return null;
  }
}

// ============================================================================
// JWT TOKEN EXTENSIONS
// ============================================================================

extension TokenExtension on String {
  /// Lấy ngày hết hạn từ JWT token
  DateTime getExpiryDateFromToken() {
    final parts = split('.');
    if (parts.length != 3) {
      throw Exception('Invalid token');
    }
    final payload = parts[1];
    final normalized = base64Url.normalize(payload);
    final resp = utf8.decode(base64Url.decode(normalized));
    final map = json.decode(resp);
    final exp = map['exp'] * 1000;
    return DateTime.fromMillisecondsSinceEpoch(exp);
  }

  /// Kiểm tra token đã hết hạn chưa
  bool isTokenExpired() {
    final expiryDate = getExpiryDateFromToken();
    return expiryDate.isBefore(DateTime.now());
  }
}

// ============================================================================
// STRING FORMATTING EXTENSIONS
// ============================================================================

extension CapitalizeExtension on String {
  /// Viết hoa chữ cái đầu tiên
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

extension StringFormatter on String {
  /// Chuyển đổi snake_case sang Title Case
  /// Ví dụ: "hello_world" -> "Hello World"
  String toTitleCase() {
    return split('_')
        .map(
          (word) => word.isNotEmpty
              ? word[0].toUpperCase() + word.substring(1).toLowerCase()
              : '',
        )
        .join(' ');
  }

  /// Loại bỏ các phần text trong dấu ngoặc vuông [abc]
  /// Ví dụ: "Hello [world]" -> "Hello"
  /// Ví dụ: "Hello [world] there" -> "Hello there"
  String removeBrackets() {
    return replaceAll(RegExp(r'\[.*?\]'), '')
        .replaceAll(RegExp(r'\s+'), ' ') // Loại bỏ khoảng trắng thừa
        .trim();
  }

  /// Loại bỏ dấu ngoặc đơn trong percentage string
  /// Ví dụ: "(6%)" -> "6%"
  /// Ví dụ: "(5%)" -> "5%"
  String removeParentheses() {
    return replaceAll(RegExp(r'[()]'), '').trim();
  }

  /// Chuẩn hóa text: snake_case -> Title Case, hoặc viết hoa chữ cái đầu mỗi từ
  /// Ví dụ: "hello_world" -> "Hello World"
  /// Ví dụ: "hello world" -> "Hello World"
  /// Ví dụ: "HELLO WORLD" -> "Hello World"
  String toFormattedTitle() {
    // Nếu có dấu gạch dưới, xử lý snake_case
    if (contains('_')) {
      return toTitleCase();
    }
    // Nếu không có dấu gạch dưới, viết hoa chữ cái đầu mỗi từ
    return split(' ')
        .map(
          (word) => word.isNotEmpty
              ? word[0].toUpperCase() + word.substring(1).toLowerCase()
              : '',
        )
        .where((word) => word.isNotEmpty)
        .join(' ');
  }
}

/// Enum để xác định kiểu chuyển đổi chữ hoa/thường
enum TextCaseType {
  none, // Không thay đổi
  upper, // Chữ in hoa toàn bộ
  lower, // Chữ thường toàn bộ
  title, // Viết hoa chữ cái đầu mỗi từ
  sentence, // Viết hoa chữ cái đầu câu
}

/// Extension để chuyển đổi String theo TextCaseType
extension TextCaseExtension on String {
  /// Chuyển đổi String theo kiểu chữ chỉ định
  String getTextByCasing(TextCaseType caseType) {
    switch (caseType) {
      case TextCaseType.upper:
        return toUpperCase();
      case TextCaseType.lower:
        return toLowerCase();
      case TextCaseType.title:
        return split(' ')
            .map(
              (word) => word.isNotEmpty
                  ? word[0].toUpperCase() + word.substring(1).toLowerCase()
                  : '',
            )
            .join(' ');
      case TextCaseType.sentence:
        return isEmpty
            ? this
            : this[0].toUpperCase() + substring(1).toLowerCase();
      case TextCaseType.none:
        return this;
    }
  }
}

// ============================================================================
// DATE & TIME FORMATTING EXTENSIONS
// ============================================================================

extension DateTimeFormatting on DateTime {
  /// Format datetime theo định dạng tùy chỉnh
  /// Ví dụ: "25 Th10 14:30"
  String toCustomFormat() {
    final DateFormat dateFormat = DateFormat("dd 'Th'MM HH:mm");
    return dateFormat.format(toLocal());
  }
}

extension DurationFormatting on Duration {
  /// Format duration cho video
  /// Ví dụ: "01:23:45" hoặc "23:45"
  String videoDuration() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitHours = twoDigits(inHours);
    String twoDigitMinutes = twoDigits(inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(inSeconds.remainder(60));
    if (twoDigitHours == '00') {
      return '$twoDigitMinutes:$twoDigitSeconds';
    } else {
      return '$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds';
    }
  }
}

extension DateFormatExtension on String {
  /// Chuyển đổi String sang định dạng ngày tháng
  /// Ví dụ: "2024-01-25T10:30:00" -> "25/01/24 10:30:00"
  String toDateFormat() {
    try {
      DateTime dateTime = DateTime.parse(this);
      return DateFormat('dd/MM/yy HH:mm:ss').format(dateTime);
    } catch (e) {
      return 'Invalid Date';
    }
  }

  /// Chuyển đổi String sang phần trăm
  /// Ví dụ: "75.5" -> "75.5%"
  String toPercentage() {
    try {
      double value = double.parse(this);
      return '${value.toStringAsFixed(1)}%';
    } catch (e) {
      return this;
    }
  }
}
