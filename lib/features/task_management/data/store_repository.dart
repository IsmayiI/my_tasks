import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_tasks/features/task_management/domain/task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'store_repository.g.dart';

class StoreRepository {
  final FirebaseFirestore _store;

  const StoreRepository(this._store);

  Future<void> addTask({required Task task, required String userId}) async {}
}

@Riverpod(keepAlive: true)
FirebaseFirestore firebaseFirestore(Ref ref) => FirebaseFirestore.instance;
