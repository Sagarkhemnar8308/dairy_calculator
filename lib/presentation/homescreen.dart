import 'package:dairy_calculator/presentation/Information.dart';
import 'package:dairy_calculator/presentation/profile_screen.dart';
import 'package:dairy_calculator/repo/notification.dart';
import 'package:dairy_calculator/utils/localpreferences.dart';
import 'package:dairy_calculator/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../controller/splach_controller.dart';

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
    SplachScreenController splachController = Get.put(SplachScreenController());
    splachController.startAnimation();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Icon(Icons.chat_rounded),
            )
          ],
        ),
        drawer: const ProfileScreen(),
        body: Stack(
          children: [
            Obx(
              () => AnimatedPositioned(
                  duration: Duration(milliseconds: 1600),
                  top: splachController.animate.value ? 80.h : -2,
                  left: splachController.animate.value ? 90.w : -5,
                  child: const Image(
                    image: AssetImage("asset/CowLogo.png"),
                    height: 200,
                    width: 200,
                  )),
            ),
            Obx(
              () => AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                top: 330.h,
                left: splachController.animate.value ? 30 : -80,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1600),
                  opacity: splachController.animate.value ? 1 : 0,
                  child: Column(
                    children: [
                      Container(
                        height: 130.h,
                        width: 130.h,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black),
                                top: BorderSide(color: Colors.black),
                                left: BorderSide(color: Colors.black),
                                right: BorderSide(color: Colors.black)),
                            image: DecorationImage(
                                image: AssetImage("asset/calci.png"),
                                fit: BoxFit.fill)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Obx(
              () => AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                top: 480.h,
                left: splachController.animate.value ? 30 : -80,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1600),
                  opacity: splachController.animate.value ? 1 : 0,
                  child: Column(
                    children: [
                      Container(
                        height: 130.h,
                        width: 130.h,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black),
                                top: BorderSide(color: Colors.black),
                                left: BorderSide(color: Colors.black),
                                right: BorderSide(color: Colors.black)),
                            image: DecorationImage(
                                image: AssetImage("asset/book.png"),
                                fit: BoxFit.fill)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Obx(
              () => AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                top: 330.h,
                left: splachController.animate.value ? 200.w : -80,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1600),
                  opacity: splachController.animate.value ? 1 : 0,
                  child: Column(
                    children: [
                      Container(
                        height: 130.h,
                        width: 130.h,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black),
                                top: BorderSide(color: Colors.black),
                                left: BorderSide(color: Colors.black),
                                right: BorderSide(color: Colors.black)),
                            image: DecorationImage(
                                image: AssetImage("asset/calci.png"),
                                fit: BoxFit.fill)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Obx(
              () => AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                top: 480.h,
                left: splachController.animate.value ? 200.w : -80,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1600),
                  opacity: splachController.animate.value ? 1 : 0,
                  child: InkWell(
                    onTap: () {
                      context.push(Routes.cowinfo);
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 130.h,
                          width: 130.h,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  top: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                  right: BorderSide(color: Colors.black)),
                              image: DecorationImage(
                                  image: AssetImage("asset/cowgame.png"),
                                  fit: BoxFit.fill)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
