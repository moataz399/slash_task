import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash/features/home/logic/home_cubit.dart';
import 'package:slash/features/home/ui/widgets/product_property.dart';

class ProductAvailableProperties extends StatelessWidget {
  const ProductAvailableProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is ProductDetailsLoading ||
            current is ProductDetailsSuccessState ||
            current is ProductDetailsFailureState,
        builder: (context, state) {
          if (state is ProductDetailsSuccessState) {
            return SizedBox(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:
                    state.productDetailsModel.availableProperties?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0.h),
                    child: ProductAvailableProperty(
                      model: state
                          .productDetailsModel.availableProperties![index],
                    ),
                  );
                },
              ),
            );
          } else if (state is ProductDetailsLoading) {
            return const CircularProgressIndicator(
              color: Colors.black,
            );
          } else if (state is ProductsFailureState) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return Container();
          }
        });
  }
}
