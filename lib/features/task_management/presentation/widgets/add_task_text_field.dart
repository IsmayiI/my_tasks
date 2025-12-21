import 'package:flutter/material.dart';
import 'package:my_tasks/utils/utils.dart';

class AddTaskTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;

  const AddTaskTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyle.title),
        AppSpacer.vertical(10),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(Icons.notes),
            filled: true,
            fillColor: Colors.grey,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ],
    );
  }
}
