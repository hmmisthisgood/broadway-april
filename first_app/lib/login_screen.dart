import 'package:first_app/image_screen.dart';
import 'package:first_app/model/user.dart';
import 'package:first_app/utils/locale_keys.dart';
import 'package:first_app/utils/shared_pref.dart';
import 'package:first_app/widget/text_field.dart';
import 'package:flutter/material.dart';

import 'list_view_with_builder.dart';
import 'navigation/routes.dart';
import 'package:easy_localization/easy_localization.dart';

class NavProps {
  final String phone;
  final String email;

  NavProps({required this.phone, required this.email});
}

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

  onLogin() {
    // var email = emailController.text;
    // var password = passwordController.text;
    // emailController.clear();
    // emailController.text = "some text";

    EasyLocalization.of(context)!.setLocale(Locale("ne"));

    FocusScope.of(context).unfocus();

    if (formKey.currentState != null) {
      formKey.currentState!.save();

      final isValid = formKey.currentState!.validate();

      if (!isValid) {
        return;
      }

      /// non named navigation
      // Navigator.pushAndRemoveUntil(
      //   context,
      //   MaterialPageRoute(
      //       builder: (_) => ListWithBuilderScreen(
      //             username: emailController.text,
      //           )),
      //   (route) {
      //     return false;
      //   },
      // );

      /// named naviagation

      // Navigator.pushNamedAndRemoveUntil(
      //     context, "/dashboard", (route) => false);

      SharedPref.setIsUserLoggedIn(true);
      SharedPref.saveuser(User(
          email: "test@test.com",
          profilePicture:
              "https://cdn.psychologytoday.com/sites/default/files/styles/article-inline-half-caption/public/field_blog_entry_images/2018-09/shutterstock_648907024.jpg?itok=0hb44OrI",
          username: "iamrock",
          id: 12312));
      // SharedPref().getIsUserLoggedIn();

      Navigator.pushNamed(context, Routes.dashboardScreen,
          arguments: NavProps(
              phone: phoneContoller.text, email: emailController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final txt = theme.textTheme;
    final h6 = txt.headline6;

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
                    CommonTextField(
                      focusNode: emailFocus,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      hintText: LocaleKeys.emailHint.tr(),
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

                    CommonTextField(
                      controller: phoneContoller,
                      focusNode: phoneNoFocus,
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val == null) {
                          return "Phone number must be valid";
                        }

                        if (val.length < 10) {
                          return "phone number must be 10 charcters long";
                        }
                      },
                      hintText: "Enter your phone number",
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
                      onPressed: onLogin,
                      color: Colors.purple,
                      minWidth: 200,
                      height: 48,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "normal_key".tr(),
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
