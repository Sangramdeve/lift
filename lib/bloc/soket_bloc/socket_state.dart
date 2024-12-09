import 'package:equatable/equatable.dart';

class SocketState extends Equatable {
  final bool connected;
  final bool connect_error;
  final bool disconnect;
  final bool error;
  final bool reconnect;
  final bool reconnect_attempt;
  final bool reconnect_failed;
  final bool reconnect_error;
  final String message;
  final bool pong;

  const SocketState(
      {required this.connected,
      required this.connect_error,
      required this.disconnect,
      required this.error,
      required this.reconnect,
      required this.reconnect_attempt,
      required this.reconnect_failed,
      required this.reconnect_error,
      required this.message,
      required this.pong});

  factory SocketState.Initial() {
    return const SocketState(
        connected: false,
        connect_error: false,
        disconnect: true,
        error: false,
        reconnect: false,
        reconnect_attempt: false,
        reconnect_failed: false,
        reconnect_error: false,
        message: '',
        pong: false);
  }

  SocketState copyWith({
    bool? connected,
    bool? connect_error,
    bool? disconnect,
    bool? error,
    bool? reconnect,
    bool? reconnect_attempt,
    bool? reconnect_failed,
    bool? reconnect_error,
    String? message,
    bool? pong,
  }) {
    return SocketState(
        connected: connected ?? this.connected,
        connect_error: connect_error ?? this.connect_error,
        disconnect: disconnect ?? this.disconnect,
        error: error ?? this.error,
        reconnect: reconnect ?? this.reconnect,
        reconnect_attempt: reconnect_attempt ?? this.reconnect_attempt,
        reconnect_failed: reconnect_failed ?? this.reconnect_error,
        reconnect_error: reconnect_error ?? this.reconnect_error,
        message: message ?? this.message,
        pong: pong ?? this.pong);
  }

  @override
  List<Object> get props => [
        connected,
        connect_error,
        disconnect,
        error,
        reconnect,
        reconnect_attempt,
        reconnect_failed,
        reconnect_error,
        message,
        pong
      ];
}
