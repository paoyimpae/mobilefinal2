import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io' as io;

class User {
  String userID;
  String name;
  int age;
  String password;
  User();
}

class DataBaseHelper {
  final String tableName = "User";
  static Database dbInstance;
  Future<Database> get db async {
    if (dbInstance == null) {
      dbInstance = await initDB();
    }
    return dbInstance;
  }
  initDB() async{
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "user.db");
    var db  = await openDatabase(path, version: 1, onCreate: createTableDB);
    return db;
  }

  void createTableDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $tableName(
      `id` INTEGER PRIMARY KEY AUTOINCREMENT,
      `userID` TEXT NOT NULL, 
      `name` TEXT NOT NULL,
      `age` INTEGER NOT NULL,
      `password` TEXT NOT NULL
    )
    ''');
  }
  
  Future<List<User>> getUserDB() async {
    var dbConnection = await db;
    List<Map> list = await dbConnection.rawQuery('SELECT * FROM $tableName');
    List<User> users = new List();
    for(int i = 0; i < list.length; i++) {
      User user = new User();
      user.userID = list[i]['userID'];
      user.name = list[i]['name'];
      user.age = list[i]['age'];
      user.password = list[i]['password'];
      users.add(user);
    }
    return users;
  }

  void addUserDB(User user) async{
    var dbConnection = await db;
    String query = 'INSERT INTO $tableName (`userID`, `name`, `age`, `password`) VALUES(\'${user.userID}\', \'${user.name}\', ${user.age}, \'${user.password}\')';
    await dbConnection.transaction((transaction) async{
      return await transaction.rawQuery(query);
    });
  }

  void updateTodoDB(User user, int id) async{
    var dbConnection = await db;
    String query = "UPDATE $tableName SET `userID`=${user.userID}, `name`=${user.name}, `age`${user.age}, `password`=${user.password} WHERE `id`=$id";
    await dbConnection.transaction((transaction) async{
      return await transaction.rawQuery(query);
    });
  }
}