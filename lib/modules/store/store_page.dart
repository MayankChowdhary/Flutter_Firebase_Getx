import 'package:flutter/material.dart';
import 'package:flutter_firebase_getx/modules/store/radio_custom.dart';
import 'package:flutter_firebase_getx/modules/store/store_controller.dart';
import 'package:flutter_firebase_getx/modules/store/widget_state_arg.dart';
import 'package:flutter_firebase_getx/utils/widgets_theme.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text('Store Screen'),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 100,
            padding: const EdgeInsets.all(40),
            color: WidgetsTheme.colorSecondary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                RadioCustom("Text Widget", "Text", controller,
                    controller.isTextSelected.value),
                const SizedBox(
                  height: 50,
                ),
                RadioCustom("Image Widget", "Image", controller,
                    controller.isImageSelected.value),
                const SizedBox(
                  height: 50,
                ),
                RadioCustom("Button Widget", "Button", controller,
                    controller.isButtonSelected.value),
                Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                          style: WidgetsTheme.getRaisedButtonStyle(),
                          onPressed: () {
                            Get.offNamed(AppRoutes.home,
                                arguments: WidgetStateArg(
                                    controller.isTextSelected.value,
                                    controller.isImageSelected.value,
                                    controller.isButtonSelected.value));
                          },
                          child: const Text(
                            "Import Widgets",
                            style: TextStyle(fontSize: 18),
                          )),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
