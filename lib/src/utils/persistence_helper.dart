// lib/src/utils/persistence_helper.dart

import 'package:shared_preferences/shared_preferences.dart';

/// A utility class for persisting and retrieving state using SharedPreferences.
class PersistenceHelper {
  /// Loads a string value from SharedPreferences.
  ///
  /// [key] The key used to retrieve the stored value.
  /// Returns a Future that resolves to the stored string value, or null if not found.
  static Future<String?> loadState(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  /// Saves a string value to SharedPreferences.
  ///
  /// [key] The key used to store the value.
  /// [value] The string value to be stored.
  /// Returns a Future that completes when the value has been saved.
  static Future<void> saveState(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
}
