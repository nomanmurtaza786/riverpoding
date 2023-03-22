//socket client provider
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/io.dart';

part 'socket_provider.g.dart';

@riverpod
IOWebSocketChannel socketClient(SocketClientRef ref) {
  final socket = IOWebSocketChannel.connect(
    'wss://demo.piesocket.com/v3/channel_123?api_key=VCXCEuvhGcBDP7XhiJJUDvR1e1D3eiVjgZ9VRiaV&notify_self',
    headers: {
      'transport': ['websocket'],
      'autoconnect': true,
    },
  );
  return socket;
}
