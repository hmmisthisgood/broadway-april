import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class AnimContainerScreen extends StatefulWidget {
  const AnimContainerScreen({Key? key}) : super(key: key);

  @override
  State<AnimContainerScreen> createState() => _AnimContainerScreenState();
}

class _AnimContainerScreenState extends State<AnimContainerScreen> {
  double _radius = 2.0;
  double _padding = 20;
  Color _color = Colors.red;
  double _height = 200;
  double _width = 300;
  double _opac = 0.0;

  bool switchWidget = false;

  // BoxShape shape = BoxShape.rectangle;
  final image =
      "https://cdn.pixabay.com/photo/2022/06/12/20/18/flower-7258778_1280.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedContainer(
                // height: 30,
                height: _height,
                width: _width,
                padding: EdgeInsets.all(_padding),
                decoration: BoxDecoration(
                  color: _color,
                  // shape: shape,
                  borderRadius: BorderRadius.circular(_radius),
                ),
                duration: Duration(milliseconds: 2000),
                curve: Curves.ease,
                child: Center(child: Text("Some random text here ")),
              ),
              SizedBox(height: 10),
              // AnimatedOpacity(
              //     opacity: _opac,
              //     duration: Duration(milliseconds: 2000),
              //     child: Image.network(image)),

              AnimatedSwitcher(
                duration: Duration(milliseconds: 2000),
                child: switchWidget
                    ? Text(
                        "I am switching",
                        style: TextStyle(fontSize: 20),
                      )
                    : Text(
                        "not wrong",
                        style: TextStyle(fontSize: 20),
                      ),
              ),
              MaterialButton(
                onPressed: () {
                  _radius = 50;
                  _color = Colors.orange;
                  _height = 300;
                  _width = 150;
                  // shape = BoxShape.circle;
                  _opac = 0.5;
                  switchWidget = true;

                  setState(() {});
                },
                color: Colors.green,
                child: Text(
                  "Animate Container",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ]),
      ),
    );
  }
}


/// AnimatedContainer 
/// AnimatedOpacity
/// AnimatedSwitcher