import 'package:flutter/material.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/styles_manager.dart';
import 'package:rentak/Resources/Managers/values_manager.dart';

class CustomTopBar extends StatelessWidget {
  const CustomTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * .03,
        vertical: height * .02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * .02),
              Text(
                "Good Morning, Ahmed 👋",
                style: getBoldStyle(
                  color: ColorManager.Black,
                  fontsize: AppSize.s18,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    color: ColorManager.Blue,
                    size: width * .02,
                  ),
                  SizedBox(height: height * .03),
                  const Text(' North Cost, Egypt'),
                ],
              ),
            ],
          ),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(width * .05),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * .05),
              ),
              padding: EdgeInsets.all(width * .005),
              child: Stack(
                children: [
                  const Icon(Icons.notifications_none_sharp),
                  Positioned(
                    right: 3,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: width * .01,
                        height: width * .01,
                        decoration: BoxDecoration(
                          color: ColorManager.Blue,
                          borderRadius: BorderRadius.circular(width * .06),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
