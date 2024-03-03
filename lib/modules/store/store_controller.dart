import 'package:flutter_firebase_getx/modules/store/widget_state_arg.dart';
import 'package:get/get.dart';

class StoreController extends GetxController {
  late dynamic argumentData;
  var isTextSelected = false.obs;
  var isImageSelected = false.obs;
  var isButtonSelected = false.obs;

  @override
  void onInit() {
    super.onInit();
    argumentData = Get.arguments;
    if(argumentData!=null) {
      print("Forward received  Data...");
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
        print("Text selection: $isSelected");
        break;
      case 'Image':
        isImageSelected(isSelected);
        print("Image selection: $isSelected");
        break;
      case 'Button':
        isButtonSelected(isSelected);
        print("Button selection: $isSelected");
        break;
    }
  }

  void setIsWidgetSelectedArgs(WidgetStateArg args) {
    isTextSelected(args.isTextSelected);
    isImageSelected(args.isImageSelected);
    isButtonSelected(args.isButtonSelected);
    update();
  }
}
