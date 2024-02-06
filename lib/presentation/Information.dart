import 'package:dairy_calculator/presentation/signup_screen.dart';
import 'package:dairy_calculator/utils/routes.dart';
import 'package:dairy_calculator/widget/bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

TextEditingController nameController = TextEditingController(text: '');
TextEditingController surnameController = TextEditingController(text: '');
TextEditingController pincode = TextEditingController(text: '');
TextEditingController village = TextEditingController(text: '');

final formkey = GlobalKey<FormState>();

bool showSurname = false;
bool showVillage = false;
bool showpincode = false;
bool showSubmit = false;

class _InformationState extends State<Information> {
  final FocusNode _namefocusNode = FocusNode();
   final FocusNode _surnamefocusNode = FocusNode();
    final FocusNode _villagefocusNode = FocusNode();
     final FocusNode _pincodefocusNode = FocusNode();
  @override
  void dispose() {
    _namefocusNode.dispose();
    _surnamefocusNode.dispose();
    _villagefocusNode.dispose();
      _pincodefocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: const CustomBottomNavigationBar(),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.only(top: 200.h, left: 20.w, right: 20.w),
            child: Form(
                key: formkey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextFormField(
                        focusNode: _namefocusNode,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "कृपया प्रथम नाव प्रविष्ट करा";
                          }
                          RegExp regex = RegExp(r'^[^ ](?!.*\s\s).*');

                          if (!regex.hasMatch(value)) {
                            return "कृपया बरोबर नाव टाका";
                          }

                          return null;
                        },
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        controller: nameController,
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
                                  if (formkey.currentState?.validate() ??
                                      false) {
                                    setState(() {
                                      showSurname = true;
                                    });
                                  }
                                },

                                child: Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 30.sp,
                                )),
                            hintText: " First Name ",
                            hintStyle: const TextStyle(color: Colors.black)),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      showSurname
                          ? TextFormField(
                              focusNode: _surnamefocusNode,
                              inputFormatters: [],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return " कृपया आडनाव प्रविष्ट करा";
                                }
                                RegExp regex = RegExp(r'^[^ ](?!.*\s\s).*');

                                if (!regex.hasMatch(value)) {
                                  return "कृपया बरोबर नाव टाका";
                                }

                                return null;
                              },
                              onTapOutside: (event) {
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              controller: surnameController,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 17.sp),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 20.0),
                                  border: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  errorBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  suffixIconColor: Colors.black,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      if (formkey.currentState?.validate() ??
                                          false) {
                                        setState(() {
                                          showVillage = true;
                                        });
                                      }
                                    },
                                    child: showVillage
                                        ? SizedBox(
                                            height: 10.h,
                                            width: 10.w,
                                            child: Lottie.asset(
                                                "asset/loader.json"),
                                          )
                                        : Icon(
                                            Icons.arrow_forward_rounded,
                                            size: 30.sp,
                                          ),
                                  ),
                                  hintText: " Surname  ",
                                  hintStyle:
                                      const TextStyle(color: Colors.black)),
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: 10.h,
                      ),
                      showVillage
                          ? TextFormField(
                              focusNode: _villagefocusNode,
                              inputFormatters: [],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return " कृपया गावाचे नाव प्रविष्ट करा";
                                }
                                RegExp regex = RegExp(r'^[^ ](?!.*\s\s).*');

                                if (!regex.hasMatch(value)) {
                                  return "कृपया बरोबर गावाचे नाव टाका";
                                }

                                return null;
                              },
                              onTapOutside: (event) {
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              controller: village,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 17.sp),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 20.0),
                                  border: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  errorBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  suffixIconColor: Colors.black,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      if (formkey.currentState?.validate() ??
                                          false) {
                                        setState(() {
                                          showpincode = true;
                                        });
                                      }
                                    },
                                    child: showpincode
                                        ? SizedBox(
                                            height: 10.h,
                                            width: 10.w,
                                            child: Lottie.asset(
                                                "asset/loader.json"),
                                          )
                                        : Icon(
                                            Icons.arrow_forward_rounded,
                                            size: 30.sp,
                                          ),
                                  ),
                                  hintText: " Village ",
                                  hintStyle:
                                      const TextStyle(color: Colors.black)),
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: 10.h,
                      ),
                      showpincode
                          ? TextFormField(
                              focusNode: _pincodefocusNode,
                              inputFormatters: [],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return " कृपया सहा अंकी पिनकोड वैध प्रविष्ट करा";
                                }
                                RegExp regex = RegExp(r'^[^ ](?!.*\s\s).*');

                                if (!regex.hasMatch(value)) {
                                  return "कृपया बरोबर  सहा अंकी पिनकोड टाका";
                                }

                                return null;
                              },
                              onTapOutside: (event) {
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              controller: otpController,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 17.sp),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 20.0),
                                  border: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  errorBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  suffixIconColor: Colors.black,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      if (formkey.currentState?.validate() ??
                                          false) {
                                        setState(() {
                                          showSubmit = true;
                                        });
                                      }
                                    },
                                    child: showSubmit
                                        ? SizedBox(
                                            height: 10.h,
                                            width: 10.w,
                                            child: Lottie.asset(
                                                "asset/loader.json"),
                                          )
                                        : Icon(
                                            Icons.arrow_forward_rounded,
                                            size: 30.sp,
                                          ),
                                  ),
                                  hintText: "Your village Pincode ",
                                  hintStyle:
                                      const TextStyle(color: Colors.black)),
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: 10.h,
                      ),
                      showSubmit
                          ? Container(
                              color: Colors.white,
                              height: 60.h,
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        side: const BorderSide(color: Colors.black)),
                                    backgroundColor: Colors.white,
                                    disabledBackgroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    context.push(Routes.home);
                                  },
                                  child: const Text("Submit")),
                            )
                          : const SizedBox(),
                    ]))));
  }
}
