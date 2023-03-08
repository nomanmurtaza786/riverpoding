// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$apiServicesHash() => r'b97d2ee4306b557d0b0ad9f129233781f40c5d8c';

/// See also [apiServices].
@ProviderFor(apiServices)
final apiServicesProvider = AutoDisposeProvider<ApiServices>.internal(
  apiServices,
  name: r'apiServicesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$apiServicesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ApiServicesRef = AutoDisposeProviderRef<ApiServices>;
String _$fetchActivitiesHash() => r'433f97b772a837664fb919a0cab1b5e21cac38fa';

/// See also [fetchActivities].
@ProviderFor(fetchActivities)
final fetchActivitiesProvider =
    AutoDisposeFutureProvider<ActivityModel>.internal(
  fetchActivities,
  name: r'fetchActivitiesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchActivitiesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchActivitiesRef = AutoDisposeFutureProviderRef<ActivityModel>;
String _$fetchActivities2Hash() => r'7471277fb90767b9992c28ac31151fc80bf17946';

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
String _$fetchPassengersHash() => r'fb9e1c7e68b2338e1fa9182fb9ba2d6b97e86a12';

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
    int page = 1,
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
    this.page = 1,
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
