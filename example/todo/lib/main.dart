import 'package:flutter/material.dart';
import 'package:state_manager/state_manager.dart';

import 'models/task.dart';
import 'services/task_service.dart';
import 'state/persistent_task_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //  final themeContainer = ThemeStateContainer();
    final taskContainer = PersistentTaskStateContainer(
      [],
      key: 'tasks',
    );

    return MaterialApp(
      // themeMode: themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: HomePage(taskContainer: taskContainer),
    );
  }
}

class HomePage extends StatefulWidget {
  final PersistentTaskStateContainer taskContainer;

  const HomePage({super.key, required this.taskContainer});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Task>> _tasksFuture;

  @override
  void initState() {
    super.initState();
    _tasksFuture = fetchTasks();
    _tasksFuture.then((tasks) {
      widget.taskContainer.setState(tasks);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
        actions: [
          IconButton(
            icon: const Icon(Icons.toggle_off),
            onPressed: () {
              // final newTheme = Theme.of(context).brightness == Brightness.dark
              //     ? ThemeMode.light
              //     : ThemeMode.dark;
              // final themeContainer = ThemeStateContainer();
              //   themeContainer.setState(newTheme);
            },
          ),
        ],
      ),
      body: StateConsumer<List<Task>>(
        container: widget.taskContainer,
        builder: (context, tasks) {
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return ListTile(
                title: Text(task.title),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    widget.taskContainer.deleteTask(task.id);
                  },
                ),
                onTap: () {
                  widget.taskContainer.updateTask(
                      task.copyWith(isCompleted: !task.isCompleted));
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final newTask =
              Task(id: DateTime.now().toString(), title: 'New Task');
          widget.taskContainer.addTask(newTask);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
