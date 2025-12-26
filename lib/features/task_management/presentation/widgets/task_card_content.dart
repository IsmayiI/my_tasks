import 'package:flutter/material.dart';
import 'package:my_tasks/features/task_management/domain/task.dart';
import 'package:my_tasks/utils/utils.dart';

class TaskCardContent extends StatelessWidget {
  final Task task;

  const TaskCardContent({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Task title
        Text(
          task.title,
          style: AppTextStyle.title.copyWith(color: Colors.white),
        ),

        AppSpacer.vertical(10),

        // Task description
        Text(
          task.description,
          style: AppTextStyle.normal.copyWith(color: Colors.white),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

        AppSpacer.vertical(20),

        // Task priority and date
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Task priority
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: SizeConfig.height(40),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  task.priority.toUpperCase(),
                  style: AppTextStyle.normal.copyWith(color: Colors.white),
                ),
              ),
            ),

            AppSpacer.horizontal(10),

            // Task date
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: SizeConfig.height(40),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  formattedDate(task.date),
                  style: AppTextStyle.normal.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
