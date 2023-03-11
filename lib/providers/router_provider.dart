
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:superwizor/constants/router_constatns.dart';
import 'package:superwizor/screens/activity_screen.dart';
import 'package:superwizor/screens/home_screen.dart';
import 'package:superwizor/screens/passengers_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);
  return GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: router,
    routes: router.routes,
  );
});

class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this._router);
  final Ref _router;

  List<GoRoute> get routes => [
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
      ];
}
