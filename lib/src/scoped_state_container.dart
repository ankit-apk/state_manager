// lib/src/scoped_state_container.dart

import 'state_container.dart';

class ScopedStateContainer<T> {
  final Map<String, StateContainer<T>> _scopedContainers = {};

  StateContainer<T> getContainer(String key, T initialState) {
    return _scopedContainers.putIfAbsent(
        key, () => StateContainer(initialState));
  }

  void removeScope(String key) {
    _scopedContainers.remove(key);
  }
}
