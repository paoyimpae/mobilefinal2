import 'package:flutter/material.dart';
import './profile.dart';
import './friend.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( 
        child:Container(
        padding: EdgeInsets.only(top: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(''),
            Text('Hello Firstname Lastname'
            ,style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold
            ),),
            Text(''),
            Text('this is my quote "today is my day"'),
            Text(''),
            Container(
              width: 300,
              child:FlatButton( 
                child: Text('PROFILE SETUP'),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {   
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Profile()));
                }
              ),
            ),
            Text(''),
            Container(
              width: 300,
              child:FlatButton(
                child: Text('MY FRIENDS'),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {   
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Friend()));
                }
              ),
            ),
            Text(''),
            Container(
              width: 300,
              child:FlatButton(
                child: Text('SIGN OUT'),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {   
                  
                }
              ),
            )
            ]
            )
          
      )
      )
    );
  }
}