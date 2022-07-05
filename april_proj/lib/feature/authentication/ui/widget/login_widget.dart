import 'package:boilerplate/common/constant/strings.dart';
import 'package:flutter/material.dart';

import '../../../../common/route/routes.dart';
import '../../../../common/widget/textfield/common_textfield.dart';

class LoginWidget extends StatefulWidget {
  LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool hidePassword = true;

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.hello,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    Strings.welcomeBack,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 60),
              CommonTextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                hintText: Strings.emailHint,
                label: Strings.emailLabel.toUpperCase(),
              ),
              SizedBox(height: 15),
              CommonTextField(
                controller: passwordController,
                obscureText: hidePassword,
                label: Strings.passwordLabel.toUpperCase(),
                validator: (val) {
                  if (val == null) {
                    return Strings.passwordMustBeValid;
                  }

                  if (val.length < 8) {
                    return Strings.passwordLegthValid;
                  }
                },
                suffixIcon: InkWell(
                  onTap: () {
                    hidePassword = !hidePassword;
                    setState(() {});
                  },
                  child: Text(
                    hidePassword == true ? Strings.show : Strings.hide,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    Strings.forgotPassword,
                    style: TextStyle(color: Colors.black45),
                  )),
              SizedBox(
                height: 70,
              ),
              MaterialButton(
                onPressed: () {},
                color: Colors.blue,
                minWidth: double.infinity,
                height: 48,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  Strings.loginText.toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                  child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.signup);
                },
                child: Text(
                  Strings.createAccount,
                  style: TextStyle(fontSize: 14, color: Colors.black45),
                ),
              ))
            ],
          ),
        ),
      )),
    );
  }
}
