import 'package:dairy_calculator/presentation/Information.dart';
import 'package:dairy_calculator/repo/notification.dart';
import 'package:dairy_calculator/utils/routes.dart';
import 'package:dairy_calculator/widget/bottom.dart';
import 'package:dairy_calculator/widget/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  NotificationServices notification = NotificationServices();

  @override
  void initState() {
    super.initState();
    notification.requestNotificationPermission();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const CustomBottomNavigationBar(),
        appBar: AppBar(
          toolbarHeight: 80.h,
          automaticallyImplyLeading: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: "Welcome ",
                fontWeight: FontWeight.bold,
                fontSize: 25.sp,
              ),
              TextWidget(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                text:
                    " ${nameController.text.substring(0, 1).toUpperCase()}${nameController.text.substring(1)} ${surnameController.text}",
              )
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 5.w, top: 10.h),
              child:   InkWell(
                onTap: () {
                  context.push(Routes.profile);
                },
                child: Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(30.r)),
                  child: Center(
                    child: TextWidget(
                      text: nameController.text.substring(0, 1).toUpperCase(),
                      color: Colors.white,
                      fontSize: 17.sp,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        body: Column(children: [
          const Divider(),
          Row(
            children: [
              Container(
                height: 100.h,
              )
            ],
          ),
          Row(
            children: [],
          ),
          Row(
            children: [],
          ),
          Row(
            children: [],
          ),
        ]),
      ),
    );
  }
}
