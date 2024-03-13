
import 'package:flutter/material.dart';

Color convertColor(String color) {
  // Remove any '#' characters
  color = color.replaceAll('#', '');
  // Ensure the string is in the correct format to parse
  // Prefix '0xff' is used to ensure full opacity
  String formattedColor = '0xff$color';
  // Parse the color string as a hexadecimal number, and use it to create a Color
  return Color(int.parse(formattedColor));
}