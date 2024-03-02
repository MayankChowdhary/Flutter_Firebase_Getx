import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_firebase_getx/modules/login/login_controller.dart';
import 'package:flutter_firebase_getx/routes/app_routes.dart';
import 'package:flutter_firebase_getx/utils/widgets_theme.dart';

import '../../utils/constants.dart';

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
              body: SingleChildScrollView(
                child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(children: <Widget>[
                      const SizedBox(height: 100),
                      Center(
                          child: Image.asset(
                              'assets/images/ic_camcorder_logo.png',
                              width: 100,
                              height: 100)),
                      const SizedBox(height: 50),
                      Center(
                        child: TextField(
                          controller: controller.controller,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              errorText: controller.validate.value == true
                                  ? "Value Can't Be Empty"
                                  : null,
                              labelText: 'Enter mobile number',
                              hintText: 'Enter 10 digit mobile no.'),
                        ),
                      ),
                      const SizedBox(height: 60),
                      ElevatedButton(
                        style: WidgetsTheme.getRaisedButtonStyle(
                            size: Constants.mediumButtonSize),
                        onPressed: () {
                          if (controller.validate.value != null &&
                              controller.validate.value != true) {
                            Get.toNamed(AppRoutes.otp);
                          } else {
                            Get.showSnackbar(WidgetsTheme.getSnackbarError(
                                "Value Can't Be Empty"));
                          }
                        },
                        child: const Text('NEXT'),
                      )
                    ])),
              ),
            ));
  }
}
