import 'package:flutter/material.dart';

import 'features/people/presentation/screen/employee_list.dart';
import 'screens/async_data_screen.dart';
import 'screens/counter_screen.dart';
import 'screens/persistent_counter_screen.dart';
import 'screens/scoped_state_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CounterScreen(),
      routes: {
        '/counter': (_) => const CounterScreen(),
        '/async': (_) => const AsyncDataScreen(),
        '/scoped': (_) => const ScopedStateScreen(),
        '/persistent': (_) => const PersistentCounterScreen(),
        '/employee': (_) => EmployeeListScreen(),
      },
    );
  }
}
