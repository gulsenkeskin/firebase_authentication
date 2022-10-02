import 'dart:ui';

import 'package:flutter/material.dart';

class CustomInputTheme {
  TextStyle _buildTextStyle(Color color, {double size = 16.0}) {
    return TextStyle(color: color, fontSize: size);
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: color, width: 1.0));
  }

  InputDecorationTheme theme() => InputDecorationTheme(
        contentPadding: const EdgeInsets.all(16),
        isDense: true,
        //label'ı her zaman yukarıya koyar :D
        floatingLabelBehavior: FloatingLabelBehavior.always, //never hiç bir zaman göstermez, auto: otaklanıldığında üste kaydırır
    

        constraints: BoxConstraints(maxWidth: 150),
        enabledBorder: _buildBorder(Colors.grey[600]!),
        errorBorder: _buildBorder(Colors.red),
        focusedErrorBorder: _buildBorder(Colors.redAccent),
        focusedBorder: _buildBorder(Colors.green),
        disabledBorder: _buildBorder(Colors.grey[400]!),
        suffixStyle: _buildTextStyle(Colors.black),
        counterStyle: _buildTextStyle(Colors.grey, size: 12.0),
        floatingLabelStyle: _buildTextStyle(Colors.black),
        errorStyle: _buildTextStyle(Colors.red, size: 12.0),
        helperStyle: _buildTextStyle(Colors.black, size: 12.0),
        hintStyle: _buildTextStyle(Colors.grey),
        labelStyle: _buildTextStyle(Colors.black),
        prefixStyle: _buildTextStyle(Colors.black),
      );
}
