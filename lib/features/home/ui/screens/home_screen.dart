import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:slash/core/helpers/spacing.dart';
import 'package:slash/core/theming/text_styles.dart';
import 'package:slash/features/home/logic/home_cubit.dart';
import 'package:slash/features/home/ui/widgets/product_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                buildWhen: (previous, current) =>
                    current is ProductsLoadingState ||
                    current is ProductsSuccessState ||
                    current is ProductsFailureState,
                builder: (context, state) {
                  if (state is ProductsLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    );
                  } else if (state is ProductsSuccessState) {
                    return Expanded(
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
                          productModel:
                              context.read<HomeCubit>().productsList[index],
                        ),
                      ),
                    );
                  } else if (state is ProductsFailureState) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else {
                    return const Text("ops something went wrong ");
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
