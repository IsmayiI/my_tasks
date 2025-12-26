import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_tasks/features/authentication/data/auth_repository.dart';
import 'package:my_tasks/features/task_management/domain/task.dart';
import 'package:my_tasks/features/task_management/presentation/controllers/store_controller.dart';
import 'package:my_tasks/utils/utils.dart';

class TaskCardActions extends ConsumerWidget {
  final Task task;
  const TaskCardActions({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(currentUserProvider)!.uid;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Task checkbox completion
        Transform.scale(
          scale: 1.8,
          child: Checkbox(
            visualDensity: VisualDensity.compact,
            value: task.isComplete,
            onChanged: (value) {
              if (value != null) {
                ref
                    .read(storeControllerProvider.notifier)
                    .updateTaskCompletion(
                      isComplete: value,
                      taskId: task.id,
                      userId: userId,
                    );
              }
            },
          ),
        ),

        AppSpacer.vertical(8),

        //  Task edit button
        IconButton(
          style: IconButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
            fixedSize: Size(40, 40),
            iconSize: 30,
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () => _editTask(ref, userId),
          icon: const Icon(Icons.edit),
        ),

        AppSpacer.vertical(8),

        // Task delete button
        IconButton(
          style: IconButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            fixedSize: Size(40, 40),
            iconSize: 30,
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () => _deleteTask(ref, userId),
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }

  void _deleteTask(WidgetRef ref, String userId) {
    ref
        .read(storeControllerProvider.notifier)
        .deleteTask(taskId: task.id, userId: userId);
  }

  void _editTask(WidgetRef ref, String userId) {
    ref
        .read(storeControllerProvider.notifier)
        .updateTask(task: task, userId: userId);
  }
}
