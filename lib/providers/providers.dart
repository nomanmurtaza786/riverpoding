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
    final _dio = Dio()
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            //auth token
            final _accessToken = AuthManager.instance.accessToken;
            options.headers['Authorization'] = 'Bearer ' + _accessToken;
            return handler.next(options);
          },
          onError: (DioError e, handler) async {
            if (e.response?.statusCode == 401) {
              print('noman --->' '401 error3');
              final path = e.response?.requestOptions.path ?? '';
              print('noman --->' + path);

              // handle 401 error
              // for example, you can refresh the token and retry the request

              //final newToken = await _dio.post('/refreshToken');
              final response = await Dio().post(
                'https://dummyjson.com/auth/login',
                data: {
                  'username': 'kminchelle',
                  'password': '0lelplR',
                  'expiresInMins': 1
                },
              );

              if (response.statusCode == 200) {
                final newToken = response.data['token'];
                await AuthManager.instance.saveAccessToken(newToken);

                final opts = Options(headers: {
                  'Authorization': 'Bearer ' + newToken,
                });
                final _response = await Dio().request(path, options: opts);
                handler.resolve(_response);
                return;
              }
            }
          },
        ),
      )
      ..interceptors.add(
        PrettyDioLogger(requestBody: true, requestHeader: true),
      );

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
