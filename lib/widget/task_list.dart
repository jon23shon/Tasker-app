// ignore_for_file: prefer_const_constructors, unnecessary_import, avoid_print, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'package:Tasker/constant/color.dart';
import 'package:Tasker/model/task.dart';
// necessary imports for the functioning of the application

class TaskList extends StatelessWidget {
  final Task task;
  final TaskMod;
  final TaskDelete;
  const TaskList({Key? key, required this.task, this.TaskMod, this.TaskDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          bottom: 10,
        ),
        child: ListTile(
          onTap: () {
            TaskMod(task);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Color.fromARGB(255, 255, 255, 255),
          leading: Icon(
            task.complete ? Icons.check_box : Icons.check_box_outline_blank,
            color: tdBlue,
          ),
          //the check box used
          title: Text(
            task.textOnTask!,
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 15,
                decoration: task.complete ? TextDecoration.lineThrough : null),
            //task completion decoration
          ),
          trailing: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(vertical: 12),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color.fromARGB(255, 254, 0, 0),
            ),
            child: IconButton(
              icon: Icon(Icons.backspace),
              color: Color.fromARGB(255, 255, 255, 255),
              iconSize: 15,
              onPressed: () {
                TaskDelete(task.id);
                //task deletion
              },
            ),
          ),
        ));
  }
}
