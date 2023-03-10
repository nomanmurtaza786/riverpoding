import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:superwizor/models/activity_model.dart';
import 'package:superwizor/services/api_services.dart';

part 'providers.g.dart';

@Riverpod(
  keepAlive: true,
)
ApiServices apiServices(ApiServicesRef ref) {
  return ApiServices();
}

@riverpod
List<ActivityModel> activityList(ActivityListRef ref) {
  return [];
}

@riverpod
Future<List<ActivityModel>> fetchActivities(
    FetchActivitiesRef ref, bool isRefreshed) async {
  ref.onDispose(() {});

  final activities = ref.watch(activityListProvider);
  final activity = await ref.watch(apiServicesProvider).getActivity();
  if (isRefreshed) {
    activities.clear();
  }
  activities.add(activity);
  return activities;
}

@riverpod
Future<ActivityModel> fetchActivities2(FetchActivities2Ref ref) async {
  final activity = await ref.watch(apiServicesProvider).getActivity();
//timer to refresh the data
//   Timer(const Duration(seconds: 3), () {
//     ref.invalidateSelf();
//   });
  ref.onDispose(() {
    print('noman --->' 'fetch Activity 2 provider disposed');
  });

  return activity;
}

extension on AutoDisposeRef {
  // When invoked keeps your provider alive for [duration]
  void cacheFor(Duration duration) {
    final link = keepAlive();
    final timer = Timer(duration, link.close);
    onDispose(timer.cancel);
  }
}
