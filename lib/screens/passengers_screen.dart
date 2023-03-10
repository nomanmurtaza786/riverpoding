import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:superwizor/providers/passengers_provider.dart';

class PassengersScreen extends ConsumerWidget {
  const PassengersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passengersData = ref.watch(passengersApiProvider);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Passengers'),
        ),
        body: passengersData.when(
          skipLoadingOnRefresh: true,
          data: (passengers) {
            return RefreshIndicator(
              onRefresh: () async {
                await ref.watch(passengersApiProvider.notifier).buildMore();
                return;
              },
              child: ListView.builder(
                itemCount: passengers.length,
                itemBuilder: (context, index) {
                  final passenger = passengers[index];
                  return ListTile(
                    title: Text(passenger.name ?? ''),
                    subtitle: Text(passenger.trips.toString()),
                  );
                },
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Text(error.toString()),
          ),
        ));
  }
}
