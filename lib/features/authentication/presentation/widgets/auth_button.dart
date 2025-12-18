import 'package:flutter/material.dart';
import 'package:my_tasks/utils/app_text_style.dart';
import 'package:my_tasks/utils/size_config.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const AuthButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        minimumSize: Size(double.infinity, SizeConfig.height(50)),
      ),
      child: Text(
        text,
        style: AppTextStyle.normal.copyWith(color: Colors.white),
      ),
    );
  }
}
