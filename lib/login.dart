import 'package:flutter/material.dart';
import './home.dart';
import './dbhelper.dart';
import './register.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() {
    return LoginState();
  }
}

Future<List<User>> getUserDB() async {
  DataBaseHelper databaseHelper = DataBaseHelper();
  Future<List<User>> lists = databaseHelper.getUserDB();
  return lists;
}

class LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  String username;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: new Container(
            
            child: 
            Container(
              padding: EdgeInsets.all(40.0),
              child:
            Form(
              key: _formkey,
              child: 
              ListView(
                children: <Widget>[
                  Image.network(
                    "https://avatars1.githubusercontent.com/u/32716479?s=460&v=4", 
                    width: 150,
                    height: 150,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "User Id",
                      hintText: "กรุณาใส่ User Id",
                      icon: Icon(Icons.person),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      username = value;
                      if(value.isEmpty) {
                        return 'please fill out this form';
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "กรุณาใส่ Password",
                      icon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    onSaved: (value) => print(value),
                    validator: (value) {
                      password = value;
                      if(value.isEmpty) {
                        return 'please fill out this form';
                      }
                    },
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                      child:RaisedButton(
                        child: Text('LOGIN'),
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: () {   
                          _formkey.currentState.validate();
                          // if ( _formkey.currentState.validate()) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                            // Future<List<User>> lists = getUserDB();
                            // Future isValid(String userid, String password) async {
                            //   var allMember = await lists;
                            //   for (var i = 0; i < allMember.length; i++) {
                            //     if (username == allMember[i].userID && password == allMember[i].password) {
                            //       print("Valid");
                            //       Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                            //       break;
                            //     }
                            //   }
                              // await isValid(username, password);
                            
                              
                          // }
                          // }
                          // else if (username.isEmpty || password.isEmpty) {
                          //   showDialog(
                          //     context: context,
                          //     builder: (BuildContext context) {
                          //       return AlertDialog(
                          //         title: new Text("ข้อความแจ้งเตือน"),
                          //         content: new Text("กรุณา ระบุ user id or password"),
                          //         actions: <Widget>[
                          //           new FlatButton(
                          //             child: new Text("ปิด"),
                          //             onPressed: () {
                          //               Navigator.of(context).pop();
                          //             },
                          //           ),
                          //         ],
                          //       );
                          //     },
                          //   );
                          // }
                          // else {
                          //   showDialog(
                          //     context: context,
                          //     builder: (BuildContext context) {
                          //       return AlertDialog(
                          //         title: new Text("ข้อความแจ้งเตือน"),
                          //         content: new Text("user or password ไม่ถูกต้อง"),
                          //         actions: <Widget>[
                          //           new FlatButton(
                          //             child: new Text("ปิด"),
                          //             onPressed: () {
                          //               Navigator.of(context).pop();
                          //             },
                          //           ),
                          //         ],
                          //       );
                          //     },
                          //   );
                          // }
                        },
                      ),
                      )
                    ] 
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        child: new Text(
                          "Register New Account",
                          style: new TextStyle(
                            color: Colors.blue,
                            fontSize: 10.0,
                            letterSpacing: 0.1,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                        },
                      )   
                    ],
                  )
                ],
              ),
            ),
            ),
          ),
        ),
    );
    
  }
}