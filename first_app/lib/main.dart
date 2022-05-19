import 'package:first_app/grid_view_screen.dart';
import 'package:first_app/page_view_screen.dart';
import 'package:first_app/row_columns.dart';
import 'package:first_app/stack_screen.dart';
import 'package:first_app/tab_screen.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:first_app/image_screen.dart';

import 'list_view_with_builder.dart';
import 'list_views.dart';

void main() {
  runApp(OurApp());
}

//

enum Types { ASSET, NETWORK, FILE, MEMEORY }

class OurApp extends StatelessWidget {
  final redColor = Colors.red;
  final whiteHex = Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    // final whiteRgb = Color.fromRGBO(r, g, b, opacity);

    return MaterialApp(title: "Our app", home: StackScreen()
        //  RowAndColumns(),
        );
  }
}

/// List of widgets 

/// Basic widgets : 
/// 1. Container 
/// 2. Column 
/// 3. Row 
/// 
/// 4. Stack 
/// 
/// 5. Center 

/// Scroll: 
/// 1. ListView 
/// 2. GridView 
/// 3. SingleChildScrollView

/// UI: 
/// 1. Text 
/// 2. Image 
/// 3. Icon 
/// 4. Button 

/// Spacing: 
/// 1. Padding 
/// 2. Margin 
/// 3. SizedBox 