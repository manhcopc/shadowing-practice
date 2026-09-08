import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../../modules/profile/models/user_model.dart';

class _Keys {
  static const lang = 'lang';
  static const user = 'user';
  static const accessToken = 'access_token';
  static const refreshToken = 'refresh_token';
  static const deviceId = 'device_id';
  static const pushToken = 'push_token';
  static const apnsToken = 'apns_token';
  static const rememberMe = 'remember_me';
  static const themeMode = 'theme_mode';
  static const notificationManualDisabled = 'notification_manual_disabled';
  static const appLaunchCount = 'app_launch_count';
  static const deviceName = 'device_name';
  static const userDefault = 'user_default';
  static const echoOnboardingCompleted = 'echo_onboarding_completed';
  static const echoSelectedLanguage = 'echo_selected_language';
  static const echoSelectedLevel = 'echo_selected_level';
  static const echoWeeklyGoal = 'echo_weekly_goal';
  static const echoLessonProgress = 'echo_lesson_progress';
  static const echoRecentScores = 'echo_recent_scores';
  static const echoSentenceStats = 'echo_sentence_stats';
  static const echoPracticeDates = 'echo_practice_dates';
  static const shadowMvpFavoritePassageIds =
      'shadow_mvp_favorite_passage_ids';
}

class Storage {
  static late SharedPreferences _preferences;

  static late RxSharedPreferences _rxPreferences;

  static const _storage = FlutterSecureStorage();

  static Future<void> setup() async {
    _preferences = await SharedPreferences.getInstance();

    _rxPreferences = RxSharedPreferences(
      _preferences,

      kReleaseMode ? null : const RxSharedPreferencesDefaultLogger(),
    );
  }

  static T? _get<T>(String key) => _preferences.get(key) as T?;

  static Future<void> _set<T>(String key, T? val, {bool notify = false}) {
    if (val == null) {
      return notify ? _rxPreferences.remove(key) : _preferences.remove(key);
    }
    if (val is bool) {
      return notify
          ? _rxPreferences.setBool(key, val)
          : _preferences.setBool(key, val);
    }
    if (val is double) {
      return notify
          ? _rxPreferences.setDouble(key, val)
          : _preferences.setDouble(key, val);
    }
    if (val is int) {
      return notify
          ? _rxPreferences.setInt(key, val)
          : _preferences.setInt(key, val);
    }
    if (val is String) {
      return notify
          ? _rxPreferences.setString(key, val)
          : _preferences.setString(key, val);
    }
    if (val is List<String>) {
      notify
          ? _rxPreferences.setStringList(key, val)
          : _preferences.setStringList(key, val);
    }
    throw Exception('Type not supported!');
  }

  static Future<String?> _getSecure(String key) => _storage.read(key: key);

  static Future<void> _setSecure(String key, String? val) =>
      _storage.write(key: key, value: val);

  static Future<void> setAccessToken(String? accessToken) async {
    await _setSecure(_Keys.accessToken, accessToken);
  }

  static Future<String?> getAccessToken() async {
    return _getSecure(_Keys.accessToken);
  }

  static Future<void> setRefreshToken(String? refreshToken) async {
    await _setSecure(_Keys.refreshToken, refreshToken);
  }

  static Future<String?> getRefreshToken() async {
    return _getSecure(_Keys.refreshToken);
  }

  static String? get lang => _get(_Keys.lang);

  static Future setLang(String? val) => _set(_Keys.lang, val);

  static String get deviceId {
    String? deviceId = _get(_Keys.deviceId);
    if (deviceId == null) {
      deviceId = const Uuid().v4();
      setDeviceId(deviceId);
    }
    return deviceId;
  }

  static Future setDeviceId(String? val) => _set(_Keys.deviceId, val);

  static String? get pushToken => _get(_Keys.pushToken);

  static Future setPushToken(String? val) => _set(_Keys.pushToken, val);

  static String? get apnsToken => _get(_Keys.apnsToken);

  static Future setApnsToken(String? val) => _set(_Keys.apnsToken, val);

  static Future<void> setRememberMe(bool rememberMe) async {
    await _set(_Keys.rememberMe, rememberMe);
  }

  static bool get rememberMe => _get<bool>(_Keys.rememberMe) ?? false;

  static Future<void> setThemeMode(int themeMode) async {
    await _set(_Keys.themeMode, themeMode);
  }

  static int get themeMode => _get<int>(_Keys.themeMode) ?? 1;

  static Future<void> setNotificationManualDisabled(bool val) async {
    await _set(_Keys.notificationManualDisabled, val);
  }

  static bool get notificationManualDisabled =>
      _get<bool>(_Keys.notificationManualDisabled) ?? false;

  // App launch counter getters and setters
  static int get appLaunchCount => _get<int>(_Keys.appLaunchCount) ?? 0;

  static Future<void> setAppLaunchCount(int val) =>
      _set(_Keys.appLaunchCount, val);

  static Future<void> incrementAppLaunchCount() async {
    int currentCount = appLaunchCount;
    await setAppLaunchCount(currentCount + 1);
  }

  static bool get isSecondLaunch => appLaunchCount == 2;

  // Lưu thông tin người dùng vào SharedPreferences
  static Future<void> setUser(UserModel user) async {
    final jsonUser = jsonEncode(user.toJson()); // Chuyển UserModel thành JSON
    await _set(_Keys.user, jsonUser); // Lưu JSON vào SharedPreferences
  }

  // Truy xuất thông tin người dùng từ SharedPreferences
  static UserModel? get user {
    final jsonString = _get<String>(
      _Keys.user,
    ); // Lấy JSON từ SharedPreferences
    if (jsonString == null) return null;
    try {
      return UserModel.fromJson(
        jsonDecode(jsonString),
      ); // Chuyển JSON thành UserModel
    } catch (e) {
      return null;
    }
  }

  static Future<void> clearInfoUser() async {
    // Xóa thông tin người dùng
    await _preferences.remove(_Keys.user);

    // Xóa accessToken và refreshToken
    await _storage.delete(key: _Keys.accessToken);
    await _storage.delete(key: _Keys.refreshToken);
  }

  static bool get isLoggedIn => user != null;

  static String? get deviceName => _get(_Keys.deviceName);

  static Future<void> setDeviceName(String? val) => _set(_Keys.deviceName, val);

  // Truy xuất thông tin người dùng mặc định từ SharedPreferences
  static UserModel? get userDefault {
    final jsonString = _get<String>(
      _Keys.userDefault,
    ); // Lấy JSON từ SharedPreferences
    if (jsonString == null) return null;
    try {
      return UserModel.fromJson(
        jsonDecode(jsonString),
      ); // Chuyển JSON thành UserModel
    } catch (e) {
      return null;
    }
  }

  // Lưu thông tin người dùng mặc định vào SharedPreferences
  static Future<void> setUserDefault(UserModel user) async {
    final jsonUser = jsonEncode(user.toJson()); // Chuyển UserModel thành JSON
    await _set(_Keys.userDefault, jsonUser); // Lưu JSON vào SharedPreferences
  }

  static bool get echoOnboardingCompleted =>
      _get<bool>(_Keys.echoOnboardingCompleted) ?? false;

  static Future<void> setEchoOnboardingCompleted(bool val) =>
      _set(_Keys.echoOnboardingCompleted, val);

  static String get echoSelectedLanguage =>
      _get<String>(_Keys.echoSelectedLanguage) ?? 'English';

  static Future<void> setEchoSelectedLanguage(String val) =>
      _set(_Keys.echoSelectedLanguage, val);

  static String get echoSelectedLevel =>
      _get<String>(_Keys.echoSelectedLevel) ?? 'Beginner';

  static Future<void> setEchoSelectedLevel(String val) =>
      _set(_Keys.echoSelectedLevel, val);

  static int get echoWeeklyGoal => _get<int>(_Keys.echoWeeklyGoal) ?? 30;

  static Future<void> setEchoWeeklyGoal(int val) =>
      _set(_Keys.echoWeeklyGoal, val);

  static Map<String, double> get echoLessonProgress {
    final jsonString = _get<String>(_Keys.echoLessonProgress);
    if (jsonString == null) return {};
    final decoded = jsonDecode(jsonString) as Map<String, dynamic>;
    return decoded.map((key, value) => MapEntry(key, (value as num).toDouble()));
  }

  static Future<void> setEchoLessonProgress(Map<String, double> val) =>
      _set(_Keys.echoLessonProgress, jsonEncode(val));

  static List<int> get echoRecentScores {
    final jsonString = _get<String>(_Keys.echoRecentScores);
    if (jsonString == null) return [];
    final decoded = jsonDecode(jsonString) as List<dynamic>;
    return decoded.map((score) => (score as num).round()).toList();
  }

  static Future<void> setEchoRecentScores(List<int> val) =>
      _set(_Keys.echoRecentScores, jsonEncode(val));

  static Map<String, dynamic> get echoSentenceStats {
    final jsonString = _get<String>(_Keys.echoSentenceStats);
    if (jsonString == null) return {};
    return jsonDecode(jsonString) as Map<String, dynamic>;
  }

  static Future<void> setEchoSentenceStats(Map<String, dynamic> val) =>
      _set(_Keys.echoSentenceStats, jsonEncode(val));

  static List<String> get echoPracticeDates {
    final jsonString = _get<String>(_Keys.echoPracticeDates);
    if (jsonString == null) return [];
    final decoded = jsonDecode(jsonString) as List<dynamic>;
    return decoded.map((date) => date.toString()).toList();
  }

  static Future<void> setEchoPracticeDates(List<String> val) =>
      _set(_Keys.echoPracticeDates, jsonEncode(val));

  static List<String> get shadowMvpFavoritePassageIds {
    final jsonString = _get<String>(_Keys.shadowMvpFavoritePassageIds);
    if (jsonString == null) return [];
    final decoded = jsonDecode(jsonString) as List<dynamic>;
    return decoded.map((id) => id.toString()).toList();
  }

  static Future<void> setShadowMvpFavoritePassageIds(List<String> val) =>
      _set(_Keys.shadowMvpFavoritePassageIds, jsonEncode(val));
}
