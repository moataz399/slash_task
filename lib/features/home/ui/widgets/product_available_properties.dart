import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash/core/theming/text_styles.dart';
import 'package:slash/features/home/data/models/product_details_response.dart';
import 'package:slash/features/home/ui/widgets/product_property.dart';

class ProductAvailableProperties extends StatefulWidget {
  const ProductAvailableProperties(
      {super.key, required this.productDetailsModel});

  final ProductDetailsModel productDetailsModel;

  @override
  State<ProductAvailableProperties> createState() =>
      _ProductAvailablePropertiesState();
}

class _ProductAvailablePropertiesState
    extends State<ProductAvailableProperties> {
  int getIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
    return selectedIndex;
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "EGP${widget.productDetailsModel.variations![selectedIndex].price.toString()}",
          style: TextStyles.font14GreenBold,
          softWrap: true,
        ),
        SizedBox(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.productDetailsModel.availableProperties?.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0.h),
                child: ProductAvailableProperty(
                  productDetailsModel: widget.productDetailsModel
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
