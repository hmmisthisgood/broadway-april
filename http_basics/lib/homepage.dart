import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as api;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String dataFromServer = "";

  List dataList = [];

  @override
  void initState() {
    super.initState();

    print("init state called");
    fetchDataFromServer();
  }

  fetchDataFromServer() {
    final endpoint = "https://jsonplaceholder.typicode.com/posts";

    print("I am fetching data from server");

    final url = Uri.parse(endpoint);
    // int.parse("20") // 20
    // double.parse("abc")// 20.0
    // DateTime.parse(formattedString)

    api.get(url).then((response) {
      print("Status code: ${response.statusCode}");
      print(response.body);
      dataFromServer = response.body;

      final decoded = json.decode(response.body);
      dataList = decoded;
      setState(() {});
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build called");

    return Scaffold(
        body: ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        final currentItem = dataList[index] as Map;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.red.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.red.withOpacity(0.3),
                      spreadRadius: 4,
                      blurRadius: 5,
                      offset: Offset(3, 3))
                ]),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${index + 1}. " + currentItem["title"],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(currentItem["body"], style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
        );
      },
    ));
  }
}
