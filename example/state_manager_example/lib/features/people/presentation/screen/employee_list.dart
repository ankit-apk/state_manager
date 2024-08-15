import 'package:flutter/material.dart';
import 'package:state_manager/state_manager.dart';

import '../state_manager/state_manager.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  _EmployeeListScreenState createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  final EmployeeStateManager _employeeStateManager = EmployeeStateManager();

  @override
  Widget build(BuildContext context) {
    final asyncState = watchState(_employeeStateManager);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'),
      ),
      body: Center(
        child: asyncState.container.isLoading
            ? const CircularProgressIndicator()
            : asyncState.container.error != null
                ? Text('Error: ${asyncState.container.error}')
                : asyncState.value != null
                    ? ListView.builder(
                        itemCount: asyncState.value!.data.length,
                        itemBuilder: (context, index) {
                          final employee = asyncState.value!.data[index];
                          return ListTile(
                            title: Text(employee.employeeName),
                            subtitle: Text(
                                'Age: ${employee.employeeAge}, Salary: ${employee.employeeSalary}'),
                          );
                        },
                      )
                    : const Text('Press the button to load employees'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _employeeStateManager.fetchEmployees,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
