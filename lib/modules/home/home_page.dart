import 'package:flutter/material.dart';
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
                    height: MediaQuery.of(context).size.height-50,
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    color: WidgetsTheme.colorSecondary,
                    child: controller.isWidgetEmpty.value == true
                        ? const Center(
                            child: Text(
                            "No Widget is added",
                            style: TextStyle(
                                color: WidgetsTheme.colorOnSecondary,
                                fontSize: 22),
                          ))
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              const TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(),
                                  labelText: 'Text Data',
                                  hintText: 'Enter Text',
                                ),
                              ),
                              const SizedBox(height: 30),
                              Card(
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
                              SizedBox(height: 30),
                              Container(
                                  padding: const EdgeInsets.all(30),
                                  height: 120,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: () {},
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
                      Get.toNamed(AppRoutes.store);
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
