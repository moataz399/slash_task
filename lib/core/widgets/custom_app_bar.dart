import 'package:flutter/material.dart';

import '../theming/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, this.style});

  final String title;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        title,
        style: style ?? TextStyles.font16BlackSemiBold,
      ),
    );
  }

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
