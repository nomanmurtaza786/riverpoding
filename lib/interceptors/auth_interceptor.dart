// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:superwizor/local_persistence/local_storage.dart';
import 'package:superwizor/local_persistence/local_storage_keys.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = LocalStorage.instance
        .getString(LocalStorageKeys.authToken, defaultValue: 'DefaultToken');
    options.headers['Authorization'] = token;
    return super.onRequest(options, handler);
  }
}
