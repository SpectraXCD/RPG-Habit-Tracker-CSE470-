import 'package:flutter/material.dart';
import '../models/task.dart';
import '../views/addNewTask.dart';
import '../models/user.dart';
//import '../views/status.dart';

class PlayerTasks extends StatefulWidget {
  final User user;
  //Function addNewTask;

  PlayerTasks(this.user);

  void addTaskTest(List<Task> t, String tname, String diff) {
    var newTask = Task(taskName: tname, difficulty: diff);
    t.add(newTask);
  }

  void deleteTaskTest(List<Task> t, User u, String diff, int index) {
    var multiplier = 1.0;
    switch (diff) {
      case 'Very Easy':
        multiplier = 0.5;
        break;
      case 'Easy':
        multiplier = 0.667;
        break;
      case 'Hard':
        multiplier = 1.5;
        break;
      case 'Very Hard':
        multiplier = 2.0;
        break;
    }

    u.currHp -= (100 * multiplier).floor();
    t.removeAt(index);
  }

  void completeTaskTest(List<Task> t, User u, String diff, int index) {
    var multiplier = 1.0;
    switch (diff) {
      case 'Very Easy':
        multiplier = 0.5;
        break;
      case 'Easy':
        multiplier = 0.667;
        break;
      case 'Hard':
        multiplier = 1.5;
        break;
      case 'Very Hard':
        multiplier = 2.0;
        break;
    }

    u.currExp += (100 * multiplier).floor();
    if (u.currExp >= u.exp) {
      u.lvl += 1;
      u.currExp = u.currExp - u.exp;
    }
    t.removeAt(index);
  }

  @override
  _PlayerTasksState createState() => _PlayerTasksState();
}

class _PlayerTasksState extends State<PlayerTasks> {
  List<Task> tasks = [];
  User user;

  void addTask(String tname, String diff) {
    var newTask = Task(taskName: tname, difficulty: diff);

    setState(() {
      tasks.add(newTask);
    });
  }

  void deleteTask(User u, String diff, int index) {
    var multiplier = 1.0;
    switch (diff) {
      case 'Very Easy':
        multiplier = 0.5;
        break;
      case 'Easy':
        multiplier = 0.667;
        break;
      case 'Hard':
        multiplier = 1.5;
        break;
      case 'Very Hard':
        multiplier = 2.0;
        break;
    }

    setState(() {
      u.currHp -= (100 * multiplier).floor();
      tasks.removeAt(index);
    });
  }

  void completeTask(User u, String diff, int index) {
    var multiplier = 1.0;
    switch (diff) {
      case 'Very Easy':
        multiplier = 0.5;
        break;
      case 'Easy':
        multiplier = 0.667;
        break;
      case 'Hard':
        multiplier = 1.5;
        break;
      case 'Very Hard':
        multiplier = 2.0;
        break;
    }

    setState(() {
      u.currExp += (100 * multiplier).floor();
      if (u.currExp >= u.exp) {
        u.lvl += 1;
        u.currExp = u.currExp - u.exp;
      }
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    user = widget.user;
    //widget.addNewTask = addTask;

    return Column(
      children: [
        AddTask(addTask),
        Container(
          height: 350,
          width: 400,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                elevation: 10,
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.check),
                      onPressed: () =>
                          completeTask(user, tasks[index].difficulty, index),
                    ),
                    IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () =>
                          deleteTask(user, tasks[index].difficulty, index),
                    ),
                    Text(tasks[index].taskName),
                  ],
                ),
              );
            },
            itemCount: tasks.length,
          ),
        ),
      ],
    );
  }
}
