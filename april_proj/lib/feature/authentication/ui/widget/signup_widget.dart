import 'package:boilerplate/common/constant/strings.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/textfield/common_textfield.dart';

class SignUpWidget extends StatefulWidget {
  SignUpWidget({Key? key}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
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
                    Strings.hey,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    Strings.welcomeToApp,
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
                  Strings.createAccount.toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                  child: Text(
                Strings.backToLogin,
                style: TextStyle(fontSize: 14),
              ))
            ],
          ),
        ),
      )),
    );
  }
}
