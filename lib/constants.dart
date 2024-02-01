import 'package:flutter/material.dart';

 class Constants {
  static const Size mediumButtonSize = Size(200, 50);
  static const Size smallButtonSize = Size(100, 50);
  static const Size largeButtonSize = Size(300, 50);

   static ButtonStyle getRaisedButtonStyle({Size size = Constants.mediumButtonSize}) {
    return ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.blueGrey,
      minimumSize: size,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );
  }
}
