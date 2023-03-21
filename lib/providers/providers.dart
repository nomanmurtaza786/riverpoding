import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:superwizor/constants/router_constatns.dart';
import 'package:superwizor/features/authentication/auth_manager.dart';
import 'package:superwizor/models/activity_model.dart';
import 'package:superwizor/models/chat_model.dart';
import 'package:superwizor/providers/router_provider.dart';
import 'package:superwizor/services/api_services.dart';
import 'package:web_socket_channel/io.dart';

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
              final path = e.response?.requestOptions.path ?? '';

              //final newToken = await _dio.post('/refreshToken');
              try {
                //refreshing token
                final response = await Dio().post(
                  'https://dummyjson.com/auth/loginnew',
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
                  //retry the request
                  final _response = await Dio().request(path, options: opts);
                  handler.resolve(_response);
                  return;
                }
              } on Exception {
                navigatorkey.currentState!.context.go(RouterConstants.login);
                return handler.reject(e);
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

//riverpod stream provider
@riverpod
Stream<List<String>> chatStream(ChatStreamRef ref) async* {
  final activities = <String>[];
  //web socket connection

  final socket = IOWebSocketChannel.connect(
    'wss://demo.piesocket.com/v3/channel_123?api_key=VCXCEuvhGcBDP7XhiJJUDvR1e1D3eiVjgZ9VRiaV&notify_self',
    headers: {
      'transport': ['websocket'],
      'autoconnect': false,
    },
  )..sink.add('test');
//ref resume
  ref.onCancel(() {
    print('canel from chatStream');
  });
  ref.onDispose(socket.sink.close);

//event contain message string

  //filter the data
  await for (final event
      in socket.stream.where((event) => event.toString().contains('message'))) {
        
    final Map<String, dynamic> data = jsonDecode(event);
    final ChatModel chatMessage = ChatModel.fromJson(data);
    print('noman ---> chat message ' + chatMessage.message!);

    activities.add(
      chatMessage.message ?? '',
    );
    ref.state = AsyncData(activities);
  }

  socket.stream.listen(
    (event) async {
      print('noman --->' '$event');
      activities.add(
        event.toString(),
      );
      ref.state = AsyncData(activities);
    },
  );
}

extension on AutoDisposeRef {
  // When invoked keeps your provider alive for [duration]
  void cacheFor(Duration duration) {
    final link = keepAlive();
    final timer = Timer(duration, link.close);
    onDispose(timer.cancel);
  }
}
