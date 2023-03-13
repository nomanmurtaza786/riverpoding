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
      _localStorage.getString(LocalStorageKeys.authToken) != null;

  //getter to get user token
  String get token =>
      _localStorage.getString(LocalStorageKeys.authToken) ?? 'No Access token';

  //getter to get user refresh token
  String get refreshToken =>
      _localStorage.getString(LocalStorageKeys.refreshToken) ??
      'No Refresh token';

  //setter to set user token
  set setAccessToken(String token) => _localStorage.setString(
        key: LocalStorageKeys.authToken,
        value: token,
      );

  //setter to set user refresh token
  set setRefreshToken(String token) => _localStorage.setString(
        key: LocalStorageKeys.refreshToken,
        value: token,
      );
}
