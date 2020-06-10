import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  // Now changed to a Stateless Widget
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;

  TaskTile({this.isChecked, this.taskTitle, this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    // See also CheckboxListTile class
    return ListTile(
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
    );
  }
}
