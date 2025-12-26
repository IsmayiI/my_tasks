import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_tasks/features/authentication/data/auth_repository.dart';
import 'package:my_tasks/features/task_management/domain/task.dart';
import 'package:my_tasks/features/task_management/presentation/controllers/store_controller.dart';
import 'package:my_tasks/utils/utils.dart';

class TaskCardActions extends ConsumerStatefulWidget {
  final Task task;
  const TaskCardActions({super.key, required this.task});

  @override
  ConsumerState<TaskCardActions> createState() => _TaskCardActionsState();
}

class _TaskCardActionsState extends ConsumerState<TaskCardActions> {
  @override
  Widget build(BuildContext context) {
    final userId = ref.watch(currentUserProvider)!.uid;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Task checkbox completion
        Transform.scale(
          scale: 1.8,
          child: Checkbox(
            visualDensity: VisualDensity.compact,
            value: widget.task.isComplete,
            onChanged: (value) {
              if (value != null) {
                ref
                    .read(storeControllerProvider.notifier)
                    .updateTaskCompletion(
                      isComplete: value,
                      taskId: widget.task.id,
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
          onPressed: () => _editTask(userId),
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
          onPressed: () => _deleteTask(userId),
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }

  void _deleteTask(String userId) {
    ref
        .read(storeControllerProvider.notifier)
        .deleteTask(taskId: widget.task.id, userId: userId);
  }

  void _editTask(String userId) {
    TextEditingController titleController = TextEditingController(
      text: widget.task.title,
    );
    TextEditingController descriptionController = TextEditingController(
      text: widget.task.description,
    );

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: const Icon(Icons.edit, color: Colors.green, size: 40),
        title: Text('Update Task', style: AppTextStyle.normal),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.pop();
                },
                child: Text('Cancel', style: AppTextStyle.normal),
              ),
              AppSpacer.vertical(20),
              ElevatedButton(
                onPressed: () async {
                  final task = Task(
                    id: widget.task.id,
                    title: titleController.text.trim(),
                    description: descriptionController.text.trim(),
                    isComplete: widget.task.isComplete,
                    priority: widget.task.priority,
                    date: widget.task.date,
                  );
                  await ref
                      .read(storeControllerProvider.notifier)
                      .updateTask(task: task, userId: userId);
                  if (mounted) {
                    context.pop();
                  }
                },
                child: Text('Update', style: AppTextStyle.normal),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
