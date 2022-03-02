import 'package:flutter/material.dart';

class MyConstant {
  // field
  static String appName = 'Officer SV';
  static Color primary = const Color(0xffe31717);
  static Color dark = const Color(0xffc2185b);
  static Color light = const Color(0xffef9a9a);
  // method
  BoxDecoration curBorder() => BoxDecoration(
        border: Border.all(color: MyConstant.dark),
        borderRadius: BorderRadius.circular(15),
      );

  BoxDecoration painBox() => BoxDecoration(
        color: light.withOpacity(0.5),
      );
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
