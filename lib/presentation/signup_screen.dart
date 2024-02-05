import 'package:dairy_calculator/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

TextEditingController mobileController = TextEditingController();
TextEditingController otpController = TextEditingController();
final formkey = GlobalKey<FormState>();
bool showOtpField = false;
bool showsignupbutton = false;

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 150.h, child: Image.asset("asset/CowLogo.png")),
              SizedBox(
                height: 30.h,
              ),
              TextFormField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return " कृपया मोबाइल नंबर टाका";
                  }
                  if (value.length != 10) {
                    return " कृपया 10 अंकी क्रमांक टाका";
                  }
                  return null;
                },
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                controller: mobileController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black, fontSize: 17.sp),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    suffixIconColor: Colors.black,
                    suffixIcon: GestureDetector(
                        onTap: () {
                          if (formkey.currentState?.validate() ?? false) {
                            setState(() {
                              showOtpField = true;
                            });
                          }
                        },
                        child: const Icon(Icons.arrow_forward_rounded)),
                    hintText: " Enter Mobile Number ",
                    hintStyle: const TextStyle(color: Colors.black)),
              ),
              SizedBox(
                height: 20.h,
              ),
              showOtpField
                  ? TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(6),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.black, fontSize: 17.sp),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20.0),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          suffixIconColor: Colors.black,
                          suffixIcon: GestureDetector(
                              onTap: () {
                                if (formkey.currentState?.validate() ?? false) {
                                  setState(() {
                                    showsignupbutton = true;
                                  });
                                }
                              },
                              child: const Icon(Icons.arrow_forward_rounded)),
                          hintText: " Enter 6 digit otp  ",
                          hintStyle: const TextStyle(color: Colors.black)),
                    )
                  : const SizedBox(),
              SizedBox(
                height: 20.h,
              ),
              showsignupbutton
                  ? SizedBox(
                      height: 57.h,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: const BorderSide(color: Colors.black),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)))),
                          onPressed: () {
                            context.push(Routes.home);
                          },
                          child: Text(
                            "Sign up",
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.sp),
                          )),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
