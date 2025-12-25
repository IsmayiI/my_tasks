import 'package:my_tasks/features/task_management/data/store_repository.dart';
import 'package:my_tasks/features/task_management/domain/task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'store_controller.g.dart';

@Riverpod(keepAlive: true)
class StoreController extends _$StoreController {
  @override
  FutureOr<dynamic> build() {
    throw UnimplementedError();
  }

  Future<void> addTask({required Task task, required String userId}) async {
    state = const AsyncValue.loading();
    final store = ref.watch(storeRepositoryProvider);
    state = await AsyncValue.guard(
      () => store.addTask(task: task, userId: userId),
    );
  }

  Future<void> updateTask({
    required Task task,
    required String taskId,
    required String userId,
  }) async {
    state = const AsyncValue.loading();
    final store = ref.watch(storeRepositoryProvider);
    state = await AsyncValue.guard(
      () => store.updateTask(task: task, taskId: taskId, userId: userId),
    );
  }

  Future<void> updateTaskCompletion({
    required bool isComplete,
    required String taskId,
    required String userId,
  }) async {
    state = const AsyncValue.loading();
    final store = ref.watch(storeRepositoryProvider);
    state = await AsyncValue.guard(
      () => store.updateTaskCompletion(
        isComplete: isComplete,
        taskId: taskId,
        userId: userId,
      ),
    );
  }

  Future<void> deleteTask({
    required String taskId,
    required String userId,
  }) async {
    state = const AsyncValue.loading();
    final store = ref.watch(storeRepositoryProvider);
    state = await AsyncValue.guard(
      () => store.deleteTask(taskId: taskId, userId: userId),
    );
  }
}
