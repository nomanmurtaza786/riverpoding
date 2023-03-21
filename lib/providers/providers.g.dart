// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
String _$fetchActivitiesHash() => r'48d911eee7a3ccfa5b5cb70ee0f8a17632d52f2a';

/// See also [fetchActivities].
@ProviderFor(fetchActivities)
final fetchActivitiesProvider =
    AutoDisposeFutureProvider<List<ActivityModel>>.internal(
  fetchActivities,
  name: r'fetchActivitiesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchActivitiesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchActivitiesRef = AutoDisposeFutureProviderRef<List<ActivityModel>>;
String _$fetchActivities2Hash() => r'e568e331a3eef8efe900302651e582450fcb6b98';

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
String _$chatStreamHash() => r'86fc3bc4c8fe8f8e3f4956276b3627df7257fcdb';

/// See also [chatStream].
@ProviderFor(chatStream)
final chatStreamProvider = AutoDisposeStreamProvider<List<String>>.internal(
  chatStream,
  name: r'chatStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chatStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ChatStreamRef = AutoDisposeStreamProviderRef<List<String>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
