// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_task/screen/homepage.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'my tasker',
      home: Homepage(),
      theme: ThemeData(primarySwatch: Colors.grey),
    );
  }
}

  // This widget is the root of your application.
