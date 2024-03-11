import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:slash/core/helpers/spacing.dart';
import 'package:slash/core/theming/text_styles.dart';
import 'package:slash/features/home/data/models/product_response.dart';

class ProductInfoSection extends StatelessWidget {
  const ProductInfoSection({super.key, required this.productModel});

  final Product productModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              productModel.name,
              style: TextStyles.font16BlackSemiBold,
            ),
            Text(
              productModel.brands?.brandName ?? "",
              style: TextStyles.font16BlackMedium,
            ),
          ],
        ),
        verticalSpace(8),
        Text("EGP ${productModel.productVariations?[0].price.toString()}",
            style: TextStyles.font16BlackSemiBold),
        verticalSpace(8),
        Text(
          "Description:",
          style: TextStyles.font14BlackSemiBold,
        ),
        verticalSpace(8),
        ReadMoreText(
          productModel.description,
          trimLines: 5,
          style: TextStyles.font14BlackMedium,
          colorClickableText: Colors.grey,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'More',
          trimExpandedText: 'Less',
          lessStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
          moreStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
      ],
    );
  }
}
