import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:superwizor/providers/passengers_provider.dart';

class PassengersScreen extends ConsumerWidget {
  const PassengersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Passengers'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return ref.refresh(fetchPassengersProvider().future);
        },
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            final page = index ~/ 10;
            final itemIndex = index % 10;

            final pageData = ref.watch(fetchPassengersProvider(page: page));
            return pageData.when(
              data: (data) {
                // if (data.isEmpty) {
                //   return const ListTile(
                //     title: Text('No more data'),
                //   );
                // }
                if (itemIndex >= data.length) {
                  return null;
                }
                final passenger = data[itemIndex];
                return ListTile(
                  title: Text(passenger.name!),
                  subtitle: Text('${passenger.trips} trips'),
                );
              },
              loading: () {
                if (itemIndex != 0) {
                  return null;
                }
                return const Center(child: CircularProgressIndicator());
              },
              error: (error, stack) => ListTile(
                title: Text(error.toString()),
              ),
            );
          },
        ),
      ),
    );
  }
}
