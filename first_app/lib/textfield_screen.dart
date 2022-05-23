import 'package:flutter/material.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({Key? key}) : super(key: key);

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
// Form
// TextField
// TextFormField
  bool hidePassword = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneContoller = TextEditingController();
  String email = '';
  final formKey = GlobalKey<FormState>();
  FocusNode emailFocus = FocusNode();
  FocusNode phoneNoFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          // color: Colors.black,
          child: Form(
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
                    TextFormField(
                      autofocus: true,
                      focusNode: emailFocus,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (val) {
                        phoneNoFocus.requestFocus();
                      },
                      onChanged: (val) {
                        print(val);
                        email = val;
                      },
                      // onSubmitted: (val) {
                      //   print("submitted this: $val");
                      // },
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                        // label: Text("Email"),
                        // labelText: "Email",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.email),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0.5, color: Colors.green),
                            borderRadius: BorderRadius.circular(14)),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.disabled,
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
                      decoration: InputDecoration(
                          // border: UnderlineInputBorder(
                          //   borderSide: BorderSide(color: Colors.black),
                          // ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.green),
                              borderRadius: BorderRadius.circular(14)),
                          errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.red),
                              borderRadius: BorderRadius.circular(14)),
                          suffixIcon: InkWell(
                            onTap: () {
                              hidePassword = !hidePassword;
                              setState(() {});
                            },
                            child: Icon(hidePassword == true
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          prefixIcon: Icon(Icons.lock)),
                    ),
                    SizedBox(height: 15),

                    TextFormField(
                      controller: phoneContoller,
                      focusNode: phoneNoFocus,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      maxLength: 10,
                      textInputAction: TextInputAction.next,
                      onChanged: (val) {
                        print(val);
                      },
                      validator: (val) {
                        if (val == null) {
                          return "Phone number must be valid";
                        }

                        if (val.length < 10) {
                          return "phone number must be 10 charcters long";
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "Enter your phone number",
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.phone)),
                    ),
                    SizedBox(height: 20),
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

                    MaterialButton(
                      onPressed: () {
                        // var email = emailController.text;
                        // var password = passwordController.text;
                        // emailController.clear();

                        // emailController.text = "some text";

                        FocusScope.of(context).unfocus();

                        if (formKey.currentState != null) {
                          formKey.currentState!.save();
                          final isValid = formKey.currentState!.validate();

                          if (!isValid) {
                            return;
                          }

                          /// request server
                        }
                      },
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
        ),
      ),
    );
  }
}
