import 'package:dairy_calculator/constant/color.dart';
import 'package:dairy_calculator/constant/images.dart';
import 'package:dairy_calculator/utils/localpreferences.dart';
import 'package:dairy_calculator/utils/routes.dart';
import 'package:dairy_calculator/widget/bottom.dart';
import 'package:dairy_calculator/widget/textform_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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

  final firstnameFormkey = GlobalKey<FormState>();
  final surnameFormkey = GlobalKey<FormState>();
  final villageFormkey = GlobalKey<FormState>();
  final pincodeFormkey = GlobalKey<FormState>();
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
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(top: 200.h, left: 20.w, right: 20.w),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(height: 100.h, child: Image.asset(Appimages.logoimg)),
                SizedBox(
                  height: 30.h,
                ),
                TextformFieldWidget(
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
                  onOutSideTap: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  controller: nameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  formKey: firstnameFormkey,
                  fontSize: 17.sp,
                  suffixIcon: GestureDetector(
                      onTap: () {
                        if (firstnameFormkey.currentState?.validate() ??
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
                ),
                SizedBox(
                  height: 10.h,
                ),
                showSurname
                    ? TextformFieldWidget(
                        focusNode: _surnamefocusNode,
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
                        fontSize: 17.sp,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        formKey: surnameFormkey,
                        onOutSideTap: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        controller: surnameController,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            if (surnameFormkey.currentState?.validate() ??
                                false) {
                              setState(() {
                                showVillage = true;
                              });
                            }
                          },
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            size: 30.sp,
                          ),
                        ),
                        hintText: " Surname  ",
                      )
                    : const SizedBox(),
                SizedBox(
                  height: 10.h,
                ),
                showVillage
                    ? TextformFieldWidget(
                        focusNode: _villagefocusNode,
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
                        onOutSideTap: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        controller: village,
                        fontSize: 17.sp,
                        formKey: villageFormkey,
                        hintText: " Village ",
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            if (villageFormkey.currentState?.validate() ??
                                false) {
                              setState(() {
                                showpincode = true;
                              });
                            }
                          },
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            size: 30.sp,
                          ),
                        ),
                      )
                    : const SizedBox(),
                SizedBox(
                  height: 10.h,
                ),
                showpincode
                    ? TextformFieldWidget(
                        focusNode: _pincodefocusNode,
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
                        onOutSideTap: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        controller: pincode,
                        fontSize: 17.sp,
                        formKey: pincodeFormkey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            if (pincodeFormkey.currentState?.validate() ??
                                false) {
                              setState(() {
                                showSubmit = true;
                              });
                            }
                          },
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            size: 30.sp,
                          ),
                        ),
                        hintText: "Your village Pincode ",
                      )
                    : const SizedBox(),
                SizedBox(
                  height: 10.h,
                ),
                showSubmit
                    ? Container(
                        height: 45.h,
                        width: double.infinity,
                        decoration: const BoxDecoration(color: Colors.red),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                              side: const BorderSide(color: Colors.red),
                            ),
                          ),
                          onPressed: () {
                            LocaleStorage.saveProfile(
                                nameController.text,
                                surnameController.text,
                                village.text,
                                pincode.text);
                            context.push(Routes.home);
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(color: AppColors.whiteColor),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ])),
        ));
  }
}
