import 'package:first_app/utils/shared_pref.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class ListWithBuilderScreen extends StatelessWidget {
  final String username;
  final String phoneNumber;
  ListWithBuilderScreen({required this.username, required this.phoneNumber});

  final List<String> countries = [
    "Nepal",
    "china",
    "US",
    "UK",
    "Australia",
    "Austria",
    "France",
    "Brazil",
    "India",
    "Canada",
    "Finland",
    "Bhutan",
    "Germany",
    "Afghanistan",
    "Mongolia",
    "Italy"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(username),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(phoneNumber, fit: BoxFit.cover),
            ),
          )
          // automaticallyImplyLeading: false,
          ),
      body: ListView.builder(
        itemCount: countries.length,
        // separatorBuilder: (context, index) {
        //   return Divider(
        //     color: Colors.black,
        //   );
        // },
        itemBuilder: (context, index) {
          final currentCountry = countries[index];

          return InkWell(
            onTap: () {
              SharedPref.logout();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("${index + 1}. $currentCountry"),
            ),
          );
        },
      ),
    );
  }
}
