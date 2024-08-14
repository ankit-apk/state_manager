// lib/src/state_consumer.dart

import 'package:flutter/material.dart';

import 'state_container.dart';

/// A widget that consumes a [StateContainer] and rebuilds when the state changes.
///
/// [T] is the type of state being consumed.
class StateConsumer<T> extends StatelessWidget {
  /// The [StateContainer] to consume.
  final StateContainer<T> container;

  /// A function that builds the widget tree based on the current state.
  ///
  /// This function is called every time the state changes.
  final Widget Function(BuildContext context, T state) builder;

  /// Creates a [StateConsumer].
  ///
  /// The [container] and [builder] parameters must not be null.
  const StateConsumer({
    super.key,
    required this.container,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    // Add a listener to rebuild the widget when the state changes
    container.addListener(() => (context as Element).markNeedsBuild());

    // Call the builder function with the current state
    return builder(context, container.state);
  }
}
