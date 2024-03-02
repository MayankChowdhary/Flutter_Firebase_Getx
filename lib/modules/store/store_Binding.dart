import 'package:flutter_firebase_getx/modules/store/store_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_firebase_getx/modules/home/home_controller.dart';

class StoreBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => StoreController());
  }

}