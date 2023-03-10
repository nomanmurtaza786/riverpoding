// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:superwizor/models/authSession_model.dart';

// part 'auth_provider.g.dart';

// @riverpod
// class AuthNotifier extends _$AuthNotifier {
//   late final _dioClient = ref.read(dioClientProvider);

//   @override
//   FutureOr<AuthSessionModel?> build() async {
//     // Here goes Logic to retrieve token from shared preferences and verifiy is a valid token
//     // if token is valid, return AuthSession with token, user and isAuthenticated
//     // if token is invalid, return null and remove token from shared preferences

//     return null;
//   }

//   Future<void> login(String email, String password) async {
//     final response = await _dioClient.post('/mobile/auth/login', data: {
//       'email': email,
//       'password': password,
//       'device_name': 'Android',
//     });
//     ref.read(settingsRepositoryProvider).setToken(response.data);
//     final User user = await getUser(response.data);

//     state = AsyncValue.data(AuthSession(
//       authToken: response.data,
//       user: user,
//       isAuthenticated: true,
//     ));

//     // insert authToken, user and isAuthenticated in AuthSession
//   }
// }
