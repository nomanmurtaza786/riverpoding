import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:superwizor/models/activity_model.dart';
import 'package:superwizor/models/passengers_model.dart';
import 'package:superwizor/services/api_services.dart';

part 'providers.g.dart';

@riverpod
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

  return activity;
}

@riverpod
Future<List<Passenger>> fetchPassengers(FetchPassengersRef ref,
    {int page = 1}) async {
  if (page > 10) {
    return [];
  }
  final data = await ref.watch(apiServicesProvider).getPassengers(page: page);
  //final Totalpages = data.totalPages;
  final passengers = data.data ?? [];
  ref.keepAlive();

  return [...passengers];
}
