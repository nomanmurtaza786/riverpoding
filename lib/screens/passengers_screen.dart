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
      body: ref.watch(fetchPassengersProvider(page: 0)).when(
            data: (data) {
              return RefreshIndicator(
                onRefresh: () async {
                  ref.invalidate(fetchPassengersProvider(page: 0));
                },
                child: ListView.builder(
                  itemCount: data.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(data.data?[index].name ?? '');
                  },
                ),
              );
            },
            error: (error, stack) => Center(child: Text(error.toString())),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
