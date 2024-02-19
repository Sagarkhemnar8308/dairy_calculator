import 'dart:io';
import 'dart:typed_data';
import 'package:dairy_calculator/constant/color.dart';
import 'package:dairy_calculator/utils/localpreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Uint8List? _image;
  File? selectedIamge;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: InkWell(
        onTap: (){
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_sharp)),),
     // bottomNavigationBar: const CustomBottomNavigationBar(),
      body: FutureBuilder<Map<String, String?>>(
        future: LocaleStorage.getProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final profile = snapshot.data ?? {};
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      _image != null
                          ? CircleAvatar(
                              radius: 100.r,
                              backgroundImage: MemoryImage(_image!),
                            )
                          : CircleAvatar(
                              radius: 100.r,
                              backgroundImage:
                                  const AssetImage('asset/download.png'),
                            ),
                      Positioned(
                        bottom: 0.0,
                        right: 20.w,
                        child: Container(
                          height: 60.h,
                          width: 60.h,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(25.r)),
                          child: InkWell(
                            onTap: () {
                              showImagePicker(context);
                            },
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              size: 40.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
              Text(
                '${profile['name'] ?? ''} ${profile['surname'] ?? 'Not Found'}',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 23.sp,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                profile['village'] ?? 'Not Found',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          );
        },
      ),
    );
  }

  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  child: SizedBox(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            pickImageFromGallery();
                          },
                          child: Icon(
                            Icons.image,
                            size: 50.sp,
                          ),
                        ),
                        Text("Gallery",
                            style: TextStyle(
                                color: AppColors.borderColor, fontSize: 13.sp)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap:(){
                  pickImageFromCamera();
                  },
                  child: SizedBox(
                    child: Column(
                      children: [
                        InkWell(
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 50.sp,
                          ),
                        ),
                        Text(
                          "Camera",
                          style: TextStyle(
                              color: AppColors.borderColor, fontSize: 13.sp),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

//gallery
  Future pickImageFromGallery() async {
    final returnimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnimage == null) return;
    setState(() {
      selectedIamge = File(returnimage.path);
      _image = File(returnimage.path).readAsBytesSync();
    });
    context.pop();
  }

//camera
  Future pickImageFromCamera() async {
    final returnimage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnimage == null) return;
    setState(() {
      selectedIamge = File(returnimage.path);
      _image = File(returnimage.path).readAsBytesSync();
    });
    context.pop();
  }
}
