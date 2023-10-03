import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/task.dart';

class TaskController extends GetxController {
  final RxList<Task> _taskList =
      <Task>[].obs; // Specify the generic type as Task

//getter
  get taskList => _taskList;

  // Add a task to the list----
  void addTask(Task newTask) {
    _taskList.add(newTask);
    debugPrint('taskList---$_taskList');
  }

  void removeTask(int index) {
    if (index >= 0 && index < _taskList.length) {
      _taskList.removeAt(index);
    }
  }

  void editTask(Task task) {
    int index = _taskList.indexWhere((element) => element.name == task.name);
    if (index != -1) {
      _taskList[index] = task;
    }
  }

  void markTaskCompleted(Task task) {
    int index = _taskList.indexWhere((element) => element.name == task.name);
    if (index != -1) {
      _taskList[index] = task;
    }
  }
}
