import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:superwizor/providers/providers.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //chat stream
    final chatStream = ref.watch(chatStreamProvider);
    final chatIsLoading = chatStream.isLoading;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          //chat is loading
          title: chatIsLoading
              ? const Text('Loading...')
              : const Text('Chat Screen'),
        ),
        body: chatStream.when(
          data: (data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Text(error.toString()),
          ),
        ));
  }
}
