import 'dart:ffi';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage._();

  static final SecureStorage _instance = SecureStorage._();
  factory SecureStorage() => _instance;

  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<void> saveData(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> readData(String key) async {
    String? value = await _storage.read(key: key);
    if (value == null) {
      throw Exception("No value with Key: $key");
    }
    return value;
  }
}
