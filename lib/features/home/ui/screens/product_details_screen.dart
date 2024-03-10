import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:slash/core/helpers/spacing.dart';
import 'package:slash/core/theming/colors.dart';
import 'package:slash/core/theming/text_styles.dart';
import 'package:slash/features/home/data/models/product_response.dart';
import 'package:slash/features/home/ui/widgets/product_list_item.dart';

import '../../logic/home_cubit.dart';
import '../widgets/product_property.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productModel});

  final Product productModel;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getProductDetails(widget.productModel.id);
  }

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
        child: SingleChildScrollView(
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
                      itemCount:
                          widget.productModel.productVariations?.length ?? 0,
                      itemBuilder: (context, index) {
                        final variation =
                            widget.productModel.productVariations![index];

                        return SizedBox(
                          height: 250.h,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount:
                                variation.productVarientImages?.length ?? 0,
                            itemBuilder: (context, imgIndex) {
                              final imagePath = variation
                                  .productVarientImages![imgIndex].imagePath;

                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16.r),
                                  child: CachedNetworkImage(
                                    width: 200.w,
                                    imageUrl: imagePath ?? "",
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.mainGreen,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                    // ...

                    // ...
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    verticalSpace(30),
                    Text(
                      widget.productModel.name,
                      style: TextStyles.font14BlackSemiBold,
                    ),
                    verticalSpace(8),
                    Text(
                        "EGP${widget.productModel.productVariations?[0].price.toString()}",
                        style: TextStyles.font16BlackSemiBold),
                    verticalSpace(8),
                    Text(
                      "Description:",
                      style: TextStyles.font14BlackMedium,
                    ),
                    verticalSpace(8),
                    ReadMoreText(
                      widget.productModel.description,
                      trimLines: 5,
                      style: TextStyles.font14BlackMedium,
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
                    BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                      if (state is ProductDetailsSuccessState) {
                        return SizedBox(
                          height: 170.h,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.productDetailsModel
                                .availableProperties?.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.0.h),
                                child: ProductAvailableProperty(
                                  model: state.productDetailsModel
                                      .availableProperties![index],
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
                    Text(
                      "You Might Also Like:",
                      style: TextStyles.font14BlackSemiBold,
                    ),
                  ],
                ),
                verticalSpace(18.h),
                SizedBox(
                  height: 250.h,
                  child: ListView.builder(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: context.read<HomeCubit>().productsList.length,
                    itemBuilder: (context, index) => ProductListItem(
                        isDetails: true,
                        sameProductId: widget.productModel.id,
                        productModel:
                            context.read<HomeCubit>().productsList[index]),
                  ),
                ),
                verticalSpace(30.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

