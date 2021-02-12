import 'package:flutter/material.dart';
class Email_val{
  bool isEmail(String string) {
    // Null or empty string is invalid
    if (string == null || string.isEmpty) {
      return true;
    }

    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(string)) {
      return false;
    }
    return true;
  }
}