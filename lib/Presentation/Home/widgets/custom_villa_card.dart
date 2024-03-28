import 'package:flutter/material.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/styles_manager.dart';
import 'package:rentak/Resources/Managers/values_manager.dart';

class CustomVillaCard extends StatelessWidget {
  const CustomVillaCard({
    super.key,
    required this.image,
    required this.price,
    required this.duration,
    required this.address,
    required this.rate,
    required this.bedrooms,
    required this.bathrooms,
    required this.type,
  });
  final String image;
  final String price;
  final String duration;
  final String address;
  final String rate;
  final String bedrooms;
  final String bathrooms;
  final String type;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(width * .01),
      child: Container(
        height: width * .3,
        width: width * .23,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * .01),
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              top: height * .05,
              left: width * .01,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(width * .005),
                    topRight: Radius.circular(width * .005),
                  ),
                  child: Container(
                    width: width * .1,
                    padding: EdgeInsets.all(width * .005),
                    decoration: BoxDecoration(
                      color: ColorManager.Blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(width * .005),
                        topRight: Radius.circular(width * .005),
                      ),
                    ),
                    child: Text(
                      type,
                      textAlign: TextAlign.center,
                      style: getRegularStyle(
                        color: ColorManager.White,
                        fontsize: AppSize.s14,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: width * .23,
                padding: const EdgeInsets.all(AppPadding.p8),
                decoration: BoxDecoration(
                  color: ColorManager.White,
                  borderRadius: BorderRadius.circular(width * .01),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "$price EGP",
                        style: getBoldStyle(
                          color: ColorManager.Blue,
                          fontsize: AppSize.s20,
                        ),
                        children: [
                          TextSpan(
                            text: " / $duration",
                            style: getSemiBoldStyle(
                              color: ColorManager.Black,
                              fontsize: AppSize.s16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * .005),
                    Text(
                      address,
                      style: getLightStyle(
                        color: ColorManager.DarkGrey,
                      ),
                    ),
                    SizedBox(height: height * .005),
                    RichText(
                      text: TextSpan(
                        style: getBoldStyle(
                          color: ColorManager.DarkGrey,
                          fontsize: AppSize.s14,
                        ),
                        children: [
                          TextSpan(text: bedrooms),
                          TextSpan(
                            text: " Bedrooms . ",
                            style: getRegularStyle(
                              color: ColorManager.DarkGrey,
                              fontsize: AppSize.s12,
                            ),
                          ),
                          TextSpan(text: bathrooms),
                          TextSpan(
                            text: " Bathrooms",
                            style: getRegularStyle(
                              color: ColorManager.DarkGrey,
                              fontsize: AppSize.s12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * .005),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              top: height * .01,
              right: width * .01,
              child: Align(
                alignment: Alignment.centerRight,
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(width * .3),
                  child: Container(
                    width: width * .03,
                    height: width * .03,
                    decoration: BoxDecoration(
                      color: ColorManager.White,
                      borderRadius: BorderRadius.circular(width * .3),
                    ),
                    child: Icon(
                      Icons.star_half_rounded,
                      color: ColorManager.Golden,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
