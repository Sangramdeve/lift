
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lift/core/services/socket_services.dart';

import 'socket_event.dart';
import 'socket_state.dart';


class SocketBloc extends Bloc<SocketEvent, SocketState> {
  final SocketService socketService;
  SocketBloc(this.socketService) : super(SocketState.Initial()) {

    on<SocketConnect>((event, emit) async{
      socketService.connect('http://192.168.242.207:3000/');
      await Future.delayed(const Duration(milliseconds: 100)).then((_){
        emit(state.copyWith(
            connected: socketService.isConnected(),
          disconnect: socketService.isDisconnected(),
        ));
      });
    });

    on<SocketReconnect>((event, emit) async{
      print('socket Reconnecting...');
      await Future.delayed(const Duration(milliseconds: 500)).then((_){
        emit(state.copyWith(
          connected: socketService.isConnected(),
          disconnect: socketService.isDisconnected(),
        ));
      });
    });

    on<SocketDisconnect>((event, emit)async {
      socketService.disconnect();
      emit(state.copyWith(
        disconnect: socketService.isDisconnected(),
        connected: false,
      ));
    });
    
    on<SendMessage>((event, emit)async {
      Map<String,dynamic> message = {
        'message' : state.message
      };
      socketService.emit('send_message', message);
    });


    on<WatchMessage>((event, emit)async {
      emit(state.copyWith(
        message: event.message
      ));
      print('object${state.message}');
    });

  }
}