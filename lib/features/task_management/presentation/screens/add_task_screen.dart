import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_tasks/common_widgets/async_value_ui.dart';
import 'package:my_tasks/features/authentication/data/auth_repository.dart';
import 'package:my_tasks/features/task_management/domain/task.dart';
import 'package:my_tasks/features/task_management/presentation/controllers/store_controller.dart';
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
    final state = ref.watch(storeControllerProvider);
    final userId = ref.watch(currentUserProvider)!.uid;

    ref.listen(storeControllerProvider, (previous, next) {
      next.showDialogOnError(context);
    });

    return Scaffold(
      appBar: commonAppBar('Create Task'),
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
            AppSpacer.vertical(20),
            AddTaskButton(
              onPressed: () => addTask(userId),
              isLoading: state.isLoading,
            ),
          ],
        ),
      ),
    );
  }

  void addTask(String userId) {
    // hide keyboard
    FocusManager.instance.primaryFocus?.unfocus();

    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();
    final priority = _priorities[_selectedPriority];
    final date = DateTime.now().toString();

    if (title.isEmpty || description.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Please enter title and description',
            style: AppTextStyle.normal.copyWith(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    } else {
      final task = Task(
        title: title,
        description: description,
        priority: priority,
        date: date,
      );

      ref
          .read(storeControllerProvider.notifier)
          .addTask(task: task, userId: userId);

      _titleController.clear();
      _descriptionController.clear();
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
