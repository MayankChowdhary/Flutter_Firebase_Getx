import 'package:get/get.dart';

class StoreController extends GetxController {
  var isWidgetEmpty = false.obs;

  void setIsEmpty(bool isEmpty) {
    isWidgetEmpty(isEmpty);
    update();
  }
}
