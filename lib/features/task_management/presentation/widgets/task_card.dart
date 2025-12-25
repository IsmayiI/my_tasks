import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_tasks/features/authentication/data/auth_repository.dart';
import 'package:my_tasks/features/task_management/domain/task.dart';
import 'package:my_tasks/features/task_management/presentation/controllers/store_controller.dart';
import 'package:my_tasks/utils/utils.dart';

class TaskCard extends ConsumerStatefulWidget {
  const TaskCard(this.task, {super.key});

  final Task task;

  @override
  ConsumerState<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends ConsumerState<TaskCard> {
  @override
  Widget build(BuildContext context) {
    final userId = ref.watch(currentUserProvider)!.uid;

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child: Row(
        children: [
          Expanded(child: _Content(task: widget.task)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({required this.task});

  final Task task;

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
