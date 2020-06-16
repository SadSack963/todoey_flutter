import 'package:flutter/material.dart';
import './task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
  ];

  // Making _tasks private and returning an Unmodifiable version to read from
  // prevents us accidentally using unsafe tasks.add in the program
  // and forces us to safely use addTask() instead which notifies listeners
  // UnmodifiableListView is a View into another List (not like a ListView widget)
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  // Create function to add new task to list
  void addTask(String newTaskTitle) {
    _tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(String taskTitle) {
    _tasks.removeWhere((_tasks) => (_tasks.name == taskTitle));
    notifyListeners();
  }
}
