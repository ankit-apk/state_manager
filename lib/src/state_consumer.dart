// lib/src/state_consumer.dart

import 'package:flutter/material.dart';

import 'state_container.dart';

class StateConsumer<T> extends StatelessWidget {
  final StateContainer<T> container;
  final Widget Function(BuildContext context, T state) builder;

  const StateConsumer({
    super.key,
    required this.container,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    container.addListener(() => (context as Element).markNeedsBuild());
    return builder(context, container.state);
  }
}
