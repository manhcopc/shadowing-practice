import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import 'package:uuid/uuid.dart';

class Utility {
  static Future<String> getStableId() async {
    try {
      final id = await MobileDeviceIdentifier().getDeviceId();
      if (id != null && id.isNotEmpty) {
        return id; // MediaDrm (Android) / Keychain (iOS)
      }
    } catch (_) {
      /* thiết bị không hỗ trợ DRM, emulator, v.v. */

      var local = Uuid().v4();
      return local;
    }

    // Fallback if getDeviceId() returns null or empty
    return Uuid().v4();
  }

  
  static String randomNonce([int length = 32]) {
    const cs =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final r = Random.secure();
    return List.generate(length, (_) => cs[r.nextInt(cs.length)]).join();
  }

  static String createSHA256(String s) => sha256.convert(utf8.encode(s)).toString();
}
