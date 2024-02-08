import 'package:dairy_calculator/firebase_options.dart';
import 'package:dairy_calculator/utils/localpreferences.dart';
import 'package:dairy_calculator/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  GoRouter.optionURLReflectsImperativeAPIs = true;
  await LocaleStorage.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final appRoutes = Routes();
    return ScreenUtilInit(
      designSize: const Size(360, 760),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Dairy Calculator',
          routeInformationParser: appRoutes.router.routeInformationParser,
          routeInformationProvider: appRoutes.router.routeInformationProvider,
          routerDelegate: appRoutes.router.routerDelegate,
        );
      },
    );
  }
}
