import 'package:flutter/material.dart';
import './task.dart';

class TaskList extends ChangeNotifier {
  List<Task> tasks = [
//    Task(name: 'Buy milk'),
//    Task(name: 'Buy eggs'),
//    Task(name: 'Buy bread'),
//    Task(name: 'Buy sugar'),
//    Task(name: 'Buy ice-cream'),
//    Task(name: 'Buy cereal'),
//    Task(name: 'Buy bacon'),
//    Task(name: 'Buy sauce'),
//    Task(name: 'Buy quiche'),
//    Task(name: 'Buy flour'),
//    Task(name: 'Buy yeast'),
//    Task(name: 'Buy fruit'),
  ];

  // TODO: Create function to add new task to list
  void addNewTask({String taskTitle}) {
    tasks.add(Task(name: taskTitle));
    notifyListeners();
  }
}
