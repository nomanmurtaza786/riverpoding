// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:superwizor/constants/router_constatns.dart';

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
                title: 'Activity Screen',
                buttonText: 'Activity Screen',
                page: RouterConstants.activity,
              ),
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

class HomeContent extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        OutlinedButton(
          onPressed: () {
            //navigate to activity screen using material page route
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => page),
            // );
            context.push(page);
          },
          style: OutlinedButton.styleFrom(
            textStyle: Theme.of(context).textTheme.titleMedium,
            foregroundColor: Theme.of(context).colorScheme.primary,
            side: BorderSide(color: Theme.of(context).colorScheme.primary),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          child: Text(buttonText),
        )
      ],
    );
  }
}
