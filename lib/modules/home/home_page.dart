import 'package:flutter/material.dart';
import 'package:flutter_firebase_getx/modules/store/widget_state_arg.dart';
import 'package:flutter_firebase_getx/routes/app_pages.dart';
import 'package:flutter_firebase_getx/routes/app_routes.dart';
import 'package:flutter_firebase_getx/utils/widgets_theme.dart';
import 'package:get/get.dart';
import 'package:flutter_firebase_getx/modules/home/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Home Screen')),
        ),
        body: Column(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 50,
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    color: WidgetsTheme.colorSecondary,
                    child: controller.isWidgetEmpty.value == true
                        ? Container(
                            alignment: Alignment.topCenter,
                            margin: const EdgeInsets.only(top: 200),
                            child: const Text(
                              "No Widget is added ⛔",
                              style: TextStyle(
                                  color: WidgetsTheme.colorOnSecondary,
                                  fontSize: 22),
                            ))
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (controller.isButtonSelected.isTrue &&
                                  controller.isImageSelected.isFalse &&
                                  controller.isTextSelected.isFalse)
                                Container(
                                    alignment: Alignment.topCenter,
                                    padding: const EdgeInsets.only(top: 100),
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    child: controller.addMoreMessage.isTrue
                                        ? const Text(
                                            "Add at-least a \n widget to save",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: WidgetsTheme
                                                    .colorOnSecondary,
                                                fontSize: 22),
                                          )
                                        : const SizedBox()),
                              if (controller.isTextSelected.isTrue)
                                Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    child: const TextField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(),
                                        labelText: 'Text Data',
                                        hintText: 'Enter Text',
                                      ),
                                    )),
                              if (controller.isImageSelected.isTrue)
                                Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  child: Card(
                                    elevation: 8,
                                    child: Container(
                                        color: const Color(0xFFE6D8FF),
                                        padding: const EdgeInsets.all(30),
                                        height: 250,
                                        width: double.infinity,
                                        child: const Center(
                                          child: Text(
                                            "➕ Add Image",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        )),
                                  ),
                                ),
                              if (controller.isButtonSelected.isTrue)
                                Container(
                                    margin: const EdgeInsets.only(top: 30),
                                    padding: const EdgeInsets.all(30),
                                    height: 120,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          if (controller
                                                  .isImageSelected.isFalse &&
                                              controller
                                                  .isTextSelected.isFalse) {
                                            controller.addMoreMessage(true);
                                            controller.update();
                                          }
                                        },
                                        child: const Text(
                                          "SAVE",
                                          style: TextStyle(fontSize: 18),
                                        )))
                            ],
                          ),
                  ),
                ]),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(30),
                height: 120,
                width: double.infinity,
                child: ElevatedButton(
                    style: WidgetsTheme.getRaisedButtonStyle(),
                    onPressed: () {
                      Get.offNamed(AppRoutes.store,
                          arguments: WidgetStateArg(
                              controller.isTextSelected.value,
                              controller.isImageSelected.value,
                              controller.isButtonSelected.value));
                    },
                    child: const Text(
                      "Add Widgets",
                      style: TextStyle(fontSize: 18),
                    )))
          ],
        ),
      ),
    );
  }
}
