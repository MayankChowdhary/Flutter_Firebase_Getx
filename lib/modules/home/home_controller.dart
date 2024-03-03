import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase_getx/modules/store/widget_state_arg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {


   Reference? storageImageDir ;
  late Reference storageImageRef ;

   late CollectionReference firestoreCollection;

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

      var storage = FirebaseStorage.instance;
      var storageRoot = storage.ref();
      storageImageDir = storageRoot.child("images");

    firestoreCollection =  FirebaseFirestore.instance.collection('flutter_sample');
    getFirebaseData();

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
    Get.snackbar("Firebase message", "Uploading data...");
    var fileName = "img_sample.jpg";
    storageImageRef = storageImageDir!.child(fileName);
    try {
      await storageImageRef.putFile(File(imagePath!.path));
      imageUrl.value = await storageImageRef.getDownloadURL ();
      uploadAllData();
      print("ImageURl: ${imageUrl.value}");
      update();
    } catch (e) {
      uploadAllData();
      print(e);
    }

  }

  void uploadAllData() {
    Map<String,String> allData = {
      'imagedata': imageUrl.value,
      'textdata': textDataController.text
    };
    firestoreCollection
        .doc('flutter_data')
        .update(allData)
        .then((value) =>Get.snackbar("Firebase message", "Data Successfully Uploaded") )
        .catchError((error) => Get.snackbar("Firebase message", "Data Upload Failed!"));

  }

  Future<void> getFirebaseData() async {
    final snapshot =  await firestoreCollection.doc('flutter_data').get();
    final data = snapshot.data() as Map<String, dynamic>;
    imageUrl.value = data[ 'imagedata']??'';
    textDataController.text = data[ 'textdata']??'';
    update();
    print("Fetched Data: ");
    print("ImageUrl: "+imageUrl.value);
    print("TextData: "+textDataController.text);
  }

  void initWidgetValues(){
      if(textDataController.text.isNotEmpty){
        isTextSelected.value = true;
      }
      if(imageUrl.value.isNotEmpty){
        isImageSelected.value = true;
      }
      setIsEmpty();
  }
}
