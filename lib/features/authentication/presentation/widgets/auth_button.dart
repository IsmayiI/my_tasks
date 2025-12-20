import 'package:flutter/material.dart';
import 'package:my_tasks/utils/app_text_style.dart';
import 'package:my_tasks/utils/size_config.dart';

class AuthButton extends StatelessWidget {
  final bool isLoading;
  final String text;
  final VoidCallback? onPressed;

  const AuthButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        minimumSize: Size(double.infinity, SizeConfig.height(50)),
      ),
      child: isLoading
          ? SizedBox(
              height: SizeConfig.height(20),
              width: SizeConfig.width(20),
              child: const CircularProgressIndicator(color: Colors.white),
            )
          : Text(
              text,
              style: AppTextStyle.normal.copyWith(color: Colors.white),
            ),
    );
  }
}
