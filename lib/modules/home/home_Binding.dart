import 'package:get/get.dart';
import 'package:video_recorder_flutter_demo/modules/home/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }

}