import 'package:dairy_calculator/widget/bottom.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        bottomNavigationBar:const CustomBottomNavigationBar(),
        body: Column(
          children: [Text("calculator")],
        ),
      ),
    );
  }
}