import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterToastMessage {
  Future<bool?> flutterToast(msg) {
    return Fluttertoast.showToast(
        webPosition: Alignment.center,
        webShowClose: true,
        gravity: ToastGravity.BOTTOM_LEFT,
        msg: msg,
        fontSize: 15,
        backgroundColor: Colors.black.withOpacity(.7),
        textColor: Colors.red,
        toastLength: Toast.LENGTH_SHORT);
  }
}
