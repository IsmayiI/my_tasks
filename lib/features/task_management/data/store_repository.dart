import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_tasks/features/task_management/domain/task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'store_repository.g.dart';

class StoreRepository {
  final FirebaseFirestore _store;

  const StoreRepository(this._store);

  Future<void> addTask({required Task task, required String userId}) async {
    final docRef = await _store
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .add(task.toJson());

    await docRef.update({'id': docRef.id});
  }

  Future<void> updateTask({
    required Task task,
    required String taskId,
    required String userId,
  }) async {
    await _store
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .doc(taskId)
        .update(task.toJson());
  }
}

@Riverpod(keepAlive: true)
FirebaseFirestore firebaseFirestore(Ref ref) => FirebaseFirestore.instance;
