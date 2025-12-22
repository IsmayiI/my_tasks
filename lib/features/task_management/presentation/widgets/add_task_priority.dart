import 'package:flutter/material.dart';
import 'package:my_tasks/utils/utils.dart';

class AddTaskPriority extends StatelessWidget {
  final List<String> priorities;
  final int selectedPriority;
  final Function(int) onTap;

  const AddTaskPriority({
    super.key,
    required this.priorities,
    required this.selectedPriority,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text('Priority', style: AppTextStyle.title)),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...priorities.map((priority) {
                final index = priorities.indexOf(priority);
                return GestureDetector(
                  onTap: () => onTap(index),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: selectedPriority == index
                          ? Colors.green
                          : Colors.grey,
                    ),
                    child: Text(
                      priority,
                      style: AppTextStyle.normal.copyWith(
                        color: selectedPriority == index
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
