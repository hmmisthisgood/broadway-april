import 'package:bloc_app/bloc/video_cubit.dart';
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
    return BlocProvider(
        create: (_) => VideoCubit(),
        child: MaterialApp(
          home: Homepage(),
          theme: ThemeData(primarySwatch: Colors.pink),
        ));
  }
}
