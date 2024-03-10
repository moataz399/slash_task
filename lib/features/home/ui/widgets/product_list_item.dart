import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash/core/helpers/extensions.dart';
import 'package:slash/core/routing/routes.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../data/models/product_response.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem(
      {super.key,
      required this.productModel,
      required this.isDetails,
      this.sameProductId});

  final Product productModel;
  final bool isDetails;
  final int? sameProductId;

  @override
  Widget build(BuildContext context) {
    return productModel.id == sameProductId
        ? Container()
        : InkWell(
            onTap: () {
              context.pushNamed(Routes.productsDetailsScreen,
                  arguments: {"productModel": productModel});
            },
            child: isDetails
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    width: 150.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF1B1956).withOpacity(.04),
                          spreadRadius: 0,
                          blurRadius: 18,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16.r),
                              topLeft: Radius.circular(16.r)),
                          child: CachedNetworkImage(
                            height: 150.h,
                            width: double.infinity,
                            imageUrl: productModel.productVariations?[0]
                                    .productVarientImages?[0].imagePath ??
                                "",
                            placeholder: (context, url) => Container(
                              height: 100.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.10),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(16.r),
                                    topLeft: Radius.circular(16.r)),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.fill,
                          ),
                        ),
                        verticalSpace(10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            children: [
                              Text(
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  "${productModel.brands?.brandName}-${productModel.name}",
                                  style: TextStyles.font12BlackSemiBold),
                              verticalSpace(8),
                              Text(
                                  "EGP ${productModel.productVariations?[0].price.toString()}",
                                  style: TextStyles.font14BlackSemiBold),
                              verticalSpace(16),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF1B1956).withOpacity(.04),
                          spreadRadius: 0,
                          blurRadius: 18,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16.r),
                              topLeft: Radius.circular(16.r)),
                          child: CachedNetworkImage(
                            width: double.infinity,
                            imageUrl: productModel.productVariations?[0]
                                    .productVarientImages?[0].imagePath ??
                                "",
                            placeholder: (context, url) => Container(
                              height: 200.h,
                              width: 200.w,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.10),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(16.r),
                                    topLeft: Radius.circular(16.r)),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.fill,
                          ),
                        ),
                        verticalSpace(10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            children: [
                              Text(
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  "${productModel.brands?.brandName}-${productModel.name}",
                                  style: TextStyles.font12BlackSemiBold),
                              verticalSpace(8),
                              Text(
                                  "EGP ${productModel.productVariations?[0].price.toString()}",
                                  style: TextStyles.font14BlackSemiBold),
                              verticalSpace(16),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
          );
  }
}
