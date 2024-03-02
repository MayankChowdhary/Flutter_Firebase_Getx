import 'package:flutter/material.dart';
import 'package:flutter_firebase_getx/modules/store/store_controller.dart';

class RadioCustom extends StatefulWidget {
  final String name;
  final StoreController controller;

  const RadioCustom(this.name, this.controller, {Key? key}) : super(key: key);

  @override
  State<RadioCustom> createState() => _RadioCustomState();
}

class _RadioCustomState extends State<RadioCustom> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Row(
        children: [
          Container(
            height: 50,
            color: Colors.white,
            child: Radio(
              toggleable: true,
              value: "male",
              groupValue: "male",
              onChanged: (value) {},
            ),
          ),
          Expanded(
            child: Container(
                width: double.infinity,
                color: const Color(0xFFDEDEDE),
                padding: const EdgeInsets.only(left: 8),
                alignment: Alignment.centerLeft,
                height: 50,
                child: Text(widget.name, style: const TextStyle(fontSize: 16))),
          ),
        ],
      ),
    );
  }
}
