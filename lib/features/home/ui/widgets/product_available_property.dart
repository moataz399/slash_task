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
  int sizeSelected = 0;
  int materialSelected = 0;

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
                      height: 45.h,
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
                              child: SizedBox(
                                height: 25.h,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Container(
                                    width: selectedIndex == index ? 45.w : 20.w,
                                    height:
                                        selectedIndex == index ? 40.h : 20.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.grey),
                                      color: convertColor(
                                          model.values[index].value),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  else if (model.property == "Size")
                    SizedBox(
                      height: 40.h,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: variation.productPropertiesValues!.length,
                          itemBuilder: (context, index) {
                            var sizeValues =
                                variation.productPropertiesValues![index].value;
                            if (variation
                                    .productPropertiesValues![index].property ==
                                "Size") {
                              return InkWell(
                                onTap: () {
                                  sizeSelected = index;
                                  setState(() {});
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.h, horizontal: 16.0.w),
                                    decoration: sizeSelected == index
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
                                        sizeValues!,
                                        style: sizeSelected == index
                                            ? TextStyles.font15WhiteSemiBold
                                            : TextStyles.font14GreyMedium,
                                        softWrap: true,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                            return Container();
                          }),
                    )
                  else if (model.property == "Materials")
                    SizedBox(
                      height: 40.h,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: variation.productPropertiesValues!.length,
                          itemBuilder: (context, index) {
                            var materialValue =
                                variation.productPropertiesValues![index].value;
                            if (variation
                                    .productPropertiesValues![index].property ==
                                "Materials") {
                              return InkWell(
                                onTap: () {
                                  materialSelected = index;
                                  setState(() {});
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.h, horizontal: 16.0.w),
                                    decoration: materialSelected == index
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
                                        materialValue!,
                                        style: materialSelected == index
                                            ? TextStyles.font15WhiteSemiBold
                                            : TextStyles.font14GreyMedium,
                                        softWrap: true,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                            return Container();
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
