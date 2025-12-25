import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_tasks/features/task_management/presentation/widgets/widgets.dart';

class AllTaskScreen extends ConsumerStatefulWidget {
  const AllTaskScreen({super.key});

  @override
  ConsumerState<AllTaskScreen> createState() => _AllTaskScreenState();
}

class _AllTaskScreenState extends ConsumerState<AllTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('My Tasks'),
      body: Center(child: Text('All Task Screen')),
    );
  }
}
