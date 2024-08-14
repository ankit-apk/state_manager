// lib/src/state_extension.dart

import 'package:flutter/widgets.dart';

import '../state_manager.dart';

extension StateExtension on State {
  SimpleState<T> watchState<T>(dynamic container) {
    if (container is StateContainer<T> || container is AsyncStateContainer<T>) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        container.addListener(() {
          if (mounted) {
            (context as StatefulElement).markNeedsBuild();
          }
        });
      });
      return SimpleState(container);
    }
    throw ArgumentError('Unsupported container type');
  }

  SimpleState<T> readState<T>(StateContainer<T> container) {
    return SimpleState(container);
  }
}

class SimpleState<T> {
  final dynamic container;

  SimpleState(this.container);

  T get value => container.state;

  void update(T newState) {
    container.setState(newState);
  }
}
