import 'package:dairy_calculator/presentation/Information.dart';
import 'package:dairy_calculator/widget/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextWidget(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              text:
                  " ${nameController.text.substring(0, 1).toUpperCase()}${nameController.text.substring(1)} ${surnameController.text}",
            )
          ],
        ),
      ),
    );
  }
}
