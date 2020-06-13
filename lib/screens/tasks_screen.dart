import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/tasks_list.dart';
import '../screens/add_task_screen.dart';
import '../models/tasklist.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () {
          // Slide up bottom sheet to add new task
          showModalBottomSheet(
            context: context,
//            // Force Modal BottomSheet to fill the screen
//            isScrollControlled: true,
//            builder: (context) => AddTaskScreen(),

            // AddTaskScreen sits just above the keyboard
            // Use MediaQuery to determine spacing at the bottom
            builder: (context) => SingleChildScrollView(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddTaskScreen((newTaskTitle) {
                setState(() {
                  // Add new task to list
//                  tasks.add(Task(name: newTaskTitle));
                  Provider.of<TaskList>(context, listen: false).addNewTask(taskTitle: newTaskTitle);
                });
                // Dismiss the BottomSheet
                Navigator.pop(context);
              }),
            ),

            // Transparency allows the background grey to show through,
            // then the Container in AddTaskScreen can have rounded corners.
            // Much nicer than the hack in the video.
//            backgroundColor: Colors.transparent,

            // Even better:
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30.0),
              ),
            ),
          );
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      color: Colors.lightBlueAccent,
                      size: 35,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    Provider.of<TaskList>(context).tasks.length.toString() +
                        ((Provider.of<TaskList>(context).tasks.length == 1) ? ' task' : ' tasks'),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: TasksList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
