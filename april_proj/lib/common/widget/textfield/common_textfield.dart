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
      this.prefixIcon,
      required this.label,
      this.suffixText})
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
  final String label;
  final String? suffixText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey),
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.disabled,
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          focusNode: focusNode,
          style: TextStyle(fontWeight: FontWeight.w500),
          decoration: InputDecoration(
              // border: UnderlineInputBorder(
              //   borderSide: BorderSide(color: Colors.black),
              // ),

              hintText: hintText,
              hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(14)),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.red),
                  borderRadius: BorderRadius.circular(14)),
              suffixText: suffixText,
              prefixIcon: prefixIcon),
        ),
      ],
    );
  }
}
