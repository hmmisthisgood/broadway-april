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
  List<Map> users = [];
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

      /// _db.rawQuery("SELECT * FROM users WHERE id=1");
      Log.e(res);
      users = res;
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  deleteUser(int userId) async {
    try {
      await _db.delete("users", where: "id=?", whereArgs: [userId]);
    } catch (e) {
      print(e);
    }
  }

  updateUser(newUser) async {
    try {
      await _db
          .update("users", newUser, where: 'id=?', whereArgs: [newUser["id"]]);
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  /// CRUD
  //  C:\Users\Desktop\
  /// /home/user/Desktop

  showEditDialog(BuildContext context, Map user) {
    final nameController = TextEditingController(text: user['username']);
    final ageController = TextEditingController(text: user['age'].toString());
    final bioController = TextEditingController(text: user['bio']);

    showDialog(
        context: context,
        // barrierDismissible: false,
        barrierColor: Colors.red.withOpacity(0.2),
        builder: (context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                  ),
                  TextField(
                    controller: ageController,
                  ),
                  TextField(
                    controller: bioController,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      await updateUser({
                        "id": user["id"],
                        "username": nameController.text,
                        "age": int.parse(ageController.text),
                        "bio": bioController.text
                      });
                      getUsers();
                      Navigator.pop(context);
                    },
                    color: Colors.blue,
                    child: Text("Submit"),
                  )
                ],
              ),
            ),
          );
        });
  }

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
                            "${_user["id"]}  ${_user["username"]}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          InkWell(
                            child: Icon(
                              Icons.edit,
                              color: Colors.green,
                            ),
                            onTap: () {
                              showEditDialog(context, _user);
                            },
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onTap: () {
                              deleteUser(_user["id"]);
                              getUsers();
                            },
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
