import 'package:get/get.dart';
import 'package:video_recorder_flutter_demo/modules/home/home_controller.dart';

import 'login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }

}