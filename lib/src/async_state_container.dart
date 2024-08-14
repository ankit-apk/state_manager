// lib/src/async_state_container.dart

import 'dart:ui';

class AsyncStateContainer<T> {
  T? _state;
  bool _isLoading = false;
  dynamic _error;
  final List<VoidCallback> _listeners = [];

  AsyncStateContainer();

  T? get state => _state;
  bool get isLoading => _isLoading;
  dynamic get error => _error;

  Future<void> setState(Future<T> futureState) async {
    _isLoading = true;
    _notifyListeners();

    try {
      _state = await futureState;
      _error = null;
    } catch (e) {
      _error = e;
    } finally {
      _isLoading = false;
      _notifyListeners();
    }
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
