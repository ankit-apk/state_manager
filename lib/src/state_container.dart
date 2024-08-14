// lib/src/state_container.dart

import 'dart:ui';

class StateContainer<T> {
  T _state;
  final List<VoidCallback> _listeners = [];

  StateContainer(this._state);

  T get state => _state;

  void setState(T newState) {
    _state = newState;
    _notifyListeners();
  }

  void _notifyListeners() {
    for (var listener in _listeners) {
      listener();
    }
  }

  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }
}
