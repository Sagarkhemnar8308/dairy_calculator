import 'package:dairy_calculator/model/user_model.dart';
import 'package:dairy_calculator/repo/user_repo.dart';
import 'package:get/get.dart';

class UserController extends GetxController{

static UserController get instance => Get.find();

final userRepo = Get.put(UserRepo());

Future<void> createUser(UserModel user)async{
  await userRepo.createUser(user);
}






}