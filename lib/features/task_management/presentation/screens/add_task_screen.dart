import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_tasks/features/task_management/presentation/widgets/widgets.dart';
import 'package:my_tasks/utils/utils.dart';

class AddTaskScreen extends ConsumerStatefulWidget {
  const AddTaskScreen({super.key});

  @override
  ConsumerState<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends ConsumerState<AddTaskScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _priorities = const ['Low', 'Medium', 'High'];
  int _selectedPriority = 0;

  void getSelectedPriority(int index) {
    setState(() {
      _selectedPriority = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Task',
          style: AppTextStyle.title.copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            AddTaskTextField(
              label: 'Task Title',
              hintText: 'Enter Task Title',
              controller: _titleController,
            ),
            AppSpacer.vertical(10),
            AddTaskTextField(
              label: 'Task Description',
              hintText: 'Enter Task Description',
              controller: _descriptionController,
            ),
            AppSpacer.vertical(20),
            AddTaskPriority(
              priorities: _priorities,
              selectedPriority: _selectedPriority,
              onTap: getSelectedPriority,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
