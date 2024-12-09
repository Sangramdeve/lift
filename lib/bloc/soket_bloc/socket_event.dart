import 'package:equatable/equatable.dart';

abstract class SocketEvent extends Equatable {
  const SocketEvent();

  @override
  List<Object> get props => [];
}

class SocketConnect extends SocketEvent {}

class SocketDisconnect extends SocketEvent {}

class SocketReconnect extends SocketEvent {}

class SendMessage extends SocketEvent {}

class WatchMessage extends SocketEvent {
  final String message;

  const WatchMessage({required this.message});

  @override
  List<Object> get props => [message];
}
