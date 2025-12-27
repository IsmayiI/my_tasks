// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(firebaseFirestore)
const firebaseFirestoreProvider = FirebaseFirestoreProvider._();

final class FirebaseFirestoreProvider
    extends
        $FunctionalProvider<
          FirebaseFirestore,
          FirebaseFirestore,
          FirebaseFirestore
        >
    with $Provider<FirebaseFirestore> {
  const FirebaseFirestoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firebaseFirestoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firebaseFirestoreHash();

  @$internal
  @override
  $ProviderElement<FirebaseFirestore> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FirebaseFirestore create(Ref ref) {
    return firebaseFirestore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirebaseFirestore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirebaseFirestore>(value),
    );
  }
}

String _$firebaseFirestoreHash() => r'eca974fdc891fcd3f9586742678f47582b20adec';

@ProviderFor(storeRepository)
const storeRepositoryProvider = StoreRepositoryProvider._();

final class StoreRepositoryProvider
    extends
        $FunctionalProvider<StoreRepository, StoreRepository, StoreRepository>
    with $Provider<StoreRepository> {
  const StoreRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storeRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storeRepositoryHash();

  @$internal
  @override
  $ProviderElement<StoreRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  StoreRepository create(Ref ref) {
    return storeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StoreRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StoreRepository>(value),
    );
  }
}

String _$storeRepositoryHash() => r'e42e197e8b0ae30aec2c38e78fbf93b797d02caf';

@ProviderFor(loadTasks)
const loadTasksProvider = LoadTasksFamily._();

final class LoadTasksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Task>>,
          List<Task>,
          Stream<List<Task>>
        >
    with $FutureModifier<List<Task>>, $StreamProvider<List<Task>> {
  const LoadTasksProvider._({
    required LoadTasksFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'loadTasksProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loadTasksHash();

  @override
  String toString() {
    return r'loadTasksProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<Task>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Task>> create(Ref ref) {
    final argument = this.argument as String;
    return loadTasks(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadTasksProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loadTasksHash() => r'19250c2fc5a15475ad2cf1433e81de64096519d6';

final class LoadTasksFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<Task>>, String> {
  const LoadTasksFamily._()
    : super(
        retry: null,
        name: r'loadTasksProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LoadTasksProvider call(String userId) =>
      LoadTasksProvider._(argument: userId, from: this);

  @override
  String toString() => r'loadTasksProvider';
}

@ProviderFor(loadCompletedTasks)
const loadCompletedTasksProvider = LoadCompletedTasksFamily._();

final class LoadCompletedTasksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Task>>,
          List<Task>,
          Stream<List<Task>>
        >
    with $FutureModifier<List<Task>>, $StreamProvider<List<Task>> {
  const LoadCompletedTasksProvider._({
    required LoadCompletedTasksFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'loadCompletedTasksProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loadCompletedTasksHash();

  @override
  String toString() {
    return r'loadCompletedTasksProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<Task>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Task>> create(Ref ref) {
    final argument = this.argument as String;
    return loadCompletedTasks(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadCompletedTasksProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loadCompletedTasksHash() =>
    r'5b968b582da525bd16a9f5a87e740e413fede48f';

final class LoadCompletedTasksFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<Task>>, String> {
  const LoadCompletedTasksFamily._()
    : super(
        retry: null,
        name: r'loadCompletedTasksProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LoadCompletedTasksProvider call(String userId) =>
      LoadCompletedTasksProvider._(argument: userId, from: this);

  @override
  String toString() => r'loadCompletedTasksProvider';
}

@ProviderFor(loadInCompletedTasks)
const loadInCompletedTasksProvider = LoadInCompletedTasksFamily._();

final class LoadInCompletedTasksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Task>>,
          List<Task>,
          Stream<List<Task>>
        >
    with $FutureModifier<List<Task>>, $StreamProvider<List<Task>> {
  const LoadInCompletedTasksProvider._({
    required LoadInCompletedTasksFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'loadInCompletedTasksProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loadInCompletedTasksHash();

  @override
  String toString() {
    return r'loadInCompletedTasksProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<Task>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Task>> create(Ref ref) {
    final argument = this.argument as String;
    return loadInCompletedTasks(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadInCompletedTasksProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loadInCompletedTasksHash() =>
    r'4420be45c41e0b33e8225f952a6c76bf0e83e832';

final class LoadInCompletedTasksFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<Task>>, String> {
  const LoadInCompletedTasksFamily._()
    : super(
        retry: null,
        name: r'loadInCompletedTasksProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LoadInCompletedTasksProvider call(String userId) =>
      LoadInCompletedTasksProvider._(argument: userId, from: this);

  @override
  String toString() => r'loadInCompletedTasksProvider';
}
