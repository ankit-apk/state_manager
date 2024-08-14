// lib/src/scoped_state_container.dart

import 'state_container.dart';

/// A container that manages multiple [StateContainer]s, each associated with a unique key.
///
/// [T] is the type of state being managed in each container.
class ScopedStateContainer<T> {
  /// A map of key-value pairs where the key is a unique identifier
  /// and the value is a [StateContainer] instance.
  final Map<String, StateContainer<T>> _scopedContainers = {};

  /// Retrieves or creates a [StateContainer] for the given key.
  ///
  /// If a container doesn't exist for the given key, a new one is created
  /// with the provided initial state.
  ///
  /// [key] The unique identifier for the container.
  /// [initialState] The initial state to use if a new container is created.
  /// Returns the [StateContainer] associated with the key.
  StateContainer<T> getContainer(String key, T initialState) {
    return _scopedContainers.putIfAbsent(
        key, () => StateContainer(initialState));
  }

  /// Removes the [StateContainer] associated with the given key.
  ///
  /// [key] The unique identifier of the container to remove.
  void removeScope(String key) {
    _scopedContainers.remove(key);
  }
}
