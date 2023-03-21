import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:superwizor/constants/router_constatns.dart';
import 'package:superwizor/screens/Login_screen.dart';
import 'package:superwizor/screens/activity_screen.dart';
import 'package:superwizor/screens/chat_screen.dart';
import 'package:superwizor/screens/home_screen.dart';
import 'package:superwizor/screens/passengers_screen.dart';
import 'package:superwizor/screens/products_screen.dart';

//navigatorKey: navigatorKey,
final navigatorkey = GlobalKey<NavigatorState>();
final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);
  return GoRouter(
    navigatorKey: navigatorkey,
    initialLocation: RouterConstants.home,
    debugLogDiagnostics: true,
    refreshListenable: router,
    routes: router.routes,
    redirect: (context, state) {
      print('noman --->router' '${state.location}');

      return null;
    },
  );
});

class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this._router);
  final Ref _router;

  String? _redirection(GoRouterState state) {
    if (state.path == RouterConstants.home) {
      return null;
    }

    return null;
  }

  List<GoRoute> get routes => [
        //login
        GoRoute(
            name: 'login',
            path: RouterConstants.login,
            builder: (context, state) {
              return const LoginScreen();
            }),
        GoRoute(
          path: RouterConstants.home,
          builder: (context, state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: RouterConstants.passengers,
          builder: (context, state) => const PassengersScreen(),
        ),
        GoRoute(
            path: RouterConstants.activity,
            builder: (context, state) => const ActivityScreen()),
        GoRoute(
          path: RouterConstants.products,
          builder: (context, state) => const ProductsScreen(),
        ),
        //chat screen
        GoRoute(
            path: RouterConstants.chat,
            builder: (context, state) {
              return const ChatScreen();
            }),
      ];
}
