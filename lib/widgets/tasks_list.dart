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
            final _task = taskData.tasks[index];
            return TaskTile(
              taskTitle: _task.name,
              isChecked: _task.isDone,
              checkboxCallback: (bool currentCheckboxState) {
                taskData.updateTask(_task);
              },
              longPressCallback: () {
                taskData.deleteTask(_task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
