import 'package:flutter/material.dart';
import 'package:my_tasks/utils/app_text_style.dart';

class AuthTitle extends StatelessWidget {
  final String title;

  const AuthTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: AppTextStyle.title);
  }
}
