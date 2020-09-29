import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  final taskNameController = TextEditingController();
  final difficultyController = TextEditingController();
  final descController = TextEditingController();

  String taskName;
  String difficulty = 'Normal';
  String desc;

  Function addNewTask;

  AddTask(this.addNewTask);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 160,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Enter task name'),
              controller: taskNameController,
              onChanged: (value) => taskName = value,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Select task difficulty'),
                DropdownButton<String>(
                  value: difficulty,
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newValue) {
                    difficultyController.text = newValue;
                  },
                  items: <String>[
                    'Very Easy',
                    'Easy',
                    'Normal',
                    'Hard',
                    'Very Hard'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            // TextField(
            //   decoration: InputDecoration(
            //       labelText: 'Task description (Optional)'),
            //   controller: descController,
            //   onChanged: (value) => desc = value,
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  child: Text('Confirm'),
                  onPressed: () {
                    addNewTask(taskName, difficulty);
                    //Navigator.pop(context);
                    //descController.clear();
                    taskNameController.clear();
                  },
                ),
                RaisedButton(
                  child: Text('Discard'),
                  onPressed: () {
                    //Navigator.pop(context);
                    taskNameController.clear();
                    difficultyController.text = "Normal";
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
