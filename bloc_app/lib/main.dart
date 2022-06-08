import 'package:bloc_app/bloc/video_cubit.dart';
import 'package:bloc_app/widget/inherited_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screen/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppEnv(
      envMode: "dev",
      baseUrl: "https://dev.example.com/api",
      someCredntials: "awegggggggggggggggggggggggggggg",
      child: BlocProvider(
          create: (_) => VideoCubit(),
          child: MaterialApp(
            home: Homepage(
              envMode: "dev",
            ),
            theme: ThemeData(primarySwatch: Colors.pink),
          )),
    );
  }
}
