import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:superwizor/providers/providers.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text('Activity Screen'),
        ),
        body: Column(
          children: [
            ActivityWidget(
              providerName: fetchActivities2Provider,
            ),
          ],
        ));
  }
}

class ActivityWidget extends ConsumerWidget {
  const ActivityWidget({super.key, required this.providerName});
  final AutoDisposeFutureProvider providerName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('noman --->');
    return Container(
      width: 200,
      height: 200,
      //border: Border.all(color: Colors.black),
      decoration: myBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ref.watch(providerName).when(
                data: (data) => Center(child: Text(data.activity ?? '')),
                error: (error, stack) => Center(child: Text(error.toString())),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          const SizedBox(
            height: 10,
          ),
          OutlinedButton(
            onPressed: () {
              ref.invalidate(providerName);
            },
            child: const Text(
              'Refresh',
            ),
          )
        ],
      ),
    );
  }
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    color: Colors.white,
    border: Border.all(
      color: Colors.red, //                   <--- border color
      width: 5.0,
    ),
  );
}
