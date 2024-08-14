import 'package:flutter/material.dart';
import 'package:state_manager/state_manager.dart';

import '../widgets/app_drawer.dart';

final counterContainer = StateContainer<int>(0);

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    final state = watchState(counterContainer);

    return Scaffold(
      appBar: AppBar(title: const Text('Counter Screen')),
      drawer: const AppDrawer(),
      body: Center(
        child: Text('Counter: ${state.value}',
            style: const TextStyle(fontSize: 24)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => state.update(state.value + 1),
        child: const Icon(Icons.add),
      ),
    );
  }
}
