import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_recorder_flutter_demo/modules/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: const Text('Login Page'),
                backgroundColor: Colors.yellow,
              ),
              body: Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(children: <Widget>[
                    Center(
                        child: Image.asset(
                            'assets/images/ic_camcorder_logo.png',
                            width: 100,
                            height: 100)),
                    const SizedBox(height: 20),
                    const Center(
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter mobile number',
                            hintText: 'Enter 10 digit mobile no.'),
                      ),
                    ),
                  ])),
            ));
  }
}
