import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:slash/core/helpers/spacing.dart';
import 'package:slash/core/theming/text_styles.dart';
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
        actions: [
          InkWell(
            onTap: () {
              context.read<HomeCubit>().getProducts();
            },
            child: const Center(
              child: Text("Load Data"),
            ),
          ),
        ],
        automaticallyImplyLeading: false,
        title: Text(
          "Slash.",
          style: TextStyles.font32BlackBold,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(16.h),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return (state is ProductsSuccessState)
                      ? Expanded(
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
                                    isDetails: false,
                                    productModel: context
                                        .read<HomeCubit>()
                                        .productsList[index],
                                  )),
                        )
                      : const Center(child: CircularProgressIndicator());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
