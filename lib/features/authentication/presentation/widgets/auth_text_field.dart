import 'package:flutter/material.dart';
import 'package:my_tasks/utils/app_text_style.dart';

class AuthTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const AuthTextField({
    super.key,
    required this.keyboardType,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: Colors.grey),
    );

    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyle.normal,
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        border: border,
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }
}
