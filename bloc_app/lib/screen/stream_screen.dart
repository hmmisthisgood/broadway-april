import 'dart:async';

import 'package:flutter/material.dart';

import '../widget/inherited_widget.dart';

class StreamScreen extends StatefulWidget {
  const StreamScreen({Key? key, this.envMode}) : super(key: key);
  final String? envMode;
  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  StreamController<int> streamController = StreamController.broadcast();
  int value = 0;
  Timer? customTimer;

  @override
  void initState() {
    super.initState();
    addDataInStream();
  }

  addDataInStream() {
    customTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      value = value + 2;
      // streamController.hashCode

      if (streamController.isClosed == false) {
        streamController.add(value);
      }
      if (value == 10) {
        // streamController.close();
        // timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    customTimer?.cancel();

    streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    final appEnv = AppEnv.of(context);
    final theme = Theme.of(context);
    final h1 = theme.textTheme.headline1;

    print(appEnv.envMode);
    return Scaffold(
      body: Center(
        child: StreamBuilder<int>(
          stream: streamController.stream,
          builder: (context, snapshot) {
            print(snapshot.connectionState.toString());
            if (snapshot.connectionState == ConnectionState.active) {
              final _data = snapshot.data;
              return Text(
                _data.toString(),
                style: h1!.copyWith(color: Colors.pink),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            return Text(snapshot.connectionState.toString());
          },
        ),
      ),
    );
  }
}
