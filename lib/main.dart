import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/tasks_screen.dart';
import './models/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provide data to all children in the tree (below this point) which want to listen
    return ChangeNotifierProvider<TaskData>(
      // <TaskData> is the Class
      create: (context) => TaskData(), // TaskData() is the Object
      child: MaterialApp(
        title: 'Todoey',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TasksScreen(),
      ),
    );
  }
}
