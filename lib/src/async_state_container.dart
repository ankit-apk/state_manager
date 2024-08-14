// lib/src/async_state_container.dart

import 'dart:ui';

/// A container for managing asynchronous state with loading and error handling.
///
/// [T] is the type of state being managed.
class AsyncStateContainer<T> {
  /// The current state value, which may be null during loading or error states.
  T? _state;

  /// Indicates whether the state is currently being loaded.
  bool _isLoading = false;

  /// Stores any error that occurred during state loading.
  dynamic _error;

  /// A list of callbacks to be invoked when the state changes.
  final List<VoidCallback> _listeners = [];

  /// Creates a new [AsyncStateContainer] with initial null state.
  AsyncStateContainer();

  /// Gets the current state value.
  T? get state => _state;

  /// Indicates whether the state is currently being loaded.
  bool get isLoading => _isLoading;

  /// Returns any error that occurred during state loading.
  dynamic get error => _error;

  /// Updates the state asynchronously and notifies all listeners.
  ///
  /// [futureState] A Future that resolves to the new state value.
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

  /// Notifies all registered listeners of a state change.
  void _notifyListeners() {
    for (var listener in _listeners) {
      listener();
    }
  }

  /// Adds a listener to be notified of state changes.
  ///
  /// [listener] The callback function to be invoked on state changes.
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  /// Removes a previously added listener.
  ///
  /// [listener] The callback function to be removed from the listeners list.
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }
}
