// lib/src/utils/persistence_helper.dart

import 'package:shared_preferences/shared_preferences.dart';

class PersistenceHelper {
  static Future<String?> loadState(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<void> saveState(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
}
