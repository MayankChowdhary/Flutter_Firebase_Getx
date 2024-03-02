import 'package:get/get.dart';

class HomeController extends GetxController {
  var isWidgetEmpty = false.obs;

  void setIsEmpty(bool isEmpty) {
    isWidgetEmpty(isEmpty);
    update();
  }
}
