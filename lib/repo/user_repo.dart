import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dairy_calculator/model/user_model.dart';
import 'package:get/get.dart';

class UserRepo extends GetxController {
  static UserRepo get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db.collection('client').add(user.toJson()).whenComplete(() {
      print(user.firstname);
      print(user.surname);
      print(user.village);
      print(user.pincode);
    }).catchError((onError) {
      print("Get Error To make a account !");
    });
  }
}
