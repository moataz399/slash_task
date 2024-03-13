import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash/core/helpers/spacing.dart';
import 'package:slash/core/theming/colors.dart';
import 'package:slash/core/theming/text_styles.dart';
import 'package:slash/features/home/data/models/product_details_response.dart';

class ProductAvailableProperty extends StatefulWidget {
  const ProductAvailableProperty({
    super.key,
    required this.model,
  });

  final AvailableProperties model;

  @override
  State<ProductAvailableProperty> createState() =>
      _ProductAvailablePropertyState();
}

class _ProductAvailablePropertyState extends State<ProductAvailableProperty> {
  late List<bool> isSelectedList;
  late List<bool> isSelectedListColor;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    isSelectedList =
        List.generate(widget.model.values.length, (index) => false);
    isSelectedListColor =
        List.generate(widget.model.values.length, (index) => false);
  }

  Color colorFun(String color) {
    // Remove any '#' characters
    color = color.replaceAll('#', '');
    // Ensure the string is in the correct format to parse
    // Prefix '0xff' is used to ensure full opacity
    String formattedColor = '0xff$color';
    // Parse the color string as a hexadecimal number, and use it to create a Color
    return Color(int.parse(formattedColor));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(16),
        Text(
          "Available ${widget.model.property}:",
          style: TextStyles.font16BlackSemiBold,
        ),
        verticalSpace((8)),
        if (widget.model.property == "Color")
          SizedBox(
            height: 40.h,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Container(
                width: 25.w,
                height: 25.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey),
                  color: colorFun(widget.model.values[selectedIndex].value),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF1B1956).withOpacity(.04),
                      spreadRadius: 0,
                      blurRadius: 18,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
              ),
            ),
          )
        else
          SizedBox(
            height: 40.h,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: widget.model.values.length,
                itemBuilder: (context, index) {
                  if (widget.model.values.length == 1) {
                    isSelectedList[index] = true;
                  }
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        //  Toggle the selected state for the tapped item
                        for (int i = 0; i < isSelectedList.length; i++) {
                          isSelectedList[i] = (i == index);
                          print(widget.model.values[index].value);
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 16.0.w),
                        decoration: isSelectedList[index]
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: AppColors.mainGreen)
                            : BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(color: Colors.grey),
                              ),
                        child: Center(
                          child: Text(
                            widget.model.values[index].value,
                            style: isSelectedList[index]
                                ? TextStyles.font15WhiteSemiBold
                                : TextStyles.font14GreyMedium,
                            softWrap: true,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          )
      ],
    );
  }
}

//
//
//
//
//
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:slash/core/helpers/spacing.dart';
// import 'package:slash/core/theming/colors.dart';
// import 'package:slash/core/theming/text_styles.dart';
// import 'package:slash/features/home/data/models/product_details_response.dart';
//
// class ProductAvailableProperty extends StatefulWidget {
//   const ProductAvailableProperty({
//     super.key,
//     required this.productDetailsModel,
//   });
//
//   final ProductDetailsModel productDetailsModel;
//
//   @override
//   State<ProductAvailableProperty> createState() =>
//       _ProductAvailablePropertyState();
// }
//
// class _ProductAvailablePropertyState extends State<ProductAvailableProperty> {
//   int selectedIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     // isSelectedList = List.generate(
//     //     widget.productDetailsModel.availableProperties?.values
//     //         .length,
//     //         (index) => false);
//     // isSelectedListColor = List.generate(
//     //     availableProperties![index].values
//     //         .length,
//     //         (index) => false);
//   }
//
//   Color colorFun(String color) {
//     // Remove any '#' characters
//     color = color.replaceAll('#', '');
//     // Ensure the string is in the correct format to parse
//     // Prefix '0xff' is used to ensure full opacity
//     String formattedColor = '0xff$color';
//     // Parse the color string as a hexadecimal number, and use it to create a Color
//     return Color(int.parse(formattedColor));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "EGP${widget.productDetailsModel.variations![selectedIndex].price.toString()}",
//           style: TextStyles.font14GreenBold,
//           softWrap: true,
//         ),
//         ListView.builder(
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: widget.productDetailsModel.availableProperties?.length,
//           itemBuilder: (context, index) {
//             var availableProperties =
//                 widget.productDetailsModel.availableProperties;
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 verticalSpace(16),
//                 Text(
//                   "Available ${availableProperties?[index].property}:",
//                   style: TextStyles.font16BlackSemiBold,
//                 ),
//                 verticalSpace((8)),
//                 if (availableProperties![index].property == "Color")
//                   SizedBox(
//                     height: 40.h,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                       child: Container(
//                         width: 25.w,
//                         height: 25.h,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(color: Colors.grey),
//                           color: colorFun(widget
//                               .productDetailsModel
//                               .availableProperties![index]
//                               .values[selectedIndex]
//                               .value),
//                           boxShadow: [
//                             BoxShadow(
//                               color: const Color(0xFF1B1956).withOpacity(.04),
//                               spreadRadius: 0,
//                               blurRadius: 18,
//                               offset: const Offset(0, 4),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   )
//                 else
//                   SizedBox(
//                     height: 40.h,
//                     child: ListView.builder(
//                         shrinkWrap: true,
//                         scrollDirection: Axis.horizontal,
//                         physics: const BouncingScrollPhysics(),
//                         itemCount: widget.productDetailsModel
//                             .availableProperties![index].values.length,
//                         itemBuilder: (context, index) {
//                           return InkWell(
//                             onTap: () {
//                               setState(() {
//                                 selectedIndex = index;
//                               });
//                             },
//                             child: Padding(
//                               padding:
//                               const EdgeInsets.symmetric(horizontal: 8.0),
//                               child: Container(
//                                 padding: EdgeInsets.symmetric(
//                                     vertical: 8.h, horizontal: 16.0.w),
//                                 decoration: selectedIndex == index
//                                     ? BoxDecoration(
//                                     borderRadius:
//                                     BorderRadius.circular(16.r),
//                                     color: AppColors.mainGreen)
//                                     : BoxDecoration(
//                                   borderRadius:
//                                   BorderRadius.circular(16.r),
//                                   border: Border.all(color: Colors.grey),
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     widget
//                                         .productDetailsModel
//                                         .availableProperties![index]
//                                         .values[index]
//                                         .value,
//                                     style: selectedIndex == index
//                                         ? TextStyles.font15WhiteSemiBold
//                                         : TextStyles.font14GreyMedium,
//                                     softWrap: true,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           );
//                         }),
//                   )
//               ],
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
