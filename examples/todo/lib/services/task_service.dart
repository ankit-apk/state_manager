import '../models/task.dart';

Future<List<Task>> fetchTasks() async {
  await Future.delayed(const Duration(seconds: 20)); // Simulate network delay
  return [
    Task(id: '1', title: 'Buy groceries'),
    Task(id: '2', title: 'Walk the dog'),
    Task(id: '3', title: 'Buy groceries'),
    Task(id: '4', title: 'Buy groceries'),
    Task(id: '5', title: 'Buy groceries'),
    Task(id: '6', title: 'Buy groceries'),
    Task(id: '7', title: 'Buy groceries'),
    Task(id: '8', title: 'Buy groceries'),
    Task(id: '9', title: 'Buy groceries'),
    Task(id: '10', title: 'Buy groceries'),
  ];
}
