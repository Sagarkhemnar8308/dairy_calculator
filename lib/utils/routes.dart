import 'package:dairy_calculator/presentation/homescreen.dart';
import 'package:dairy_calculator/presentation/signup_screen.dart';
import 'package:dairy_calculator/presentation/splachscreen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static String initial = '/';
  static String splachScreen = '/splach';
  static String home = '/home';
  static String signup = "/signup";

  GoRouter get router => _goRouter;
  late final GoRouter _goRouter =
      GoRouter(initialLocation: splachScreen, routes: [
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
    )
  ]);
}
