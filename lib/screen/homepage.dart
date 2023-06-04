// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names, sized_box_for_whitespace, sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:Tasker/constant/color.dart';
import 'package:Tasker/model/task.dart';
import 'package:Tasker/widget/task_list.dart';
// necessary imports for the functioning of the application

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TasksList = Task.taskList();
  final taskManager = TextEditingController();
  List<Task> findTask = [];

  @override
  void initState() {
    findTask = TasksList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tBGGrey,
      appBar: buildAppBar(),
      body: Stack(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(children: [
            search(), //user search input
            Expanded(
                child: ListView(
              //tasks list
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40, bottom: 10),
                  child: Text(
                    'Tasks',
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
                  ),
                ),
                for (Task taskk in findTask
                    .reversed) //when new task is created its at the top of the list
                  TaskList(
                    task: taskk,
                    TaskMod: theTaskMod,
                    TaskDelete: thetaskDelete,
                  ),
              ],
            ))
          ]),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10, bottom: 10, right: 10),
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 131, 131, 131),
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: taskManager,
                      decoration: InputDecoration(
                          hintText: 'Create new tasks',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  //button that adds tasks to the screen
                  child: ElevatedButton(
                    child: Text(
                      '➕',
                      style: TextStyle(
                        fontSize: 35,
                      ),
                    ),
                    onPressed: () {
                      theTaskAdd(taskManager.text);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 226, 118, 118),
                      minimumSize: Size(10, 10),
                      elevation: 10,
                    ),
                  ),
                ),
              ],
            )),
      ]),
    );
  }

  //top part of the application
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: tBGGrey,
      elevation: 0,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Icon(
          Icons.menu,
          color: tdRed,
          size: 35,
        ),
        Text('Tasker'),
        Container(
          width: 20,
          height: 20,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(image: AssetImage('assets/Tasker_Logo.svg'))),
        ),
      ]),
    );
  }

  //funtion to show that task is complete
  void theTaskMod(Task task) {
    setState(() {
      task.complete = !task.complete;
    });
  }

  //function to delete tasks from the screen
  void thetaskDelete(String id) {
    setState(() {
      TasksList.removeWhere((item) => item.id == id);
    });
  }

  //funtion to add the tasks to the screen and making them unique
  void theTaskAdd(String task) {
    setState(() {
      TasksList.add(
          Task(id: DateTime.now().second.toString(), textOnTask: task));
    });
    taskManager.clear();
  }

  //funtion for the tasks to match user input for the search
  void filterTask(String userInput) {
    List<Task> results = [];
    if (userInput.isEmpty) {
      results = TasksList;
    } else {
      results = TasksList.where((item) =>
              item.textOnTask!.toLowerCase().contains(userInput.toLowerCase()))
          .toList();
    }
    setState(() {
      findTask = results;
    });
  }

  // widget code for the searchbar on the screen
  Widget search() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(25)),
              child: TextField(
                onChanged: (value) => filterTask(value),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 20,
                    ),
                    prefixIconConstraints:
                        BoxConstraints(maxHeight: 20, minWidth: 25),
                    border: InputBorder.none,
                    hintText: 'look for task',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 208, 192, 192))),
              ))
        ],
      ),
    );
  }
}
