import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
          padding: EdgeInsets.only(bottom: 9.h,top: 0.h,left: 20.w,right: 20.w),
          color: Colors.white,
          child: SizedBox(
            height: 65.h,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                Text(
                  "Powered by",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.sp,
                  ),
                ),
                Text(
                  "The Baap Company",
                  style: TextStyle(
                    color: const Color(0XFFE676A4),
                    fontSize: 15.sp,
                  ),
                )
              ],
            ),
          ),
        );
  }
}