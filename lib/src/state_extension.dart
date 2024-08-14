// lib/src/state_extension.dart

import 'package:flutter/widgets.dart';

import 'state_container.dart';

extension StateExtension on State {
  SimpleState<T> watchState<T>(StateContainer<T> container) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      container.addListener(() {
        if (mounted) {
          (context as StatefulElement).markNeedsBuild();
        }
      });
    });
    return SimpleState(container);
  }

  SimpleState<T> readState<T>(StateContainer<T> container) {
    return SimpleState(container);
  }
}

class SimpleState<T> {
  final StateContainer<T> container;

  SimpleState(this.container);

  T get value => container.state;

  void update(T newState) {
    container.setState(newState);
  }
}
