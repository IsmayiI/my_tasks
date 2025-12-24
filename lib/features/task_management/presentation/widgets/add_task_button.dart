import 'package:flutter/material.dart';
import 'package:my_tasks/utils/utils.dart';

class AddTaskButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;
  const AddTaskButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: isLoading
          ? SizedBox(
              height: SizeConfig.height(20),
              width: SizeConfig.width(20),
              child: const CircularProgressIndicator(color: Colors.white),
            )
          : const Text('Add Task'),
      icon: isLoading ? null : const Icon(Icons.add),
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
