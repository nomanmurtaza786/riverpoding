import 'package:dio/dio.dart';
import 'package:superwizor/features/authentication/auth_manager.dart';
import 'package:superwizor/local_persistence/local_storage.dart';
import 'package:superwizor/local_persistence/local_storage_keys.dart';

class JwtInterceptor extends Interceptor {
  final Dio _dio = Dio();
  final LocalStorage _localStorage = LocalStorage.instance;
  final AuthManager _authManager = AuthManager.instance;

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      print('noman --->' '401 error2');
      final options = err.response!.requestOptions;
      //remove auth token
      await _localStorage.remove(LocalStorageKeys.accessToken);

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
