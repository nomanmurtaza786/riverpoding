// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:superwizor/features/authentication/auth_manager.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = AuthManager.instance.accessToken;
    options.headers['Authorization'] = 'Bearer $token';
    return super.onRequest(options, handler);
  }
}
