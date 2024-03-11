import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash/features/home/logic/home_cubit.dart';
import 'package:slash/features/home/ui/widgets/product_list_item.dart';

import '../../data/models/product_response.dart';

class RecommendationSection extends StatelessWidget {
  const RecommendationSection({super.key, required this.productModel});

  final Product productModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: context.read<HomeCubit>().productsList.length,
        itemBuilder: (context, index) => ProductListItem(
            isDetails: true,
            sameProductId: productModel.id,
            productModel: context.read<HomeCubit>().productsList[index]),
      ),
    );
  }
}
