import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:superwizor/providers/providers.dart';

class ActivityScreen extends ConsumerWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiservicec =ref.watch(apiServicesProvider);
   
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Activity Screen'),
      ),
      body: ref.watch(fetchActivitiesProvider).when(
            data: (data) => RefreshIndicator(
                onRefresh: () async {
                  ref.invalidate(fetchActivitiesProvider);
                },
                child: ListView(children: [Text(data.activity ?? '')])),
            error: (error, stack) => Center(child: Text(error.toString())),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
