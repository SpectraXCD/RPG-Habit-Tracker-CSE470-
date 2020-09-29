import 'package:flutter/material.dart';
import 'models/user.dart';
import 'views/addNewTask.dart';

import 'views/status.dart';
import 'controllers/playerTasks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RPG Habit Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'RPG Habit Tracker (CSE470)'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  User user = User(name: 'Nahiyan');
  PlayerTasks playerTasks;
  @override
  Widget build(BuildContext context) {
    playerTasks = PlayerTasks(user);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            //AddTask(),
            Status(user),
            playerTasks,
          ],
        ),
      ),
      //floatingActionButton: AddTask(playerTasks.addNewTask),
    );
  }
}
