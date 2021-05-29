import 'package:flutter/material.dart';

InputDecoration authInputDecoration (String hint, Icon startIcon) {
  return InputDecoration(
    hintText: hint,
    prefixIcon: startIcon,
    border: InputBorder.none,
    errorStyle: TextStyle(
      fontWeight: FontWeight.bold,
    )
  );
}