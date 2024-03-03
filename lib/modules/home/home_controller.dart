import 'package:flutter_firebase_getx/modules/store/widget_state_arg.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  late dynamic argumentData;

  var isWidgetEmpty = false.obs;
  var isTextSelected = false.obs;
  var isImageSelected = false.obs;
  var isButtonSelected = false.obs;

  @override
  void onInit() {
    super.onInit();
    argumentData = Get.arguments;
    if(argumentData!=null) {
      print("Back received  Data...");
      print("isTextSelected: ${argumentData.isTextSelected}");
      print("isImageSelected: ${argumentData.isImageSelected}");
      print("isButttonSelected: ${argumentData.isButtonSelected}");

      setIsWidgetSelectedArgs(argumentData as WidgetStateArg);
    }
  }

  void setIsWidgetSelected(bool isSelected, String name) {
    switch (name) {
      case 'Text':
        isTextSelected(isSelected);
        break;
      case 'Image':
        isImageSelected(isSelected);
        break;
      case 'Button':
        isButtonSelected(isSelected);
        break;
    }
  }

  void setIsWidgetSelectedArgs(WidgetStateArg args) {
      isTextSelected(args.isTextSelected);
      isImageSelected(args.isImageSelected);
      isButtonSelected(args.isButtonSelected);
      update();
    }

  void setIsEmpty() {
    if (isTextSelected.isFalse &&
        isImageSelected.isFalse &&
        isButtonSelected.isFalse) {
      isWidgetEmpty(true);
    } else {
      isWidgetEmpty(false);
    }
    update();
  }
}
