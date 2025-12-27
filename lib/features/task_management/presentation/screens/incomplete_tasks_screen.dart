import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_tasks/common_widgets/common_widgets.dart';
import 'package:my_tasks/features/authentication/data/auth_repository.dart';
import 'package:my_tasks/features/task_management/data/store_repository.dart';
import 'package:my_tasks/features/task_management/presentation/widgets/widgets.dart';

class InCompleteTasksScreen extends ConsumerWidget {
  const InCompleteTasksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(currentUserProvider)!.uid;
    final inCompletedTasksAsyncValue = ref.watch(
      loadInCompletedTasksProvider(userId),
    );

    ref.listen(loadInCompletedTasksProvider(userId), (prev, next) {
      next.showDialogOnError(context);
    });

    return Scaffold(
      appBar: commonAppBar('Incomplete Tasks'),
      body: CommonTasksView(inCompletedTasksAsyncValue),
    );
  }
}
