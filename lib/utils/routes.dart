import 'dart:html';

import 'package:dairy_calculator/presentation/Information.dart';
import 'package:dairy_calculator/presentation/calcualtor.dart';
import 'package:dairy_calculator/presentation/homescreen.dart';
import 'package:dairy_calculator/presentation/notification_screen.dart';
import 'package:dairy_calculator/presentation/profile_screen.dart';
import 'package:dairy_calculator/presentation/signup_screen.dart';
import 'package:dairy_calculator/presentation/splachscreen.dart';
import 'package:dairy_calculator/utils/localpreferences.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static String initial = '/';
  static String splachScreen = '/splach';
  static String home = '/home';
  static String signup = "/signup";
  static String profile = "/Profile";
  static String info = '/info';
  static String notify='/notify';
  static String calci='/calculator';

  GoRouter get router => _goRouter;
  late final GoRouter _goRouter =
      GoRouter(initialLocation: initilization(), routes: [
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
    GoRoute(
      path: profile,
      builder: (context, state) => const ProfileScreen(),
    ),    GoRoute(
      path: notify,
      builder: (context, state) => const NotificationScreen(),
    ),
       GoRoute(
      path: calci,
      builder: (context, state) => const CalculatorScreen(),
    )
  ]);

  String? initilization() {
    String? userID = LocaleStorage.instance.getString("userID");
    print("object user id is $userID");
    if (userID != null && userID.isNotEmpty) {
      return Routes.home;
    } else {
      return Routes.signup;
    }
  }
}
