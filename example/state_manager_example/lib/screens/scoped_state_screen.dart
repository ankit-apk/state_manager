import 'package:flutter/material.dart';
import 'package:state_manager/state_manager.dart';

import '../widgets/app_drawer.dart';

final scopedContainer = ScopedStateContainer<int>();

class ScopedStateScreen extends StatefulWidget {
  const ScopedStateScreen({super.key});

  @override
  _ScopedStateScreenState createState() => _ScopedStateScreenState();
}

class _ScopedStateScreenState extends State<ScopedStateScreen> {
  @override
  Widget build(BuildContext context) {
    final scopedState =
        watchState(scopedContainer.getContainer('scopedCounter', 0));

    return Scaffold(
      appBar: AppBar(title: const Text('Scoped State Screen')),
      drawer: const AppDrawer(),
      body: Center(
        child: Text('Scoped Counter: ${scopedState.value}',
            style: const TextStyle(fontSize: 24)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => scopedState.update(scopedState.value + 1),
        child: const Icon(Icons.add),
      ),
    );
  }
}
