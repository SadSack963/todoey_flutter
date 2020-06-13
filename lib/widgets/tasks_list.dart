import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './task_tile.dart';
import '../models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      // taskData is the equivalent of Provider.of<TaskData>(context)
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              taskTitle: taskData.tasks[index].name,
              isChecked: taskData.tasks[index].isDone,
              checkboxCallback: (bool currentCheckboxState) {
//                setState(() {
//                  Provider.of<TaskData>(context, listen: false).tasks[index].toggleDone();
//                });
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
