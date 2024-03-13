import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash/core/functions/convert_color.dart';
import 'package:slash/core/helpers/spacing.dart';
import 'package:slash/core/theming/colors.dart';
import 'package:slash/core/theming/text_styles.dart';
import 'package:slash/features/home/data/models/product_details_response.dart';
import 'package:slash/features/home/data/models/product_response.dart';
import 'package:slash/features/home/ui/widgets/product_images_section.dart';
import 'package:slash/features/home/ui/widgets/product_info_section.dart';

class ProductAvailableProperty extends StatefulWidget {
  const ProductAvailableProperty({
    super.key,
    required this.productDetailsModel,
    required this.productModel,
  });

  final ProductDetailsModel productDetailsModel;
  final Product productModel;

  @override
  State<ProductAvailableProperty> createState() =>
      _ProductAvailablePropertyState();
}

class _ProductAvailablePropertyState extends State<ProductAvailableProperty> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var variation = widget.productDetailsModel.variations![selectedIndex];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductImagesSection(variation: variation),
        verticalSpace(16),
        ProductInfoSection(
          productModel: widget.productModel,
          productDetailsModel: widget.productDetailsModel,
          variation: variation,
        ),
        SizedBox(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.productDetailsModel.availableProperties?.length,
            itemBuilder: (context, index) {
              var model =
                  widget.productDetailsModel.availableProperties![index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(16),
                  Text(
                    "Available ${model.property}:",
                    style: TextStyles.font16BlackSemiBold,
                  ),
                  verticalSpace((8)),
                  if (model.property == "Color")
                    SizedBox(
                      height: 25.h,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          width: 25.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey),
                            color:
                                convertColor(model.values[selectedIndex].value),
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
                      ),
                    )
                  else
                    SizedBox(
                      height: 40.h,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: model.values.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8.h, horizontal: 16.0.w),
                                  decoration: selectedIndex == index
                                      ? BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                          color: AppColors.mainGreen)
                                      : BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                          border:
                                              Border.all(color: Colors.grey),
                                        ),
                                  child: Center(
                                    child: Text(
                                      model.values[index].value,
                                      style: selectedIndex == index
                                          ? TextStyles.font15WhiteSemiBold
                                          : TextStyles.font14GreyMedium,
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
