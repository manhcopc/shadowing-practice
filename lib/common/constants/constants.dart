import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  AppConstants._();
  static const nameApp = 'SkinSort';
  static final String baseUrlFunction = dotenv.env['API_URL_FUNCTION'] ?? '';

  static const String androidPackageName = "com.fau.skinsoft";
  static const String iosPackageName = "com.fau.skinsoft";
  static const String appStoreId = '6754014248';
  static const titleHome = 'Home';
  static const titleProfile = 'Profile';
}
