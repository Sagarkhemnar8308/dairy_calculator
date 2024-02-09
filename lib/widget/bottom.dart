import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:dairy_calculator/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      height: 70.h,
      backgroundColor: Colors.white,
      inactiveColor: Colors.yellow,
      activeColor: Colors.grey,
      icons: const [
        Icons.home,
        Icons.calculate,
        Icons.notifications_active,
        Icons.account_circle_outlined
      ],
      activeIndex: _currentIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        if (index == 0) {
          context.push(Routes.home);
        } else if (index == 1) {
          context.push(Routes.calci);
        } else if (index == 2) {
          context.push(Routes.notify);
        } else if (index == 3) {
          context.push(Routes.profile);
        }
      },
    );
  }
}
