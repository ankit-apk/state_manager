// lib/src/persistent_state_container.dart

import 'package:shared_preferences/shared_preferences.dart';

import 'state_container.dart';

class PersistentStateContainer<T> extends StateContainer<T> {
  final String _key;
  final T Function(String) _fromJson;
  final String Function(T) _toJson;

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

  void _loadState() async {
    final prefs = await SharedPreferences.getInstance();
    final stateString = prefs.getString(_key);
    if (stateString != null) {
      setState(_fromJson(stateString));
    }
  }

  @override
  void setState(T newState) {
    super.setState(newState);
    _saveState(newState);
  }

  void _saveState(T state) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, _toJson(state));
  }
}
