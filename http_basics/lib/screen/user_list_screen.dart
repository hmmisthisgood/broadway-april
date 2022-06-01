import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpClient;

import '../model/user.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({Key? key}) : super(key: key);

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  fetchUsers() async {
    try {
      final endpoint = "https://jsonplaceholder.typicode.com/users";
      final uri = Uri.parse(endpoint);
      final response = await httpClient.get(uri);

      final List decoded = json.decode(response.body);

      final List<User> tempUsers = decoded.map<User>((e) {
        return User.convertFromJson(e);
      }).toList();

      users = tempUsers;

      // []
      // users.addAll(tempUsers);
      final newList = [...users];

      /// ... = spread operatore

      // users.clear();
      final user1 = tempUsers[0];
      // final userName = user1.company?.name;
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
