import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {Key? key,
      required this.controller,
      this.obscureText = false,
      this.validator,
      this.hintText = "",
      this.suffixIcon,
      this.focusNode,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = TextInputType.text,
      this.prefixIcon})
      : super(key: key);

  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.disabled,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      focusNode: focusNode,
      decoration: InputDecoration(
          // border: UnderlineInputBorder(
          //   borderSide: BorderSide(color: Colors.black),
          // ),
          hintText: hintText,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.green),
              borderRadius: BorderRadius.circular(14)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(14)),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon),
    );
  }
}
