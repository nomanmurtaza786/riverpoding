import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:superwizor/features/authentication/auth_manager.dart';
import 'package:superwizor/models/activity_model.dart';
import 'package:superwizor/services/api_services.dart';

part 'providers.g.dart';

@riverpod
List<ActivityModel> activityList(ActivityListRef ref) {
  return [];
}

//dio provider
final dioClient = Provider(
  (ref) {
    final accessToken = AuthManager.instance.accessToken;
    final _dio = Dio(
      BaseOptions(),
    )
      //   ..interceptors.add(
      //     AuthInterceptor(),
      //   )
      ..interceptors.add(
        PrettyDioLogger(requestBody: true, requestHeader: true),
      );
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (DioError e, _) async {
        if (e.response?.statusCode == 401) {
          print('noman --->' '401 error');
          final options = e.response?.requestOptions;
          print('noman --->' 'options: ${options?.path}}');

          // handle 401 error
          // for example, you can refresh the token and retry the request
          await AuthManager.instance.saveAccessToken('interceptortoken');
          final newToken = await _dio.post('/refreshToken');
          final _accessToken = AuthManager.instance.accessToken;

          // _dio.interceptors.responseLock.unlock();
          //options.headers['Authorization'] = 'Bearer $newToken';
          //_dio.options.headers['Authorization'] = 'Bearer 1212323124';
          await _dio.request(e.requestOptions.path);
        }
      },
    ));
    _dio.options.headers['Authorization'] = 'Bearer $accessToken';

    return _dio;
  },
);

@riverpod
Future<List<ActivityModel>> fetchActivities(FetchActivitiesRef ref) async {
  ref.onDispose(() {});

  final activities = ref.watch(activityListProvider);
  final activity = await ref.watch(apiServicesProvider).getActivity();

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
    print('disposed from fetchActivities');
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
