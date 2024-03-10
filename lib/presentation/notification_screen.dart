import 'package:dairy_calculator/repo/notification.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationServices _notificationServices = NotificationServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      //  bottomNavigationBar: const CustomBottomNavigationBar(),
        appBar: AppBar(title: const Text("Notifications"), titleSpacing: 0,),
        body: ListView.builder(
          itemBuilder: (context,index) {
            return ListTile(
              title: Text("${_notificationServices.notificationList.length}"),
              subtitle: const Text( "Body Not Found"),
            );
          },
          itemCount:4,
        ),
      ),
    );
  }
}
