// storage_pin.dart (hoặc thêm ngay trong Storage hiện có)
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uuid/uuid.dart';

class AppPinStorage {
  static const _storage = FlutterSecureStorage();

  static const _kPinHash = 'app_pin_hash';
  static const _kPinSalt = 'app_pin_salt';

  static Future<bool> hasPin() async {
    final hash = await _storage.read(key: _kPinHash);
    return hash != null && hash.isNotEmpty;
  }

  static Future<void> clearPin() async {
    await _storage.delete(key: _kPinHash);
    await _storage.delete(key: _kPinSalt);
  }

  static Future<void> setPin(String pin4) async {
    assert(RegExp(r'^\d{4}$').hasMatch(pin4));
    final salt = const Uuid().v4();
    final raw = utf8.encode('$salt::$pin4');
    final digest = sha256.convert(raw).toString();
    await _storage.write(key: _kPinSalt, value: salt);
    await _storage.write(key: _kPinHash, value: digest);
  }

  static Future<bool> verifyPin(String pin4) async {
    final salt = await _storage.read(key: _kPinSalt);
    final hash = await _storage.read(key: _kPinHash);
    if (salt == null || hash == null) return false;
    final raw = utf8.encode('$salt::$pin4');
    final digest = sha256.convert(raw).toString();
    return hash == digest;
  }
}
