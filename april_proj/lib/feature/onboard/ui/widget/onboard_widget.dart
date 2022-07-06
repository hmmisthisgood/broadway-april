import 'package:boilerplate/common/constant/assets.dart';
import 'package:boilerplate/common/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../../common/route/routes.dart';

class OnboardWidget extends StatelessWidget {
  final pages = [
    PageViewModel(
      title: Strings.ob1Title,
      body: Strings.ob1Des,
      image: Image.asset(Assets.ob1),
    ),
    PageViewModel(
      title: Strings.ob2Title,
      body: Strings.ob2Des,
      image: Image.asset(Assets.ob2),
    ),
    PageViewModel(
      title: Strings.ob3Title,
      body: Strings.ob3Des,
      image: Image.asset(Assets.ob3),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        pages: pages,
        showBackButton: true,
        showSkipButton: false,
        showNextButton: true,
        back: const Text("Previous",
            style: TextStyle(fontWeight: FontWeight.w600)),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        next: const Text("Next", style: TextStyle(fontWeight: FontWeight.w600)),
        onDone: () {
          Navigator.pushNamed(context, Routes.login);
        },
      ),
    );
  }
}
