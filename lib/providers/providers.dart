import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:superwizor/models/activity_model.dart';
import 'package:superwizor/services/api_services.dart';

part 'providers.g.dart';

@riverpod
ApiServices apiServices(ApiServicesRef ref) {
  return ApiServices();
}

@riverpod
Future<ActivityModel> fetchActivities(FetchActivitiesRef ref) async {
  final activity = await ref.watch(apiServicesProvider).getActivity();
//timer to refresh the data
//   Timer(const Duration(seconds: 3), () {
//     ref.invalidateSelf();
//   });

  return activity;
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
