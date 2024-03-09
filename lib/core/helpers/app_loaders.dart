
import 'package:flutter/material.dart';
import 'package:slash/core/helpers/spacing.dart';
import 'package:slash/core/theming/colors.dart';
import '../theming/text_styles.dart';

class AppLoaders {
  static loading(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(color: AppColors.mainGreen),
        );
      },
    );
  }

  static successSnackBar(BuildContext context, String title, String message) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar
      ..showSnackBar(SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Colors.white,
            ),
            horizontalSpace(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyles.font15WhiteSemiBold),
                  Text(
                    message,
                    style: TextStyles.font15WhiteMeduim
                        .copyWith(color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
        duration: const Duration(seconds: 3),
        backgroundColor: AppColors.mainGreen,
      ));
  }

  static errorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar
      ..showSnackBar(SnackBar(
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error,
              color: Colors.white,
            ),
            horizontalSpace(6),
            Expanded(
              child: Text(
                message,
                style:
                    TextStyles.font15WhiteMeduim.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red.shade600,
      ));
  }
}
