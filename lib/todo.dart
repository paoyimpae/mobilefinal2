
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:mobilefinal2/todo.dart'; 
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import './profile.dart';

class Todo extends StatefulWidget {
  @override
  TodoState createState() {
    return TodoState();
  }
}
  

class TodoState extends State<Todo> {
  List<Todo> users;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( 
        child:Container(
        padding: EdgeInsets.only(top: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(''),
            Container(
              width: 300,
              child:FlatButton(
                child: Text('BACK'),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {   
                  Navigator.pop(context);
                }
              ),
            ),
            Text(''),
            SizedBox(
              width: 300,
              height: 450,
              child:  FutureBuilder<List<Users>> (
                future: fetchPosts(http.Client()),
                builder: (context, snapshot) {
                  if(snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData 
                  ? ListViewUsers(users: snapshot.data)
                  : Center(child: CircularProgressIndicator());
                },
              )     
                
            )
            ]
            )
          
      )
      )
    );
  }
}

class ListViewUsers extends StatelessWidget {
  final List<Users> users;
  ListViewUsers({Key key, this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      child: SizedBox(
        width: 200,
        height: 200,
        child:
          ListView.builder(
            itemBuilder: (BuildContext context, int position) {
              return Column(children: <Widget>[
                Divider(height: 5.0,),
                FlatButton(
                   child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                   Text('${users[position].id} : ${users[position].name}'),
                   Text('${users[position].email}'),
                   Text('${users[position].phone}'),
                   Text('${users[position].website}'),
                   ]),
                   onPressed: () => _onTapItem(context, users[position].id, users[position].name),
                ),
              ],);
            },
            itemCount: users.length,
            padding: const EdgeInsets.all(15.0),
        ) 
      )
    );
  }
  void _onTapItem(BuildContext context, int position, String name) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Todo(position, name)));
  }
}