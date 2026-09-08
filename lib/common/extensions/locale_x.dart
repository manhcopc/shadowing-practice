import 'dart:ui';

import '../../core/language/generated/l10n.dart';

extension LocaleX on Locale {
  // Trả về tên ngôn ngữ
  String get languageName {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'vi':
        return 'Tiếng Việt';
      case 'zh':
        return 'Chinese (中文)';
      case 'fr':
        return 'French (Français)';
      case 'de':
        return 'German (Deutsch)';
      case 'ja':
        return 'Japanese (日本語)';
      case 'ko':
        return 'Korean (한국어)';
      case 'es':
        return 'Spanish (Español)';
      case 'ru':
        return 'Russian (Русский)';
      case 'pt':
        return 'Portuguese (Português)';
      case 'it':
        return 'Italian (Italiano)';
      case 'ar':
        return 'Arabic (العربية)';
      case 'hi':
        return 'Hindi (हिन्दी)';
      case 'bn':
        return 'Bengali (বাংলা)';
      case 'th':
        return 'Thai (ไทย)';
      case 'id':
        return 'Indonesian (Bahasa Indonesia)';
      case 'ms':
        return 'Malay (Bahasa Melayu)';
      case 'nl':
        return 'Dutch (Nederlands)';
      case 'tr':
        return 'Turkish (Türkçe)';
      case 'pl':
        return 'Polish (Polski)';
      case 'sv':
        return 'Swedish (Svenska)';
      case 'uk':
        return 'Ukrainian (Українська)';
      case 'ro':
        return 'Romanian (Română)';
      case 'cs':
        return 'Czech (Čeština)';
      case 'hu':
        return 'Hungarian (Magyar)';
      case 'el':
        return 'Greek (Ελληνικά)';
      case 'da':
        return 'Danish (Dansk)';
      case 'fi':
        return 'Finnish (Suomi)';
      case 'no':
        return 'Norwegian (Norsk)';
      case 'he':
        return 'Hebrew (עברית)';
      case 'bg':
        return 'Bulgarian (Български)';
      default:
        return 'Unknown';
    }
  }

  // Trả về mã ngôn ngữ để sử dụng với API
  String get apiKey {
    switch (languageCode) {
      case 'en':
        return 'en';
      case 'vi':
        return 'vi';
      case 'zh':
        return 'zh';
      case 'fr':
        return 'fr';
      case 'de':
        return 'de';
      case 'ja':
        return 'ja';
      case 'ko':
        return 'ko';
      case 'es':
        return 'es';
      case 'ru':
        return 'ru';
      case 'pt':
        return 'pt';
      case 'it':
        return 'it';
      case 'ar':
        return 'ar';
      case 'hi':
        return 'hi';
      case 'bn':
        return 'bn';
      case 'th':
        return 'th';
      case 'id':
        return 'id';
      case 'ms':
        return 'ms';
      case 'nl':
        return 'nl';
      case 'tr':
        return 'tr';
      case 'pl':
        return 'pl';
      case 'sv':
        return 'sv';
      case 'uk':
        return 'uk';
      case 'ro':
        return 'ro';
      case 'cs':
        return 'cs';
      case 'hu':
        return 'hu';
      case 'el':
        return 'el';
      case 'da':
        return 'da';
      case 'fi':
        return 'fi';
      case 'no':
        return 'no';
      case 'he':
        return 'he';
      case 'bg':
        return 'bg';
      default:
        return 'en'; // Mặc định là tiếng Anh nếu không nhận diện được
    }
  }

  // Lấy ra languageCode và scriptCode, kết hợp thành dạng languageCode_scriptCode hoặc chỉ languageCode nếu scriptCode = null
  String get fullLanguageCode =>
      [languageCode, scriptCode].where((element) => element != null).join('_');

  // So sánh hai Locale, kiểm tra xem chúng có giống nhau không
  bool isEqualTo(Locale compare) {
    if (this == compare) {
      return true;
    }
    if (scriptCode?.isNotEmpty == true && scriptCode == compare.scriptCode) {
      return true;
    }
    if ((scriptCode?.isEmpty == true || compare.scriptCode?.isEmpty == true) &&
        countryCode?.isNotEmpty == true &&
        countryCode == compare.countryCode) {
      return true;
    }
    return false;
  }

  // Lấy danh sách các Locale được hỗ trợ (tiếng Anh và tiếng Việt)
  static List<Locale> get supportedLocales =>
      List<Locale>.from(S.delegate.supportedLocales)
        ..sort((l, r) {
          return l.languageCode.compareTo(r.languageCode);
        });

  // Định nghĩa ngôn ngữ mặc định nếu không có Locale được chọn (fallback là tiếng Việt)
  static Locale get fallbackLocale => const Locale('vi');
}

extension StringLocale on String {
  // Chuyển đổi chuỗi thành Locale (hỗ trợ tất cả ngôn ngữ)
  Locale get toLocale {
    final components = split('_');
    if (components.isNotEmpty) {
      final locale = Locale(components[0]);
      // Kiểm tra xem locale có được hỗ trợ không
      if (S.delegate.isSupported(locale)) {
        return locale;
      } else {
        return LocaleX.fallbackLocale;
      }
    } else {
      return LocaleX.fallbackLocale;
    }
  }
}
