
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dairy_calculator/presentation/profile_screen.dart';
import 'package:dairy_calculator/repo/notification.dart';
import 'package:dairy_calculator/utils/localpreferences.dart';
import 'package:dairy_calculator/utils/routes.dart';
import 'package:flutter/foundation.dart';
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
    final List<String> imageList = [
    "data:image/jpeg;base64,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",
    "data:image/jpeg;base64,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",
    "data:image/jpeg;base64,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"
  ];
  NotificationServices notification = NotificationServices();
  late String name = '';
  @override
  void initState() {
    super.initState();
    notification.requestNotificationPermission();
    notification.firebaseInit(context);
    // notification.isRefreshToken();
    notification.getDeviceToken().then((value) {
      if (kDebugMode) {
        print("Your device token $value");
      }
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
              child: InkWell(onTap: () {
                context.push(Routes.notify);
              },child: const Icon(Icons.notifications_active_outlined, color:Colors.black87, size: 40,)),
            )
          ],
        ),
        drawerScrimColor: Colors.white,
        drawerEnableOpenDragGesture: true,
        drawer: const ProfileScreen(),
        body: Stack(
          children: [
           ListView(
          children: [
            Center(
              child: CarouselSlider(
                  items: imageList
                      .map((e) => ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Stack(fit: StackFit.expand, children: [
                              Image.network(
                                e,
                                width: 1050.0,
                                height: 350.0,
                                fit: BoxFit.cover,
                              )
                            ]),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                  )),
            )
          ],
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
                      InkWell(
                        onTap: () {
                          context.push(Routes.cowTable);
                        },
                        child: Container(
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
