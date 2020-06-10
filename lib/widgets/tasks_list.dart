import 'package:flutter/material.dart';
import './task_tile.dart';
import '../models/task.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: tasks[index].name,
          isChecked: tasks[index].isDone,
          checkboxCallback: (bool currentCheckboxState) {
            setState(() {
//              tasks[index].isDone = currentCheckboxState;
              tasks[index].toggleDone();
            });
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}
