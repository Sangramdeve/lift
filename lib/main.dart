import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lift/bloc/repositories/repositories.dart';
import 'package:lift/core/services/notification_service.dart';
import 'package:lift/core/services/socket_services.dart';
import 'package:lift/firebase_options.dart';
import 'package:lift/route/route.dart';
import 'package:lift/route/route_name.dart';
import 'package:lift/theme.dart';

import 'bloc/auth_bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService.initialize();
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(create: (context) => BlocRepositories()),
      RepositoryProvider(create: (context)=> SocketService())
    ],
    child: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(RepositoryProvider.of(context)),
        )
      ],
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      initialRoute: routeName.chatScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
