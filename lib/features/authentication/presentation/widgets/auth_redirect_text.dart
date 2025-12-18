import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_tasks/utils/app_text_style.dart';
import 'package:my_tasks/utils/size_config.dart';

class AuthRedirectText extends StatelessWidget {
  final String text;
  final String redirectText;
  final String redirectRouteName;

  const AuthRedirectText({
    super.key,
    required this.text,
    required this.redirectText,
    required this.redirectRouteName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: AppTextStyle.normal),
        SizedBox(width: SizeConfig.width(5)),
        GestureDetector(
          onTap: () {
            context.goNamed(redirectRouteName);
          },
          child: Text(
            redirectText,
            style: AppTextStyle.normal.copyWith(color: Colors.green),
          ),
        ),
      ],
    );
  }
}
