import 'package:flutter/material.dart';
import 'package:my_tasks/utils/app_text_style.dart';

class AuthCheckbox extends StatelessWidget {
  final bool isChecked;
  final void Function(bool?) onChanged;

  const AuthCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: isChecked, onChanged: onChanged),
        Text('I agree with policy and terms', style: AppTextStyle.normal),
      ],
    );
  }
}
