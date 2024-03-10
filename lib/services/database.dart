import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gallery_picker/gallery_picker.dart';

Future<void> signInUserAnon() async {
  try {
    final userCredential = await FirebaseAuth.instance.signInAnonymously();
    if (kDebugMode) {
      print("signed in with temporary account . UID ${userCredential}");
    }
  } catch (e) {}
}

Future<File?> getImageFromGallery(BuildContext context) async {
  try {
    List<MediaFile>? singleMedia= await GalleryPicker.pickMedia(context: context, singleMedia: true);
    return singleMedia?.first.getFile();
  } catch (e) {
    print("Getting error to upload a image on firebase");
  }
  return null;
}

Future<bool> uploadFileForUser(File file)async{
  try {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final storageRef= FirebaseStorage.instance.ref();
    final filepath= file.path.split("/").last;
    final timestamp= DateTime.now().microsecondsSinceEpoch;
    
    final uploadref= storageRef.child("$userId/uploads/$timestamp-$filepath");
    await uploadref.putFile(file);
    return true;
  } catch (e) {
    return false;
  }
} 

class ContactMethod {
  Future addEmployeeDetails(
      Map<String, dynamic> employeeInfoMap, String id) async {
    try {
      return await FirebaseFirestore.instance
          .collection("CowData")
          .doc(id)
          .set(employeeInfoMap);
    } catch (e) {
      print("$e");
    }
  }

  Future<Stream<QuerySnapshot>> getEmployeeDetails() async {
    return await FirebaseFirestore.instance.collection("CowData").snapshots();
  }

  Future updateEmployeeDetails(
      String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection("CowData")
        .doc(id)
        .update(updateInfo);
  }

  Future deleteEmployeeDetails(String id) async {
    return await FirebaseFirestore.instance
        .collection("CowData")
        .doc(id)
        .delete();
  }

  // Future<String> uploadImage(String path, XFile img) async {
  //   try {
  //     final ref = FirebaseStorage.instance.ref(path).child(img.name);
  //     await ref.putFile(File(img.path));
  //     final url = await ref.getDownloadURL();
  //     return url;
  //   } catch (e) {
  //     print("Getting error to upload the image");
  //   }
  //   return "error";
  // }
}
