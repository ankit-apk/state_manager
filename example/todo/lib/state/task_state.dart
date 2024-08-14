import 'package:state_manager/state_manager.dart';

import '../models/task.dart';

class TaskStateContainer extends StateContainer<List<Task>> {
  TaskStateContainer(super.initialState);

  void addTask(Task task) {
    setState(_addTaskToList(task));
  }

  void updateTask(Task task) {
    setState(_updateTaskInList(task));
  }

  void deleteTask(String id) {
    setState(_deleteTaskFromList(id));
  }

  List<Task> _addTaskToList(Task task) {
    return [...state, task];
  }

  List<Task> _updateTaskInList(Task task) {
    return state.map((t) => t.id == task.id ? task : t).toList();
  }

  List<Task> _deleteTaskFromList(String id) {
    return state.where((t) => t.id != id).toList();
  }
}
