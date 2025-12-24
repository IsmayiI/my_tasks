// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StoreController)
const storeControllerProvider = StoreControllerProvider._();

final class StoreControllerProvider
    extends $AsyncNotifierProvider<StoreController, dynamic> {
  const StoreControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storeControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storeControllerHash();

  @$internal
  @override
  StoreController create() => StoreController();
}

String _$storeControllerHash() => r'4de2e68926964db8847a71114b165c4f47a92b8f';

abstract class _$StoreController extends $AsyncNotifier<dynamic> {
  FutureOr<dynamic> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<dynamic>, dynamic>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<dynamic>, dynamic>,
              AsyncValue<dynamic>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
