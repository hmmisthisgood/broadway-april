import 'package:boilerplate/common/constant/strings.dart';
import 'package:boilerplate/feature/authentication/bloc/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

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
  final _formKey = GlobalKey<FormState>();

  ValueNotifier<bool> _isLoginLoading = ValueNotifier(false);

  onLogin() {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState != null) {
      _formKey.currentState!.save();

      final isValid = _formKey.currentState!.validate();

      if (!isValid) {
        return;
      }

      /// validation success
      BlocProvider.of<AuthenticationCubit>(context)
          .emailLogin(emailController.text, passwordController.text);
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
            /// listen some states

            if (state is AuthLoading) {
              _isLoginLoading.value = true;
            }

            if (state is AuthError) {
              Fluttertoast.showToast(msg: state.errorMessage);
              _isLoginLoading.value = false;
            }

            if (state is AuthSuccess) {
              _isLoginLoading.value = false;

              Navigator.pushNamed(context, "/aegawe");
            }
          },
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
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
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        Strings.welcomeBack,
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
                    validator:
                        EmailValidator(errorText: Strings.emailMustBeValid),
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
                  SizedBox(height: 70),
                  ValueListenableBuilder<bool>(
                      valueListenable: _isLoginLoading,
                      builder: (context, loading, _) {
                        return IgnorePointer(
                          ignoring: loading,
                          child: MaterialButton(
                            onPressed: onLogin,
                            color: Colors.blue,
                            minWidth: double.infinity,
                            height: 48,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  Strings.loginText.toUpperCase(),
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
                  SizedBox(height: 40),
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
          ),
        ),
      )),
    );
  }
}
