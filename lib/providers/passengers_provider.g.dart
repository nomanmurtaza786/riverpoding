// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passengers_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchPassengersHash() => r'dac1355966dc7100d20ecb414d2322eea8929aff';

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

String _$passengersApiHash() => r'10fc2bedcbf8a8368ef8b4a3dae07438a331c3d8';

/// See also [PassengersApi].
@ProviderFor(PassengersApi)
final passengersApiProvider =
    AutoDisposeAsyncNotifierProvider<PassengersApi, List<Passenger>>.internal(
  PassengersApi.new,
  name: r'passengersApiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$passengersApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PassengersApi = AutoDisposeAsyncNotifier<List<Passenger>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
