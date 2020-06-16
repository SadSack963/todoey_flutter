import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;

  TaskTile({this.isChecked, this.taskTitle, this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    // See also CheckboxListTile class
    return ListTile(
      contentPadding: EdgeInsets.only(left: 30, right: 60),
      title: Text(
        taskTitle,
        style: TextStyle(
          fontSize: 16,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        // No need for TaskCheckbox any more
        // since both Text and Checkbox will be recreated
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
      onLongPress: () {
        Provider.of<TaskData>(context, listen: false).deleteTask(taskTitle);
      },
    );
  }
}
