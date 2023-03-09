// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$apiServicesHash() => r'92da79da3b9bba0238596c7b9877108b7b6c646a';

/// See also [apiServices].
@ProviderFor(apiServices)
final apiServicesProvider = Provider<ApiServices>.internal(
  apiServices,
  name: r'apiServicesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$apiServicesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ApiServicesRef = ProviderRef<ApiServices>;
String _$activityListHash() => r'b65de92f6a72b20cbc891518a497fc0a6db17961';

/// See also [activityList].
@ProviderFor(activityList)
final activityListProvider = AutoDisposeProvider<List<ActivityModel>>.internal(
  activityList,
  name: r'activityListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$activityListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ActivityListRef = AutoDisposeProviderRef<List<ActivityModel>>;
String _$fetchActivitiesHash() => r'4bcb1af55afed3d72d797f6789b4dce9224ccfac';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef FetchActivitiesRef = AutoDisposeFutureProviderRef<List<ActivityModel>>;

/// See also [fetchActivities].
@ProviderFor(fetchActivities)
const fetchActivitiesProvider = FetchActivitiesFamily();

/// See also [fetchActivities].
class FetchActivitiesFamily extends Family<AsyncValue<List<ActivityModel>>> {
  /// See also [fetchActivities].
  const FetchActivitiesFamily();

  /// See also [fetchActivities].
  FetchActivitiesProvider call(
    bool isRefreshed,
  ) {
    return FetchActivitiesProvider(
      isRefreshed,
    );
  }

  @override
  FetchActivitiesProvider getProviderOverride(
    covariant FetchActivitiesProvider provider,
  ) {
    return call(
      provider.isRefreshed,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchActivitiesProvider';
}

/// See also [fetchActivities].
class FetchActivitiesProvider
    extends AutoDisposeFutureProvider<List<ActivityModel>> {
  /// See also [fetchActivities].
  FetchActivitiesProvider(
    this.isRefreshed,
  ) : super.internal(
          (ref) => fetchActivities(
            ref,
            isRefreshed,
          ),
          from: fetchActivitiesProvider,
          name: r'fetchActivitiesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchActivitiesHash,
          dependencies: FetchActivitiesFamily._dependencies,
          allTransitiveDependencies:
              FetchActivitiesFamily._allTransitiveDependencies,
        );

  final bool isRefreshed;

  @override
  bool operator ==(Object other) {
    return other is FetchActivitiesProvider && other.isRefreshed == isRefreshed;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, isRefreshed.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$fetchActivities2Hash() => r'7c00d96ab5c2a7b34fd5336bd0e48c6cc5826a37';

/// See also [fetchActivities2].
@ProviderFor(fetchActivities2)
final fetchActivities2Provider =
    AutoDisposeFutureProvider<ActivityModel>.internal(
  fetchActivities2,
  name: r'fetchActivities2Provider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchActivities2Hash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchActivities2Ref = AutoDisposeFutureProviderRef<ActivityModel>;
String _$fetchPassengersHash() => r'269263bbe8b48f5cd89eea2d6933a002b3f49bb1';
typedef FetchPassengersRef = AutoDisposeFutureProviderRef<List<Passenger>>;

/// See also [fetchPassengers].
@ProviderFor(fetchPassengers)
const fetchPassengersProvider = FetchPassengersFamily();

/// See also [fetchPassengers].
class FetchPassengersFamily extends Family<AsyncValue<List<Passenger>>> {
  /// See also [fetchPassengers].
  const FetchPassengersFamily();

  /// See also [fetchPassengers].
  FetchPassengersProvider call({
    int page = 0,
  }) {
    return FetchPassengersProvider(
      page: page,
    );
  }

  @override
  FetchPassengersProvider getProviderOverride(
    covariant FetchPassengersProvider provider,
  ) {
    return call(
      page: provider.page,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchPassengersProvider';
}

/// See also [fetchPassengers].
class FetchPassengersProvider
    extends AutoDisposeFutureProvider<List<Passenger>> {
  /// See also [fetchPassengers].
  FetchPassengersProvider({
    this.page = 0,
  }) : super.internal(
          (ref) => fetchPassengers(
            ref,
            page: page,
          ),
          from: fetchPassengersProvider,
          name: r'fetchPassengersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchPassengersHash,
          dependencies: FetchPassengersFamily._dependencies,
          allTransitiveDependencies:
              FetchPassengersFamily._allTransitiveDependencies,
        );

  final int page;

  @override
  bool operator ==(Object other) {
    return other is FetchPassengersProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
