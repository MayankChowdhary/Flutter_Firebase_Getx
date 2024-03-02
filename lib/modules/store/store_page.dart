import 'package:flutter/material.dart';
import 'package:flutter_firebase_getx/modules/store/radio_custom.dart';
import 'package:flutter_firebase_getx/modules/store/store_controller.dart';
import 'package:flutter_firebase_getx/utils/widgets_theme.dart';
import 'package:get/get.dart';

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
            height: MediaQuery.of(context).size.height-50,
            padding: const EdgeInsets.all(40),
            color: WidgetsTheme.colorSecondary,
            child: Column(
              children: [
                RadioCustom("Text Widget",controller),
                const SizedBox(
                  height: 50,
                ),
                RadioCustom("Image Widget",controller),
                const SizedBox(
                  height: 50,
                ),
                RadioCustom("Button Widget",controller),
                Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                          style: WidgetsTheme.getRaisedButtonStyle(),
                          onPressed: () {
                            Get.back();
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
