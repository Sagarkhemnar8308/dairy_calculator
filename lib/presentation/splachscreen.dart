import 'package:dairy_calculator/utils/routes.dart';
import 'package:dairy_calculator/widget/bottom.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
 
 @override
  void initState() {
  Future.delayed(const Duration(seconds: 3), () {
      context.push(Routes.signup);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        body: Center(
          child: Image.asset("asset/CowLogo.png"),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
