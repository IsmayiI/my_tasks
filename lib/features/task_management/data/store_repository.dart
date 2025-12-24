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

  Future<void> deleteTask({
    required String taskId,
    required String userId,
  }) async {
    await _store
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .doc(taskId)
        .delete();
  }

  Future<void> updateTaskCompletion({
    required bool isComlete,
    required String taskId,
    required String userId,
  }) async {
    await _store
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .doc(taskId)
        .update({'isComplete': isComlete});
  }

  Stream<List<Task>> loadTasks(String userId) {
    return _store
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .orderBy('date', descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Task.fromJson(doc.data())).toList(),
        );
  }

  Stream<List<Task>> loadCompletedTasks(String userId) {
    return _store
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .where('isComplete', isEqualTo: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Task.fromJson(doc.data())).toList(),
        );
  }

  Stream<List<Task>> loadInCompletedTasks(String userId) {
    return _store
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .where('isComplete', isEqualTo: false)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Task.fromJson(doc.data())).toList(),
        );
  }
}

@Riverpod(keepAlive: true)
FirebaseFirestore firebaseFirestore(Ref ref) => FirebaseFirestore.instance;

@Riverpod(keepAlive: true)
StoreRepository storeRepository(Ref ref) {
  final firebaseFirestore = ref.watch(firebaseFirestoreProvider);
  return StoreRepository(firebaseFirestore);
}

@Riverpod(keepAlive: true)
Stream<List<Task>> loadTasks(Ref ref, String userId) {
  final storeRepository = ref.watch(storeRepositoryProvider);
  return storeRepository.loadTasks(userId);
}

@Riverpod(keepAlive: true)
Stream<List<Task>> loadCompletedTasks(Ref ref, String userId) {
  final storeRepository = ref.watch(storeRepositoryProvider);
  return storeRepository.loadCompletedTasks(userId);
}

@Riverpod(keepAlive: true)
Stream<List<Task>> loadInCompletedTasks(Ref ref, String userId) {
  final storeRepository = ref.watch(storeRepositoryProvider);
  return storeRepository.loadInCompletedTasks(userId);
}
