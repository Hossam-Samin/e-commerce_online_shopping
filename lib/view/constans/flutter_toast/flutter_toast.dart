import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// This function to display me a message when register and login
flutterToast({required String msg, required Color color}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16,
  );
}
