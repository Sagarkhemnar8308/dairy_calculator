import 'package:dairy_calculator/presentation/Information.dart';
import 'package:dairy_calculator/presentation/homescreen.dart';
import 'package:dairy_calculator/presentation/signup_screen.dart';
import 'package:dairy_calculator/presentation/splachscreen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static String initial = '/';
  static String splachScreen = '/splach';
  static String home = '/home';
  static String signup = "/signup";
  static String info='/info';

  GoRouter get router => _goRouter;
  late final GoRouter _goRouter =
      GoRouter(initialLocation: info, routes: [
    GoRoute(
      path: splachScreen,
      builder: (context, state) => const SplachScreen(),
    ),
    GoRoute(
      path: home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: signup,
      builder: (context, state) => const SignUp(),
    ),
     GoRoute(
      path: info,
      builder: (context, state) => const Information(),
    ),
  ]);
}
