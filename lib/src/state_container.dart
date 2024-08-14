// lib/src/state_container.dart

import 'dart:ui';

/// A generic container for managing state and notifying listeners of state changes.
///
/// [T] is the type of state being managed.
class StateContainer<T> {
  /// The current state value.
  T _state;

  /// A list of callbacks to be invoked when the state changes.
  final List<VoidCallback> _listeners = [];

  /// Creates a new [StateContainer] with the given initial state.
  ///
  /// [_state] The initial state value.
  StateContainer(this._state);

  /// Gets the current state value.
  T get state => _state;

  /// Updates the state and notifies all listeners.
  ///
  /// [newState] The new state value to set.
  void setState(T newState) {
    _state = newState;
    _notifyListeners();
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
