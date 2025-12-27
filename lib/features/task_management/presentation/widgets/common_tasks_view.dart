import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_tasks/common_widgets/common_widgets.dart';
import 'package:my_tasks/features/task_management/domain/task.dart';

import 'widgets.dart';

class CommonTasksView extends StatelessWidget {
  const CommonTasksView(this.tasksAsyncValue, {super.key});

  final AsyncValue<List<Task>> tasksAsyncValue;

  @override
  Widget build(BuildContext context) {
    return AsyncValueWidget<List<Task>>(
      value: tasksAsyncValue,
      data: (tasks) {
        return tasks.isEmpty
            ? const Center(child: Text('No Tasks Yet...'))
            : ListView.separated(
                itemCount: tasks.length,
                itemBuilder: (ctx, index) {
                  final task = tasks[index];
                  return TaskCard(task);
                },
                separatorBuilder: (ctx, index) {
                  return Divider(height: 2, color: Colors.blue);
                },
              );
      },
    );
  }
}
