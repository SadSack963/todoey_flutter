import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './task_tile.dart';
import '../models/tasklist.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: Provider.of<TaskList>(context).tasks[index].name,
          isChecked: Provider.of<TaskList>(context).tasks[index].isDone,
          checkboxCallback: (bool currentCheckboxState) {
            setState(() {
              Provider.of<TaskList>(context, listen: false).tasks[index].toggleDone();
            });
          },
        );
      },
      itemCount: Provider.of<TaskList>(context).tasks.length,
    );
  }
}
