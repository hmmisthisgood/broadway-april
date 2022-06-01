import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import '../utils/log.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Database _db;
  List users = [];
  @override
  void initState() {
    super.initState();
    openAndCreateDAtabse();
    getUsers();
  }

  int _db_version = 1;
  openAndCreateDAtabse() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final dbName = "app.db";
    // final dbPath = docsDir.path + "/" + dbName;
    final dbPath = join(docsDir.path, dbName);
    _db = await openDatabase(
      dbPath,
      version: _db_version,
      onConfigure: (db) async {
        try {
          await db.execute('''
  CREATE TABLE IF NOT EXISTS users(
    id INTEGER NOT NULL PRIMARY KEY,
    username VARCHAR(20),
    age INTEGER,
    bio TEXT
  );
''');
        } catch (e) {
          print(e);
        }
      },
      onCreate: (db, version) {},
      onUpgrade: (db, oldversion, newversion) {},
      onDowngrade: (db, newVersion, oldVersion) {},
    );
  }

  addUser() async {
    try {
      final res = await _db.insert(
          "users", {"username": "iamTherock", "age": 50, "bio": "I am rock"});
      Log.i(res);
    } catch (e) {
      print(e);
    }
  }

  getUsers() async {
    try {
      final res = await _db.query("users");
      Log.e(res);
      users = res;
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  /// CRUD
  //  C:\Users\Desktop\
  /// /home/user/Desktop

  /// /data/223d3wdwdw/com.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        MaterialButton(
          onPressed: () {
            addUser();
            getUsers();
          },
          color: Colors.green,
          child: Text("Add me"),
        ),
        MaterialButton(
          onPressed: () {
            getUsers();
          },
          color: Colors.green,
          child: Text("Get users"),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (conext, index) {
                final _user = users[index];
                return Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${index + 1}  ${_user["username"]}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          InkWell(
                            child: Icon(
                              Icons.edit,
                              color: Colors.green,
                            ),
                            onTap: () {},
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                      Text(_user["age"].toString()),
                      Text(_user["bio"]),
                    ],
                  ),
                );
              }),
        )
      ]),
    );
  }
}
