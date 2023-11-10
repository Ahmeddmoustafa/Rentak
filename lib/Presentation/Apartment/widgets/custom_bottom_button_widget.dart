import 'package:flutter/material.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/fonts_manager.dart';
import 'package:rentak/Resources/Managers/styles_manager.dart';
import 'package:rentak/Resources/Managers/values_manager.dart';

class CustomBottomButtonWidget extends StatelessWidget {
  const CustomBottomButtonWidget({
    super.key,
    required this.apartement,
  });

  final Map apartement;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        elevation: 30,
        borderRadius: BorderRadius.circular(width * .01),
        child: Container(
          width: width,
          height: height * .12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width * .01),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: AppMargin.m20,
                  top: AppMargin.m20,
                  bottom: AppMargin.m20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${apartement['price']} EGP/${apartement['duration']}",
                      style: getBoldStyle(
                        color: ColorManager.Blue,
                        fontsize: FontSize.s20,
                      ),
                    ),
                    Text(
                      "${apartement['type']}",
                      style: getRegularStyle(
                        color: ColorManager.DarkGrey,
                        fontsize: FontSize.s14,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: width * .2,
                margin: const EdgeInsets.all(AppMargin.m20),
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                decoration: BoxDecoration(
                  color: ColorManager.Blue,
                  borderRadius: BorderRadius.circular(width * .01),
                ),
                child: Center(
                  child: Text(
                    "Book Now",
                    style: getBoldStyle(
                      color: ColorManager.White,
                      fontsize: FontSize.s20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
