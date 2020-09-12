import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Util {
  static void showSnackBar(ScaffoldState scaffoldState,
      {String strContent, Widget content, SnackBarAction action}) {
    if (strContent == null && content == null) {
      return;
    }

    try {
      Widget msgContent = content ?? Text(strContent);
      scaffoldState.showSnackBar(SnackBar(
        content: msgContent,
        action: action,
      ));
    } on FlutterError catch (e) {
      throw e;
    }
  }

  static Future<bool> showToast(dynamic message,
      {Toast length = Toast.LENGTH_SHORT}) async {
    if (message == null ||
        message.toString() == null ||
        message.toString().isEmpty) {
      return false;
    }
    return await Fluttertoast.showToast(
        msg: message.toString(), toastLength: length);
  }
}
