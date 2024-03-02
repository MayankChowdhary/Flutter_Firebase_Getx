import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_firebase_getx/modules/home/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text('Video Recorder'),
        ),
        body: const Center(
          child: Text('Tap to Record!'),
        ),
      ),
    );
  }
}
