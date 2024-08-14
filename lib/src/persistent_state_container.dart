// lib/src/persistent_state_container.dart

import 'package:shared_preferences/shared_preferences.dart';

import 'state_container.dart';

/// A [StateContainer] that persists its state to local storage.
///
/// [T] is the type of state being managed and persisted.
class PersistentStateContainer<T> extends StateContainer<T> {
  /// The key used to store and retrieve the state from SharedPreferences.
  final String _key;

  /// A function to convert a JSON string to the state object.
  final T Function(String) _fromJson;

  /// A function to convert the state object to a JSON string.
  final String Function(T) _toJson;

  /// Creates a new [PersistentStateContainer].
  ///
  /// [initialState] The initial state of the container.
  /// [key] The key used for storing the state in SharedPreferences.
  /// [fromJson] A function to deserialize the state from a JSON string.
  /// [toJson] A function to serialize the state to a JSON string.
  PersistentStateContainer(
    super.initialState, {
    required String key,
    required T Function(String) fromJson,
    required String Function(T) toJson,
  })  : _key = key,
        _fromJson = fromJson,
        _toJson = toJson {
    _loadState();
  }

  /// Loads the persisted state from SharedPreferences.
  void _loadState() async {
    final prefs = await SharedPreferences.getInstance();
    final stateString = prefs.getString(_key);
    if (stateString != null) {
      setState(_fromJson(stateString));
    }
  }

  /// Overrides the setState method to persist the new state.
  @override
  void setState(T newState) {
    super.setState(newState);
    _saveState(newState);
  }

  /// Saves the current state to SharedPreferences.
  void _saveState(T state) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, _toJson(state));
  }
}
