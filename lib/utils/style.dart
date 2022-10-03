import 'package:flutter/material.dart';

ButtonStyle buttonStyle() {
  return ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(50),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))));
}