import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_tasks/common_widgets/common_widgets.dart';
import 'package:my_tasks/features/authentication/data/auth_repository.dart';
import 'package:my_tasks/features/task_management/data/store_repository.dart';
import 'package:my_tasks/features/task_management/domain/task.dart';
import 'package:my_tasks/features/task_management/presentation/widgets/widgets.dart';

class AllTaskScreen extends ConsumerStatefulWidget {
  const AllTaskScreen({super.key});

  @override
  ConsumerState<AllTaskScreen> createState() => _AllTaskScreenState();
}

class _AllTaskScreenState extends ConsumerState<AllTaskScreen> {
  @override
  Widget build(BuildContext context) {
    final userId = ref.watch(currentUserProvider)!.uid;
    final tasksAsyncValue = ref.watch(loadTasksProvider(userId));

    ref.listen(loadTasksProvider(userId), (prev, next) {
      next.showDialogOnError(context);
    });

    return Scaffold(
      appBar: commonAppBar('My Tasks'),
      body: AsyncValueWidget<List<Task>>(
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
      ),
    );
  }
}
