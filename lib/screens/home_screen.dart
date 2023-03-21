// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:superwizor/constants/router_constatns.dart';
import 'package:superwizor/services/api_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Center(
          child: Column(
            children: const [
              HomeContent(
                title: 'Chat Screen',
                buttonText: 'Chat Screen',
                page: RouterConstants.chat,
              ),
              HomeContent(
                title: 'Activity Screen',
                buttonText: 'Activity Screen',
                page: RouterConstants.activity,
              ),
              HomeContent(
                  title: 'Products',
                  buttonText: 'Products Screen',
                  page: RouterConstants.products),
              HomeContent(
                title: 'Passenger Screen',
                buttonText: 'Passenger Screen',
                page: RouterConstants.passengers,
              ),
            ],
          ),
        ));
  }
}

class HomeContent extends ConsumerWidget {
  final String title;
  final String buttonText;
  final String page;

  const HomeContent({
    Key? key,
    required this.title,
    required this.buttonText,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        RpOutlineButton(
            onPress: () {
              context.push(page);
            },
            buttonText: buttonText),
        RpOutlineButton(
          onPress: () async {
            await ref.read(apiServicesProvider).getLogin();
          },
          buttonText: 'Change Token',
        )
      ],
    );
  }
}

class RpOutlineButton extends StatelessWidget {
  const RpOutlineButton({
    Key? key,
    required this.onPress,
    required this.buttonText,
  }) : super(key: key);
  final VoidCallback onPress;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPress,
      style: OutlinedButton.styleFrom(
        textStyle: Theme.of(context).textTheme.titleMedium,
        foregroundColor: Theme.of(context).colorScheme.primary,
        side: BorderSide(color: Theme.of(context).colorScheme.primary),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      child: Text(buttonText),
    );
  }
}
