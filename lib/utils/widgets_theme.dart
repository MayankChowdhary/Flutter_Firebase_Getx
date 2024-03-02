import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import 'constants.dart';

class WidgetsTheme{

  static const Color colorPrimary = Colors.blueAccent;
  static const Color colorSecondary = Color(0xFFAADBFF);
  static const Color colorOnPrimary = Colors.white;
  static const Color colorOnSecondary = Colors.black;
  static ButtonStyle getRaisedButtonStyle({Size size = Constants.mediumButtonSize}) {
    return ElevatedButton.styleFrom(
      foregroundColor: colorOnPrimary,
      backgroundColor: colorPrimary,
      minimumSize: size,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );
  }

  static GetSnackBar getSnackbarError(String message){
    return  GetSnackBar(
      title: "Error",
      message: message,
      backgroundColor: Colors.blueGrey,
      icon: const Icon(Icons.warning,color: Colors.yellow,),
      duration: const Duration(seconds: 3),
    );
  }
  static GetSnackBar getSnackbarInfo(String message){
    return  GetSnackBar(
      title: "Info",
      message: message,
      backgroundColor: Colors.blueGrey,
      icon: const Icon(Icons.info,color: Colors.greenAccent,),
      duration: const Duration(seconds: 3),
    );
  }
}