import 'package:dio/dio.dart';
import 'package:superwizor/features/authentication/auth_manager.dart';
import 'package:superwizor/local_persistence/local_storage.dart';
import 'package:superwizor/local_persistence/local_storage_keys.dart';

class JwtInterceptor extends Interceptor {
  static JwtInterceptor? _instance;
  // Avoid self instance
  JwtInterceptor._();
  static JwtInterceptor get instance {
    _instance ??= JwtInterceptor._();
    return _instance!;
  }

  final Dio _dio = Dio();
  final LocalStorage _localStorage = LocalStorage.instance;
  final AuthManager _authManager = AuthManager.instance;

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final options = err.response!.requestOptions;
      //remove auth token
      await _localStorage.remove(LocalStorageKeys.authToken);

      final refreshToken = _authManager.refreshToken;
      final response = await _dio.post(
        '/refresh-token',
        data: {'refresh_token': refreshToken},
      );

      if (response.statusCode == 200) {
        final newToken = response.data['access_token'];
        options.headers['Authorization'] = 'Bearer $newToken';
        await _dio.fetch(options);
        return;
      }
    }
    return super.onError(err, handler);
  }
}

class JwtTokenInterceptor extends Interceptor {}
