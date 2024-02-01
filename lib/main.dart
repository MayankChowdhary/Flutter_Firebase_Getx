
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_recorder_flutter_demo/modules/login/login_Binding.dart';
import 'package:video_recorder_flutter_demo/modules/login/login_page.dart';
import 'package:video_recorder_flutter_demo/routes/app_pages.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Recorder Demo',
      theme: ThemeData(primarySwatch: Colors.yellow),
      initialBinding: LoginBinding(),
      home: const LoginPage(),
      getPages: AppPages.pages,
    );
  }
}