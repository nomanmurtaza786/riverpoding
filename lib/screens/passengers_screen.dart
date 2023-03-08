import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:superwizor/providers/providers.dart';

class PassengersScreen extends ConsumerWidget {
  const PassengersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Passengers'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          final page = index ~/ 10;
          final itemIndex = index % 10;
          print('noman --->page $page');
          //print('noman ---> item index $itemIndex');
          final pageData = ref.watch(fetchPassengersProvider(page: page));
          return pageData.when(
            data: (data) {
              final passenger = data.data![itemIndex];
              return ListTile(
                title: Text(passenger.name!),
                subtitle: Text('${passenger.trips} trips'),
              );
            },
            loading: () => const ListTile(
              title: Text('Loading...'),
            ),
            error: (error, stack) => const ListTile(
              title: Text('Error'),
            ),
          );
        },
      ),
    );
  }
}
