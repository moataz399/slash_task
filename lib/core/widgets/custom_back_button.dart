import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCustomBackButton extends StatelessWidget {
  const MyCustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.h),
      width: 40.w,
      height: 40.h,
      decoration: const BoxDecoration(
        color: Colors.white, // White background color
        shape: BoxShape.circle, // Rounded shape
      ),
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 20,
        ),
        // Customize back button color
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
