
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_getx/modules/home/home_Binding.dart';
import 'package:flutter_firebase_getx/modules/home/home_page.dart';
import 'package:get/get.dart';
import 'package:flutter_firebase_getx/routes/app_pages.dart';

import 'modules/store/widget_state_arg.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      initialBinding: HomeBinding(),
      home: const HomePage(),
      getPages: AppPages.pages,
    );
  }
}