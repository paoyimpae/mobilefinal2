import 'package:flutter/material.dart';
import './login.dart';
import './dbhelper.dart';

class Profile extends StatefulWidget {
  @override
  ProfileState createState() {
    return ProfileState();
  }
}

class ProfileState extends State<Profile> {
  final _formkey = GlobalKey<FormState>();
  String userID;
  String name;
  String age;
  String password;

  // Ref : https://stackoverflow.com/questions/24085385/checking-if-string-is-numeric-in-dart
  bool isNumeric(String s) {
  if(s == null) {
    return false;
  }
    return double.parse(s, (e) => null) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
          Text("Profile")

      ),
      body: 
      Container(
        padding: EdgeInsets.all(40.0),
        child:Form(
        key: _formkey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "User Id",
                hintText: "กรุณา ระบุ User id",
                icon: Icon(Icons.person),
              ),
              keyboardType: TextInputType.text,
              validator: (value) {
                userID = value;
                if (value.length > 12 || value.length < 6) {
                  return 'User Id ต้องมีความยาวอยู่ในช่วง 6 - 12 ตัวอักษร';
                }
                if (value.isEmpty) {
                  return 'กรุณาระบุข้อมูลให้ครบถ้วน';
                }
                else if (value == "admin") {
                  return 'user นี้มีอยู่ในระบบแล้ว';
                } 
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Name",
                hintText: "กรุณา ระบุ Name",
                icon: Icon(Icons.account_circle),
              ),
              keyboardType: TextInputType.text,
              onSaved: (value) => print(value),
              validator: (value) {
                name = value;
                if (' '.allMatches(value).length != 1) {
                  return 'Name ต้องคั่นด้วย space 1 space เท่านั้น';
                }
                if (value.isEmpty) {
                  return 'กรุณาระบุข้อมูลให้ครบถ้วน';
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Age",
                hintText: "กรุณา ระบุ Age",
                icon: Icon(Icons.date_range),
              ),
              keyboardType: TextInputType.number,
              onSaved: (value) => print(value),
              validator: (value) {
                age = value;
                if (!isNumeric(value) || int.parse(value) < 10 || int.parse(value) > 80) {
                  return 'Age ต้องเป็นตัวเลขเท่านั้นและอยู่ในช่วง 10 - 80';
                }
                if (value.isEmpty) {
                  return 'กรุณาระบุข้อมูลให้ครบถ้วน';
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "กรุณา ระบุ password",
                icon: Icon(Icons.lock),
              ),
              obscureText: true,
              keyboardType: TextInputType.text,
              onSaved: (value) => print(value),
              validator: (value) {
                password = value;
                if (value.length < 6) {
                  return 'Password มีความยาวมากกว่า 6';
                }
                if(value.isEmpty) {
                  return 'กรุณาระบุข้อมูลให้ครบถ้วน';
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Quote",
                hintText: "กรุณา ระบุ Quote",
                icon: Icon(Icons.text_fields),
                hintMaxLines: 10
              ),
              keyboardType: TextInputType.multiline,
              onSaved: (value) => print(value),
              validator: (value) {
                name = value;
                if (value.isEmpty) {
                  return 'กรุณาระบุข้อมูลให้ครบถ้วน';
                }
              },
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    
                    ButtonTheme( 
                      child: RaisedButton( 
                        child: Text('Save'),
                        textColor: Colors.white,
                        onPressed: () {
                         
                          if ( _formkey.currentState.validate() && userID != "" && name != "" && age != "" && password != "") {
                              User user = User();
                              user.userID = userID;
                              user.name = name;
                              user.age = int.parse(age);
                              user.password = password;
                              DataBaseHelper databaseHelper = DataBaseHelper();
                              databaseHelper.addUserDB(user);

                              Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                          }
                          else if (userID.isEmpty && name.isEmpty && age.isEmpty && password.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: new Text("ข้อความแจ้งเตือน"),
                                  content: new Text("กรุณาระบุข้อมูลให้ครบถ้วน"),
                                  actions: <Widget>[
                                    new FlatButton(
                                      child: new Text("ปิด"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                          
                        },
                      )
                    ),
                  ],
                )   
              ],
            )
          ],
        ),
      ),
      )
    );
  }
}