import 'package:flutter/material.dart';
import 'package:mobilefinal2/home.dart';
import 'package:mobilefinal2/login.dart';
import 'package:mobilefinal2/profile.dart';
import 'package:mobilefinal2/register.dart';
import 'package:mobilefinal2/friend.dart';
import 'todo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Final 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     initialRoute: "/",
      routes: {
        "/": (context) => Login(),
        "/register": (context) => Register(),
        "/home": (context) => Home(),
        "/profile": (context) => Profile(),
        "/friend": (context) => Friend(),
        "/todo": (context) => Todo(0, 'test'),
      },
    );
  }

}
