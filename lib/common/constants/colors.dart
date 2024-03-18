import 'package:flutter/material.dart';

class ColorC
{
  // static const Color backgroundColor = Color(0xFF001F3F);
  // static const Color foregroundColor = Color(0xFF00BFFF);
  // static const Color thirdColor = Color(0xFF0066CC);
  
  static const Color backgroundColor = Color(0xFF212529);
  static const Color foregroundColor = Color(0xFF3A506B);
  static const Color thirdColor = Color(0xFF16A085);

  static const Color premiumGFirst = Color(0xFFFFBF00);
  static const Color premiumGLast = Color(0xFFFF6D00);

  static const Color faultGFirst = Color(0xFFFFBF00);
  static const Color faultGLast = Color(0xFFFF6D00);

  static const Color textColor = Colors.white;

  static const List<Color> defaultGradient = [ColorC.foregroundColor, ColorC.thirdColor];
  static const List<Color> premiumGradient = [ColorC.premiumGFirst, ColorC.premiumGLast];
  static const List<Color> faultGradient = [ColorC.faultGFirst, ColorC.faultGLast];
}