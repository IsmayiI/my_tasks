import 'package:flutter/material.dart';
import 'package:my_tasks/utils/utils.dart';

class AddTaskButton extends StatelessWidget {
  final VoidCallback onPressed;
  const AddTaskButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: Text('Add Task'),
      icon: const Icon(Icons.add),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        textStyle: AppTextStyle.normal.copyWith(fontSize: 20),
        minimumSize: Size(double.infinity, SizeConfig.height(50)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
