import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/spacing.dart';
import '../theming/colors.dart';
import '../theming/text_styles.dart';

class LogoAndHeaderText extends StatelessWidget {
  const LogoAndHeaderText(
      {super.key, required this.title, this.emoji, this.img, this.width});

  final String title;
  final String? emoji;
  final String? img;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(30),
        img != null
            ? Container(
                width: 87.w,
                height: 33.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/logo.png",
                    ),
                  ),
                ),
              )
            : Container(),
        verticalSpace(30),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  bottom: 5,
                  child: Container(
                    width: width ?? 180.w,
                    height: 8.h,
                    decoration:  BoxDecoration(
                        color: AppColors.lightGreen, shape: BoxShape.rectangle),
                  ),
                ),
                Text(
                  title,
                  style: TextStyles.font22BlackBold,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              child: Text(
                emoji ?? "",
                style: TextStyle(fontSize: 26.sp),
              ),
            )
          ],
        )
      ],
    );
  }
}
