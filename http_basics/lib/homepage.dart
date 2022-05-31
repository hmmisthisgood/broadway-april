import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as api;
import 'package:http_basics/model/post.dart';
import 'package:http_basics/screen/user_list_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String dataFromServer = "";

  List dataList = [];
  List<Post> postsList = [];
  bool isLoading = false;
  bool hasError = false;
  String error = "";

  String currentState = "pending"; // "success", "error"

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
    isLoading = true;
    setState(() {});

    api.get(url).then((response) {
      print("Status code: ${response.statusCode}");
      print(response.body);
      dataFromServer = response.body;

      final List decoded = json.decode(response.body); // List

      postsList = decoded.map((item) {
        var item1 = item as Map;
        // final convertedPost = Post.convertToDart(item);
        return Post.convertToDart(item);
      }).toList();

      // dataList = decoded;
      currentState = "success";
      isLoading = false;
      setState(() {});
    }).catchError((e, s) {
      print(e);
      print(s);
      isLoading = false;
      hasError = true;
      currentState = "error";
      error = e.toString();
      setState(() {});
    });
  }

  postDataToServer() {
    final endpoint = "https://jsonplaceholder.typicode.com/posts";

    final uri = Uri.parse(endpoint);

    api.post(uri,
        body: {"email": "email", "password": "password"},
        headers: {"Content-type": "application/json"});
  }

  @override
  void dispose() {
    super.dispose();
  }

  buildDataListViewWithMap() {
    return ListView.builder(
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
    );
  }

  buildPostsListViewWithPost() {
    return ListView.builder(
      itemCount: postsList.length,
      itemBuilder: (context, index) {
        final Post currentItem = postsList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: InkWell(
            onTap: () {
              /// CupertinoPageRoute
              /// MaterialPageRoute

              final route =
                  CupertinoPageRoute(builder: (_) => UsersListScreen());

              Navigator.push(context, route);
            },
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
                    "${index + 1}. " + currentItem.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(currentItem.body, style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildBody() {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    if (hasError) {
      return Center(child: Text(error));
    }

    return buildPostsListViewWithPost();
  }

  Widget buildBodyInDifferentWay() {
    if (currentState == "pending") {
      return Center(child: CircularProgressIndicator());
    }
    if (currentState == "error") {
      return Center(child: Text(error));
    }

    return buildDataListViewWithMap();
  }

  @override
  Widget build(BuildContext context) {
    print("build called");

    /// WillPopScope

    return WillPopScope(
      onWillPop: () async {
        print("back button pressed");
        return false;
      },
      child: Scaffold(body: buildBody()),
    );
  }
}
