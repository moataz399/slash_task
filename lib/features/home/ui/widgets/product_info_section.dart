import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:slash/core/helpers/spacing.dart';
import 'package:slash/core/theming/text_styles.dart';
import 'package:slash/features/home/data/models/product_details_response.dart';
import 'package:slash/features/home/data/models/product_response.dart';

class ProductInfoSection extends StatelessWidget {
  const ProductInfoSection(
      {super.key,
      required this.productDetailsModel,
      required this.variation,
      required this.productModel});

  final ProductDetailsModel productDetailsModel;
  final Product productModel;
  final Variations variation;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 250.w,
              child: Text(
                productModel.name,
                style: TextStyles.font20BlackBold,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              "EGP${variation.price.toString()}",
              style: TextStyles.font14GreenBold,
              softWrap: true,
            ),
          ],
        ),
        Text(
          productModel.brands?.brandName ?? "",
          style: TextStyles.font14BlackRegular,
        ),
        verticalSpace(16),
        Text(
          "Description:",
          style: TextStyles.font16BlackSemiBold,
        ),
        verticalSpace(8),
        ReadMoreText(
          productModel.description,
          trimLines: 5,
          style: TextStyles.font14BlackRegular,
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
