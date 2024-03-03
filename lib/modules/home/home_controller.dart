import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase_getx/modules/store/widget_state_arg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {


   Reference? storageImageDir ;
  late Reference storageImageRef ;

  var imageUrl = "".obs;
  late dynamic argumentData;

  var isWidgetEmpty = true.obs;
  var isTextSelected = false.obs;
  var isImageSelected = false.obs;
  var isButtonSelected = false.obs;

  final textDataController = TextEditingController();

  var addMoreMessage = false.obs;
  final ImagePicker imagePicker = ImagePicker();
  XFile? imagePath;

  @override
  void onInit() {
    super.onInit();
    addMoreMessage(false);
    argumentData = Get.arguments;
    if (argumentData != null) {
      setIsWidgetSelectedArgs(argumentData as WidgetStateArg);
    }
    setIsEmpty();

      var storage = FirebaseStorage.instanceFor(
          bucket: "gs://flutterfirebasegetx-dc999.appspot.com");
      var storageRoot = storage.ref();
      storageImageDir = storageRoot.child("images");

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

  Future getImage() async {
    imagePath = await imagePicker.pickImage(source: ImageSource.gallery);
    update();
  }

  void uploadImage() async{
    if(storageImageDir==null) {
      Get.snackbar("Error", "Firebase initialization failed!");
      return;
    }
    var fileName = "img_sample.jpg";
    storageImageRef = storageImageDir!.child(fileName);
    try {
      await storageImageRef.putFile(File(imagePath!.path));
      imageUrl.value = await storageImageRef.getDownloadURL ();
      Get.snackbar("Firebase message", "Image Successfully Uploaded");
      print("ImageURl: ${imageUrl.value}");
      update();
    } catch (e) {
      print(e);
    }

  }
}
