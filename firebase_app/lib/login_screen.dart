import 'package:firebase_app/cubit/auth/auth_cubit.dart';
import 'package:firebase_app/cubit/auth/auth_state.dart';
import 'package:firebase_app/register_screen.dart';
import 'package:firebase_app/widget/full_screen_loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/svg.dart';

import 'widget/common_text_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NavProps {
  final String phone;
  final String email;

  NavProps({required this.phone, required this.email});
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneContoller = TextEditingController();
  String email = '';
  final formKey = GlobalKey<FormState>();
  FocusNode emailFocus = FocusNode();
  FocusNode phoneNoFocus = FocusNode();

  ValueNotifier<bool> isLoginLoading = ValueNotifier(false);

  // AuthCubit authCubit = AuthCubit();
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    final auth = FirebaseAuth.instance;
    print(auth.currentUser.toString());
  }

  onLogin() async {
    FocusScope.of(context).unfocus();

    if (formKey.currentState != null) {
      formKey.currentState!.save();
      final isValid = formKey.currentState!.validate();
      if (!isValid) {
        return;
      }
    }

    // BlocProvider.of<AuthCubit>(context).emailSignIn(
    //     email: emailController.text, password: passwordController.text);

    context.read<AuthCubit>().emailSignIn(
        email: emailController.text, password: passwordController.text);
  }

  facebookLogin() async {
    final LoginResult result =
        await FacebookAuth.instance.login(loginBehavior: LoginBehavior.webOnly);
    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);

      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } else {
      print(result.status);
      print(result.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Stack(
        children: [
          Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthLoading) {
                      isLoginLoading.value = true;
                      isLoading = true;
                      // setState(() {});
                    }
                    if (state is AuthError) {
                      Fluttertoast.showToast(msg: state.errorMessage);
                      isLoading = false;
                      isLoginLoading.value = false;

                      // setState(() {});
                    }
                    if (state is AuthSuccess) {
                      isLoading = false;
                      isLoginLoading.value = false;

                      // setState(() {});
                      Fluttertoast.showToast(msg: state.user.toString());

                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (_) => Scaffold()));
                    }
                  },
                  builder: (context, state) {
                    return Column(
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

                        CommonTextField(
                          controller: phoneContoller,
                          focusNode: phoneNoFocus,
                          keyboardType: TextInputType.number,
                          // validator: (val) {
                          //   if (val == null) {
                          //     return "Phone number must be valid";
                          //   }

                          //   if (val.length < 10) {
                          //     return "phone number must be 10 charcters long";
                          //   }
                          // },
                          hintText: "Enter your phone number",
                        ),
                        SizedBox(height: 20),

                        MaterialButton(
                          onPressed: onLogin,
                          color: Colors.purple,
                          minWidth: double.infinity,
                          height: 48,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        SizedBox(height: 12),

                        MaterialButton(
                          onPressed: onLogin,
                          // color: Colors.green,
                          minWidth: double.infinity,
                          height: 48,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Colors.black45)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/google.svg",
                                height: 25,
                                // color: Colors.white,
                              ),
                              SizedBox(width: 20),
                              Text(
                                "Sign In With Google",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        MaterialButton(
                          onPressed: facebookLogin,
                          color: Colors.blue,
                          minWidth: double.infinity,
                          height: 48,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/facebook.png",
                                height: 25,
                                color: Colors.white,
                              ),
                              SizedBox(width: 20),
                              Text(
                                "Sign In With Facebook",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => RegisterScreen()));
                            },
                            child: Text("Don't have an account yet? Sign Up"))
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          // if (isLoading) FullScreenLoading()

          ValueListenableBuilder<bool>(
              valueListenable: isLoginLoading,
              // child: FullScreenLoading(),
              builder: (context, value, child) {
                if (value == true) return FullScreenLoading();
                return Container();
              })
        ],
      ),
    );
  }
}
