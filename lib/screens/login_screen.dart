import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:superwizor/constants/router_constatns.dart';
import 'package:superwizor/screens/home_screen.dart';
import 'package:superwizor/services/api_services.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Login View'),
      ),
      body: Center(
          child: RpOutlineButton(
        onPress: () async {
          context.go(RouterConstants.home);
          await ref.read(apiServicesProvider).getLogin();
        },
        buttonText: 'Login',
      )),
    );
  }
}
