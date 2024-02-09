
import 'package:dairy_calculator/repo/notification.dart';
import 'package:dairy_calculator/utils/localpreferences.dart';
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
late String name = '';
  @override
  void initState() {
    super.initState();
    notification.requestNotificationPermission();
    notification.firebaseInit(context);
    // notification.isRefreshToken();
    notification.getDeviceToken().then((value) {
      print("Your device token $value");
    });
      LocaleStorage.getProfile().then((profile) {
      setState(() {
        name = profile['name'] ?? '';
      });
    });
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
                text:name.isNotEmpty
                    ? "${name.substring(0, 1).toUpperCase()}${name.substring(1)}"
                    : '',
              )
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 5.w, top: 10.h),
              child: InkWell(
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
                      text:name.isNotEmpty
                    ?  name.substring(0, 1).toUpperCase():"S",
                      color: Colors.white,
                      fontSize: 17.sp,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 150.h,
                    width: 150.w,
                    decoration: const BoxDecoration(
                      color: Colors.red
                    ),
                    child: const Column(
                      children: [Text("data1")],
                    ),
                  ),
                   Container(
                    height: 150.h,
                    width: 150.w,
                    decoration: const BoxDecoration(
                      color: Colors.red
                    ),
                    child: const Column(
                      children: [Text("data2")],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   Container(
                    height: 150.h,
                    width: 150.w,
                    decoration: const BoxDecoration(
                      color: Colors.red
                    ),
                    child: const Column(
                      children: [Text("data3")],
                    ),
                               ),
                   Container(
                    height: 150.h,
                    width: 150.w,
                    decoration: const BoxDecoration(
                      color: Colors.red
                    ),
                    child: const Column(
                      children: [Text("data4")],
                    ),
                               ),
                 ],
               ),
            ],
          ),
        ),
    ),
    );
  }
}
