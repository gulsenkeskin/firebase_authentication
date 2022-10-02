import 'dart:ui';

import 'package:flutter/material.dart';

class CustomInputTheme {
  TextStyle _buildTextStyle(Color color, {double size = 16.0}) {
    return TextStyle(color: color, fontSize: size);
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: color, width: 1.0));
  }

  InputDecorationTheme theme()=> InputDecorationTheme(
    contentPadding: EdgeInsets.all(16),
    isDense: true
  );



}
