import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:slash/core/helpers/spacing.dart';
import 'package:slash/core/routing/routes.dart';
import 'package:slash/core/theming/colors.dart';
import 'package:slash/core/theming/text_styles.dart';
import 'package:slash/features/home/data/models/product_response.dart';
import 'package:slash/features/home/ui/widgets/product_available_properties.dart';
import 'package:slash/features/home/ui/widgets/product_images.dart';
import 'package:slash/features/home/ui/widgets/product_info_section.dart';
import 'package:slash/features/home/ui/widgets/product_list_item.dart';
import 'package:slash/features/home/ui/widgets/recommendation_section.dart';

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
    getProductDetails();
  }

  void getProductDetails() async {
    await context.read<HomeCubit>().getProductDetails(widget.productModel.id);
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProductImagesSection(
                  productModel: widget.productModel,
                ),
                verticalSpace(30),
                ProductInfoSection(
                  productModel: widget.productModel,
                ),
                verticalSpace(16),
                ProductAvailableProperties(),
                verticalSpace(16),
                Text(
                  "You Might Also Like:",
                  style: TextStyles.font14BlackSemiBold,
                ),
                verticalSpace(16.h),
                RecommendationSection(
                  productModel: widget.productModel,
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
