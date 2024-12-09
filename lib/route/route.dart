
import 'package:lift/ui/chat_layout/chat_screen.dart';

import '../ui/ui.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case routeName.mapScreen:
        return MaterialPageRoute(builder: (context) => const MapScreen());
      case routeName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case routeName.permissionScreen:
        return MaterialPageRoute(builder: (context) => const PermissionsActivity());
      case routeName.loginScreen:
        return MaterialPageRoute(builder: (context) =>  const Login());
      case routeName.signupScreen:
        return MaterialPageRoute(builder: (context) =>  Signup());
      case routeName.chatScreen:
        return MaterialPageRoute(builder: (context) =>  const ChatScreen());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text('Screen not found'),
            ),
          );
        });
    }
  }
}
