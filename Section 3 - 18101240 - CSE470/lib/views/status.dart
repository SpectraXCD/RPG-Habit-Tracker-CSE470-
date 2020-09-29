import 'package:flutter/material.dart';
import '../models/user.dart';

class Status extends StatefulWidget {
  final User user;

  Status(this.user);

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  User get getUser => widget.user;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 10,
      child: Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.all(20),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'),
                radius: 50,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.user.name}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'LV: ',
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    '${widget.user.lvl}',
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'HP: ',
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    '${widget.user.currHp}/${widget.user.hp}',
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'XP: ',
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    '${widget.user.currExp}/${widget.user.exp}',
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
