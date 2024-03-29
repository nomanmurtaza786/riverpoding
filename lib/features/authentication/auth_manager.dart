import 'package:superwizor/local_persistence/local_storage.dart';
import 'package:superwizor/local_persistence/local_storage_keys.dart';

class AuthManager {
  static AuthManager? _instance;
  // Avoid self instance
  AuthManager._();
  static AuthManager get instance {
    _instance ??= AuthManager._();
    return _instance!;
  }

  final LocalStorage _localStorage = LocalStorage.instance;

  //getter to check if user is logged in
  bool get isLoggedIn =>
      _localStorage.getString(LocalStorageKeys.accessToken) != null;

  //getter to get user token
  String get accessToken =>
      _localStorage.getString(LocalStorageKeys.accessToken) ??
      'No Access token';

  //getter to get user refresh token
  String get refreshToken =>
      _localStorage.getString(LocalStorageKeys.refreshToken) ??
      'No Refresh token';

  //setter to set user token
  Future<void> saveAccessToken(String token) => _localStorage.setString(
        key: LocalStorageKeys.accessToken,
        value: token,
      );

  //save access token to local storage fuction

  //remove Access token
  Future<void> removeAccessToken() async =>
      await _localStorage.remove(LocalStorageKeys.accessToken);

  //setter to set user refresh token
  set setRefreshToken(String token) => _localStorage.setString(
        key: LocalStorageKeys.refreshToken,
        value: token,
      );
}
