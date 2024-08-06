import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterToastMessage {
  Future<bool?> flutterToast(msg) {
    return Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM_LEFT,
        msg: msg,
        fontSize: 15,
        backgroundColor: Colors.white10,
        textColor: Colors.red,
        toastLength: Toast.LENGTH_LONG);
  }
}
