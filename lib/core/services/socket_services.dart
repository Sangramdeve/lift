import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService {
  static final SocketService _instance = SocketService._internal();

  factory SocketService() => _instance;

  late io.Socket _socket;

  SocketService._internal();

  //Initialize the socket connection
  void connect(String url, {Map<String, dynamic>? queryParams}) {
    _socket = io.io(
      url,
      io.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .setQuery(queryParams ?? {})
          .build(),
    );

    _socket.connect();

    _socket.onConnect((_) => print('Connected to Socket Server'));
    _socket.onDisconnect((_) => print('Disconnected from Socket Server'));
    _socket.onError((error) => print('Socket Error: $error'));
  }

  void emit(String event, dynamic data) {
    _socket.emit(event, data);
  }

  void on(String event, Function(dynamic) callback) {
    _socket.on(event, (data) => callback(data));
  }

  void off(String event) {
    _socket.off(event);
  }

  void disconnect() {
    _socket.disconnect();
  }

  bool isConnected() => _socket.connected;
  bool isDisconnected() => _socket.disconnected;
}
