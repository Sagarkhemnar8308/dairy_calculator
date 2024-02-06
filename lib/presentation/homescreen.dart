import 'package:dairy_calculator/presentation/Information.dart';
import 'package:dairy_calculator/widget/bottom.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        bottomNavigationBar: const CustomBottomNavigationBar(),
        appBar: AppBar(
          title:  Text("Welcome  ${nameController.text}"),
        ),
        body: const Column(
          children: [
            Divider(),

          
            
        ]),
      ),
    );
  }
}
