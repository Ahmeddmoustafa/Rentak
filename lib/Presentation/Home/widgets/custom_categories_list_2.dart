import 'package:flutter/material.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/styles_manager.dart';
import 'package:rentak/Resources/Managers/values_manager.dart';

class CustomCategoriesListt extends StatelessWidget {
  const CustomCategoriesListt({
    super.key,
  });

  static List categories = ["House", "Apartment", "Villa", "Rooms"];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * .5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Categories",
            style: getSemiBoldStyle(
              color: ColorManager.Black,
              fontsize: AppSize.s18,
            ),
          ),
          SizedBox(height: height * .01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              categories.length,
              (index) => Container(
                width: width * .10,
                padding: const EdgeInsets.all(AppPadding.p12),
                decoration: BoxDecoration(
                  color: index == 0
                      ? ColorManager.Blue.withOpacity(0.1)
                      : ColorManager.White,
                  borderRadius: BorderRadius.circular(width * .05),
                  border: Border.all(
                    width: index == 0 ? 2 : 1,
                    color:
                        index == 0 ? ColorManager.Blue : ColorManager.DarkGrey,
                  ),
                ),
                child: Text(
                  categories[index],
                  textAlign: TextAlign.center,
                  style: index == 0
                      ? getBoldStyle(color: ColorManager.Blue)
                      : getMediumStyle(
                          color: ColorManager.DarkGrey,
                        ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
