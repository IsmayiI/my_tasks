import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_tasks/common_widgets/common_widgets.dart';
import 'package:my_tasks/features/authentication/data/auth_repository.dart';
import 'package:my_tasks/features/task_management/data/store_repository.dart';
import 'package:my_tasks/features/task_management/presentation/widgets/widgets.dart';

class CompletedTasksScreen extends ConsumerWidget {
  const CompletedTasksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(currentUserProvider)!.uid;
    final completedTasksAsyncValue = ref.watch(
      loadCompletedTasksProvider(userId),
    );

    ref.listen(loadCompletedTasksProvider(userId), (prev, next) {
      next.showDialogOnError(context);
    });

    return Scaffold(
      appBar: commonAppBar('Complete Tasks'),
      body: CommonTasksView(completedTasksAsyncValue),
    );
  }
}
