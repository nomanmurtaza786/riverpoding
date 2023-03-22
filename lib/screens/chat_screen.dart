import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';
import '../providers/socket_provider.dart';

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
      ),
      //chat bottom nav bar
      bottomNavigationBar: const BottomChatWidget(),
    );
  }
}

class BottomChatWidget extends ConsumerWidget {
  const BottomChatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final socket = ref.watch(socketClientProvider);

    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter message',
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              const String _payload = '{"message": "Hello bro"}';
              socket.sink.add(_payload);
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
