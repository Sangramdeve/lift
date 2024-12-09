import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lift/bloc/soket_bloc/socket_bloc.dart';
import 'package:lift/bloc/soket_bloc/socket_event.dart';
import 'package:lift/bloc/soket_bloc/socket_state.dart';
import 'package:lift/ui/chat_layout/widgets/chat_input_field.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) =>
          SocketBloc(RepositoryProvider.of(context))..add(SocketConnect()),
      child: const ChatLayout(),
    ));
  }
}

class ChatLayout extends StatelessWidget {
  const ChatLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
      ),
      body: Column(
        children: [
          BlocListener<SocketBloc, SocketState>(
              listener: (context, state) {
                if (state.connected) {
                  print('socket initialized');
                } else if (state.disconnect) {
                  print('socket disconnect');
                  context.read<SocketBloc>().add(SocketReconnect());
                }
              },
              child: Flexible(
                child: ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      return Row(
                        mainAxisAlignment: message.id == 1
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [Text(message.message)],
                      );
                    }),
              )),
          ChatInputField(
            onButtonPressed: () {
              context.read<SocketBloc>().add(SendMessage());
            },
          )
        ],
      ),
    );
  }
}

List<Message> messages = [
  Message(id: 1, message: 'message'),
  Message(id: 2, message: 'message'),
  Message(id: 1, message: 'message'),
  Message(id: 2, message: 'message'),
  Message(id: 1, message: 'message'),
  Message(id: 1, message: 'message'),
];

class Message {
  final int id;
  final String message;

  Message({required this.id, required this.message});
}
