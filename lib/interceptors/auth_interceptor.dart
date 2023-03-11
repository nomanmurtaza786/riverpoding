import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final String authToken;

  AuthInterceptor(this.authToken);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer 123';
    return super.onRequest(options, handler);
  }
}
