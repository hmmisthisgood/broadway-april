import 'package:boilerplate/common/constant/strings.dart';
import 'package:boilerplate/feature/authentication/bloc/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  ValueNotifier<bool> _isSignupLoading = ValueNotifier(false);
  final _formKey = GlobalKey<FormState>();
  onSignUp() {
    FocusScope.of(context).unfocus();

    print("on sign up");
    if (_formKey.currentState != null) {
      print('isvalid');

      _formKey.currentState!.save();

      final isValid = _formKey.currentState!.validate();

      if (!isValid) {
        return;
      }

      /// validation success
      BlocProvider.of<AuthenticationCubit>(context)
          .emailRegister(emailController.text, passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: BlocListener<AuthenticationCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoading) {
              _isSignupLoading.value = true;
            }

            if (state is AuthError) {
              Fluttertoast.showToast(msg: state.errorMessage);
              _isSignupLoading.value = false;
            }

            if (state is AuthSuccess) {
              _isSignupLoading.value = false;
              Fluttertoast.showToast(
                  msg: "Account created sucess! Please Login now");

              Navigator.pop(context);
            }
          },
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.hey,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        Strings.welcomeToApp,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
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
                  ValueListenableBuilder<bool>(
                      valueListenable: _isSignupLoading,
                      builder: (context, loading, _) {
                        return IgnorePointer(
                          ignoring: loading,
                          child: MaterialButton(
                            onPressed: onSignUp,
                            color: Colors.blue,
                            minWidth: double.infinity,
                            height: 48,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  Strings.createAccount.toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                if (loading) SizedBox(width: 15),
                                if (loading)
                                  Container(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 0.9,
                                    ),
                                  )
                              ],
                            ),
                          ),
                        );
                      }),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                      child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      Strings.backToLogin,
                      style: TextStyle(fontSize: 14),
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
