import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash/core/helpers/spacing.dart';
import 'package:slash/core/theming/text_styles.dart';
import 'package:slash/features/home/data/models/product_details_response.dart';

class ProductAvailableProperty extends StatelessWidget {
  const ProductAvailableProperty({
    super.key,
    required this.model,
  });

  final AvailableProperties model;

  Color colorFun(String color) {
    // Remove any '#' characters
    color = color.replaceAll('#', '');
    // Ensure the string is in the correct format to parse
    // Prefix '0xff' is used to ensure full opacity
    String formattedColor = '0xff$color';
    // Parse the color string as a hexadecimal number, and use it to create a Color
    return Color(int.parse(formattedColor));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Available ${model.property}:",
          style: TextStyles.font14BlackSemiBold,
        ),
        verticalSpace((2)),
        if (model.property == "Color")
          SizedBox(
            height: 30.h,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: model.values.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Container(
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorFun(model.values[index].value),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF1B1956).withOpacity(.04),
                            spreadRadius: 0,
                            blurRadius: 18,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        else
          SizedBox(
            height: 20.h,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: model.values.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      model.values[index].value,
                      style: TextStyles.font14BlackMedium,
                      softWrap: true,
                    ),
                  );
                }),
          )
      ],
    );
  }
}
