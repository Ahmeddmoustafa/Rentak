import 'package:flutter/material.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/styles_manager.dart';
import 'package:rentak/Resources/Managers/values_manager.dart';

class CustomVillaCard2 extends StatelessWidget {
  const CustomVillaCard2({
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
      child: SizedBox(
        height: height * .15,
        child: Stack(
          children: [
            Positioned.fill(
              right: width * .01,
              top: height * .01,
              child: Align(
                alignment: Alignment.topRight,
                child: Material(
                  elevation: 3,
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
            Row(
              children: [
                Container(
                  width: width * .20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(width * .01),
                      bottomLeft: Radius.circular(width * .01),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(width: width * .02),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: height * .02),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: width * .1,
                          padding: EdgeInsets.all(width * .005),
                          decoration: BoxDecoration(
                            color: ColorManager.Blue,
                            borderRadius: BorderRadius.circular(width * .005),
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
                      ],
                    ),
                    SizedBox(height: height * .02),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "$price EGP",
                            style: getBoldStyle(
                              color: ColorManager.Blue,
                              fontsize: AppSize.s25,
                            ),
                            children: [
                              TextSpan(
                                text: " / $duration",
                                style: getSemiBoldStyle(
                                  color: ColorManager.Black,
                                  fontsize: AppSize.s20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height * .005),
                        Text(
                          address,
                          style: getLightStyle(
                            fontsize: AppSize.s14,
                            color: ColorManager.DarkGrey,
                          ),
                        ),
                        SizedBox(height: height * .005),
                        RichText(
                          text: TextSpan(
                            style: getBoldStyle(
                              color: ColorManager.DarkGrey,
                              fontsize: AppSize.s16,
                            ),
                            children: [
                              TextSpan(text: bedrooms),
                              TextSpan(
                                text: " Bedrooms . ",
                                style: getRegularStyle(
                                  color: ColorManager.DarkGrey,
                                  fontsize: AppSize.s14,
                                ),
                              ),
                              TextSpan(text: bathrooms),
                              TextSpan(
                                text: " Bathrooms",
                                style: getRegularStyle(
                                  color: ColorManager.DarkGrey,
                                  fontsize: AppSize.s14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height * .005),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
