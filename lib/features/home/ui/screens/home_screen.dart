import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:slash/core/helpers/spacing.dart';
import 'package:slash/core/theming/text_styles.dart';
import 'package:slash/features/home/data/models/product.dart';
import 'package:slash/features/home/logic/home_cubit.dart';
import 'package:slash/features/home/ui/widgets/product_list_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Slash.",
          style: TextStyles.font32BlackBold,
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is ProductsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductsSuccessState) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  children: [
                    verticalSpace(16.h),
                    Expanded(
                      child: MasonryGridView.builder(
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 16.h,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              context.read<HomeCubit>().productsList.length,
                          gridDelegate:
                              const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) => ProductListItem(
                                productModel: context
                                    .read<HomeCubit>()
                                    .productsList[index],
                              )),
                    )
                  ],
                ),
              ),
            );
          } else {
            return InkWell(
                onTap: () {
                  context.read<HomeCubit>().getProducts();
                },
                child: const Center(child: Text("no data available")));
          }
        },
      ),
    );
  }
}
// GridView.count(
//   shrinkWrap: true,
//   physics: const NeverScrollableScrollPhysics(),
//   crossAxisCount: 2,
//   mainAxisSpacing: 20.h,
//   crossAxisSpacing: 20.w,
//   clipBehavior: Clip.none,
//   childAspectRatio: (1 / 1.2).h,
//   children: List.generate(
//       context.read<HomeCubit>().productsList.length,
//       (index) => ProductListItem(
//             productModel: context
//                 .read<HomeCubit>()
//                 .productsList[index],
//           )),
// ),
