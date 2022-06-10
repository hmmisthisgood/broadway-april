import 'package:firebase_app/widget/full_screen_loading.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'widget/common_text_field.dart';

class NavProps {
  final String phone;
  final String email;

  NavProps({required this.phone, required this.email});
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool hidePassword = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneContoller = TextEditingController();
  String email = '';
  final formKey = GlobalKey<FormState>();
  FocusNode emailFocus = FocusNode();
  FocusNode phoneNoFocus = FocusNode();

  onLogin() async {
    FocusScope.of(context).unfocus();

    if (formKey.currentState != null) {
      formKey.currentState!.save();
      final isValid = formKey.currentState!.validate();
      if (!isValid) {
        // GestureDetector(
        //   onTap: () {
        //     print("Logged in");
        //   },
        //   child: Container(
        //     height: 48,
        //     // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        //     alignment: Alignment.center,

        //     decoration: BoxDecoration(
        //         color: Colors.purple,
        //         borderRadius: BorderRadius.circular(10)),
        //     child: Text(
        //       "Sign in",
        //       style: TextStyle(color: Colors.white, fontSize: 18),
        //     ),
        //   ),
        // )
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// used for emulating content on the bottom
                // SizedBox(height: 350),
                // Text("Email"),
                CommonTextField(
                  focusNode: emailFocus,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  hintText: "Enter your email",
                  prefixIcon: Icon(Icons.email),
                ),

                SizedBox(height: 15),
                CommonTextField(
                  controller: passwordController,
                  obscureText: hidePassword,
                  validator: (val) {
                    if (val == null) {
                      return "Password must be valid";
                    }

                    if (val.length < 8) {
                      return "Password must be 8 characters long";
                    }
                  },
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: InkWell(
                      onTap: () {
                        hidePassword = !hidePassword;
                        setState(() {});
                      },
                      child: Icon(hidePassword == true
                          ? Icons.visibility
                          : Icons.visibility_off)),
                ),

                SizedBox(height: 15),

                MaterialButton(
                  onPressed: onLogin,
                  color: Colors.purple,
                  minWidth: 200,
                  height: 48,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
