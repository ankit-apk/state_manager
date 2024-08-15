import 'package:flutter/material.dart';
import 'package:state_manager/state_manager.dart';
import 'package:state_manager_example/features/people/data/model/employee_model.dart';

import '../widgets/app_drawer.dart';

final asyncContainer = AsyncStateContainer<List<String>>();

class AsyncDataScreen extends StatefulWidget {
  const AsyncDataScreen({super.key});

  @override
  _AsyncDataScreenState createState() => _AsyncDataScreenState();
}

class _AsyncDataScreenState extends State<AsyncDataScreen> {
  @override
  Widget build(BuildContext context) {
    final asyncState = watchState<EmployeeModel>(asyncContainer);

    return Scaffold(
      appBar: AppBar(title: const Text('Async Data Screen')),
      drawer: const AppDrawer(),
      body: Center(
        child: asyncState.container.isLoading
            ? const CircularProgressIndicator()
            : asyncState.container.error != null
                ? Text('Error: ${asyncState.container.error}')
                : ListView.builder(
                    itemCount: asyncState.value.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(asyncState.value.data[index].employeeName),
                      );
                    },
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => asyncContainer.setState(fetchData()),
        child: const Icon(Icons.download),
      ),
    );
  }

  Future<List<String>> fetchData() async {
    await Future.delayed(const Duration(seconds: 2));
    return ['Item 1', 'Item 2', 'Item 3'];
  }
}
