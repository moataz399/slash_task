import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash/features/home/data/models/product_details_response.dart';

class ProductImagesSection extends StatelessWidget {
  const ProductImagesSection({super.key, required this.variation});

  final Variations variation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: variation.productVarientImages!.length,
        itemBuilder: (context, imgIndex) {
          final imagePath = variation.productVarientImages![imgIndex].imagePath;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: CachedNetworkImage(
                width: 200.w,
                imageUrl: imagePath ?? "",
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
