
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SmallText extends StatelessWidget {
  final String text;
  final Color? color;
  final double size;
  final double height;
  const SmallText(
      {super.key,
        required this.text,
        this.height=1.2,
        this.color= const Color(0xFFccc7c5),
        this.size = 12});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          height: height,
          fontWeight: FontWeight.w400),
    );
  }
}