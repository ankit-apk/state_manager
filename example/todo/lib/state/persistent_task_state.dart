import 'dart:convert';

import 'package:state_manager/state_manager.dart';

import '../models/task.dart';

class PersistentTaskStateContainer
    extends PersistentStateContainer<List<Task>> {
  PersistentTaskStateContainer(super.initialState, {required super.key})
      : super(fromJson: (json) {
          final List<dynamic> data = jsonDecode(json);
          return data
              .map((item) => Task(
                    id: item['id'],
                    title: item['title'],
                    isCompleted: item['isCompleted'],
                  ))
              .toList();
        }, toJson: (tasks) {
          final List<Map<String, dynamic>> data = tasks
              .map((task) => {
                    'id': task.id,
                    'title': task.title,
                    'isCompleted': task.isCompleted,
                  })
              .toList();
          return jsonEncode(data);
        });

  void deleteTask(String id) {
    setState(state.where((task) => task.id != id).toList());
  }

  void updateTask(Task updatedTask) {
    setState(state
        .map((task) => task.id == updatedTask.id ? updatedTask : task)
        .toList());
  }

  void addTask(Task task) {
    setState([...state, task]);
  }
}
