import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:slash/core/helpers/spacing.dart';
import 'package:slash/core/theming/colors.dart';
import 'package:slash/core/theming/text_styles.dart';
import 'package:slash/features/home/data/models/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productModel});

  final Product productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Product details",
          style: TextStyles.font16BlackSemiBold,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional.center,
              child: SizedBox(
                height: 250.h,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: productModel.productVariations!.length == 1
                        ? productModel.productVariations?.length
                        : productModel
                            .productVariations?[0].productVarientImages?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: CachedNetworkImage(
                            width: 200.w,
                            imageUrl: productModel.productVariations?[index]
                                    .productVarientImages?[index].imagePath ??
                                "",
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(
                              color: AppColors.mainGreen,
                            )),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                verticalSpace(30),
                Text(
                  productModel.name,
                  style: TextStyles.font14BlackSemiBold,
                ),
                verticalSpace(8),
                Text(
                    "EGP${productModel.productVariations?[0].price.toString()}",
                    style: TextStyles.font16BlackSemiBold),
                verticalSpace(16),
                Text(
                  "Description",
                  style: TextStyles.font12BlackSemiBold,
                ),
                verticalSpace(12),
                ReadMoreText(
                  productModel.description,
                  trimLines: 5,
                  style: TextStyles.font12BlackMedium,
                  colorClickableText: Colors.grey,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'More',
                  trimExpandedText: 'Less',
                  lessStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                  moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
                verticalSpace(16),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
