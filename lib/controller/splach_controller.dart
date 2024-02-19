import 'package:dairy_calculator/utils/routes.dart';
import 'package:get/get.dart';

class SplachScreenController extends GetxController {
  static SplachScreenController get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    animate.value = true;
    //await Future.delayed(Duration(milliseconds: 5000));
    
  }
}
