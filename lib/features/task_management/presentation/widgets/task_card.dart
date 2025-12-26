import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_tasks/features/task_management/domain/task.dart';

import 'widgets.dart';

class TaskCard extends ConsumerStatefulWidget {
  const TaskCard(this.task, {super.key});

  final Task task;

  @override
  ConsumerState<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends ConsumerState<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child: Row(
        children: [
          // Task left side
          Expanded(child: TaskCardContent(task: widget.task)),

          // Task right side
          Expanded(child: TaskCardActions(task: widget.task)),
        ],
      ),
    );
  }
}
