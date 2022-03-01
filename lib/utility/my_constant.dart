import 'package:flutter/material.dart';

class MyConstant {
  // field
  static String appName = 'Officer SV';
  static Color primary = const Color(0xffe31717);
  static Color dark = const Color(0xfff092c1);
  static Color light = const Color(0xfff52c90);
  // method
  TextStyle h1Style() => TextStyle(
        fontSize: 30,
        color: dark,
        fontWeight: FontWeight.bold,
      );

       TextStyle h2Style() => TextStyle(
        fontSize: 18,
        color: dark,
        fontWeight: FontWeight.w700,
      );

       TextStyle h3Style() => TextStyle(
        fontSize: 14,
        color: dark,
        fontWeight: FontWeight.normal,
      );
}
