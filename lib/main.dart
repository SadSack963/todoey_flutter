import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/tasks_screen.dart';
import './models/tasklist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskList>(
      create: (context) => TaskList(),
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
