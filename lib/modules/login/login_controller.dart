
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final controller = TextEditingController();
  final validate = Rx<bool?>(null);


  @override void onInit() {
    // TODO: implement onInit
    super.onInit();
    controller.addListener(() {
      if(validate.value!=null || controller.text.isBlank!=true) {
        validate.value = controller.text.isBlank == true;
        update();
      }

     // Get.showSnackbar(GetSnackBar(title: "controller: ",message: validate.value.toString()));
    });
  }
  
}