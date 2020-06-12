import 'package:flutter/material.dart';
import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallback;

  AddTaskScreen(this.addTaskCallback);

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;

    return Container(
      padding: EdgeInsets.only(top: 10, left: 30, right: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 20,
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 5),
              isDense: true,
              hintText: 'Enter your new task here',
              hintStyle: TextStyle(
                color: Colors.black54,
              ),
            ),
            onChanged: (newText) {
              // Get new task from user
              newTaskTitle = newText;
            },
          ),
          FlatButton(
            padding: EdgeInsets.symmetric(horizontal: 40),
            color: Colors.lightBlueAccent,
            onPressed: () {
              // Add new task to tasks list
              addTaskCallback(newTaskTitle);
            },
            child: Text(
              'Add',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
