import 'package:get/get.dart';
import 'package:flutter_firebase_getx/modules/home/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }

}