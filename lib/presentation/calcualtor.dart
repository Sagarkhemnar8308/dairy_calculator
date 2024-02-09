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
    return  Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white,
          child:
              const Icon(Icons.play_circle_outline_sharp, color: Colors.grey),
        ),
      bottomNavigationBar:CustomBottomNavigationBar(),
      body: Column(
        children: [Text("calculator")],
      ),
    );
  }
}