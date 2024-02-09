import 'package:dairy_calculator/constant/images.dart';
import 'package:dairy_calculator/utils/localpreferences.dart';
import 'package:dairy_calculator/utils/routes.dart';
import 'package:dairy_calculator/widget/bottom.dart';
import 'package:dairy_calculator/widget/textform_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

TextEditingController mobileController = TextEditingController(text: '+91');
TextEditingController otpController = TextEditingController();
final mobileformkey = GlobalKey<FormState>();
final otpformkey = GlobalKey<FormState>();
bool showOtpField = false;
bool isSendingOTP = false;
bool info = false;
String? verifyId;

class _SignUpState extends State<SignUp> {
  final FocusNode _focusNodemobile = FocusNode();
  final FocusNode _focusNodeotp = FocusNode();

  @override
  void dispose() {
    _focusNodemobile.dispose();
    _focusNodeotp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: const CustomBottomNavigationBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 200.h, left: 20.w, right: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 150.h, child: Image.asset(Appimages.logoimg)),
              SizedBox(
                height: 30.h,
              ),
              TextformFieldWidget(
                focusNode: _focusNodemobile,
                formKey: mobileformkey,
                inputFormater: [
                  LengthLimitingTextInputFormatter(13),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return " कृपया मोबाइल नंबर टाका";
                  }
                  if (value.length != 13) {
                    return "+91 कृपया 10 अंकी नंबर टाका ";
                  }
                  return null;
                },
                onOutSideTap: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                controller: mobileController,
                fontSize: 17.sp,
                fontWeight: FontWeight.normal,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                suffixIcon: GestureDetector(
                  onTap: () async {
                    if (mobileformkey.currentState?.validate() ?? false) {
                      setState(() {
                        isSendingOTP = true;
                      });
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        verificationCompleted:
                            (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException ex) {},
                        codeSent: (String verificationId, int? resendtoken) {
                          setState(() {
                            verifyId = verificationId;
                            message();
                            showOtpField = true;
                            isSendingOTP = false;
                            print("verifyid $verifyId");
                            print("token $resendtoken");
                          });
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                        phoneNumber: mobileController.text.toString(),
                      );
                    }
                  },
                  child: isSendingOTP
                      ? SizedBox(
                          height: 10.h,
                          width: 10.w,
                          child: Lottie.asset("asset/loader.json"),
                        )
                      : Icon(
                          Icons.arrow_forward_rounded,
                          size: 30.sp,
                        ),
                ),
                hintText: "Enter Mobile Number ",
              ),
              SizedBox(
                height: 20.h,
              ),
              showOtpField
                  ? TextformFieldWidget(
                      focusNode: _focusNodeotp,
                      inputFormater: [
                        LengthLimitingTextInputFormatter(6),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter OTP ";
                        }
                        if (verifyId.toString() != value) {
                          return "please enter correct otp";
                        }
                        return null;
                      },
                      onOutSideTap: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      formKey: otpformkey,
                      controller: otpController,
                      fontSize: 17.sp,
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: verifyId.toString(),
                                  smsCode: otpController.text.toString());
                          FirebaseAuth.instance
                              .signInWithCredential(credential)
                              .then((value) async {
                            print('User token: ${value.user?.uid}');
                            LocaleStorage.saveUserID(
                                value.user?.uid.toString() ?? "");

                            setState(() {
                              info = true;
                              context.push(Routes.info);
                            });
                          });
                        },
                        child: info
                            ? SizedBox(
                                height: 10.h,
                                width: 10.w,
                                child: Lottie.asset("asset/loader.json"),
                              )
                            : Icon(
                                Icons.arrow_forward_rounded,
                                size: 30.sp,
                              ),
                      ),
                      hintText: " Enter 6 digit otp  ",
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  message() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.green,
      content: Text("Otp Send Successfully"),
    ));
  }

  invalidmessage() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.red,
      content: Text("Invaild Otp"),
    ));
  }
}
