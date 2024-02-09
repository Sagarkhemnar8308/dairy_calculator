import 'package:dairy_calculator/widget/bottom.dart';
import 'package:dairy_calculator/widget/in_app_web_view.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       floatingActionButton:const Floating(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:CustomBottomNavigationBar(),
      body: Column(
        children: [Text("Notification")],
      ),
    );
  }
}