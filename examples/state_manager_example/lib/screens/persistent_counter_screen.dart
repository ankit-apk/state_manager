import 'package:flutter/material.dart';
import 'package:state_manager/state_manager.dart';

import '../widgets/app_drawer.dart';

final persistentContainer = PersistentStateContainer<int>(
  0,
  key: 'persistentCounter',
  fromJson: (json) => int.parse(json),
  toJson: (state) => state.toString(),
);

class PersistentCounterScreen extends StatefulWidget {
  const PersistentCounterScreen({super.key});

  @override
  _PersistentCounterScreenState createState() =>
      _PersistentCounterScreenState();
}

class _PersistentCounterScreenState extends State<PersistentCounterScreen> {
  @override
  Widget build(BuildContext context) {
    final persistentState = watchState(persistentContainer);

    return Scaffold(
      appBar: AppBar(title: const Text('Persistent Counter Screen')),
      drawer: const AppDrawer(),
      body: Center(
        child: Text('Persistent Counter: ${persistentState.value}',
            style: const TextStyle(fontSize: 24)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => persistentState.update(persistentState.value + 1),
        child: const Icon(Icons.add),
      ),
    );
  }
}
