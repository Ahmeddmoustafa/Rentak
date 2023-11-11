import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/styles_manager.dart';
import 'package:rentak/Resources/Managers/values_manager.dart';

class CustomFeaturesList extends StatefulWidget {
  const CustomFeaturesList({super.key});

  @override
  State<CustomFeaturesList> createState() => _CustomFeaturesListState();
}

class _CustomFeaturesListState extends State<CustomFeaturesList> {
  final CarouselController _controller = CarouselController();
  int currIndex = 0;
  static List featuresList = [
    {
      "title": "Find your perfect home",
      "description": "Enjoy Exculsive Deals at local hotspots",
      "image": "https://gcdnb.pbrd.co/images/Vqezxpi4jKMl.png?o=1",
    },
    {
      "title": "Find your perfect home",
      "description": "Enjoy Exculsive Deals at local hotspots",
      "image": "https://gcdnb.pbrd.co/images/Vqezxpi4jKMl.png?o=1",
    },
    {
      "title": "Find your perfect home",
      "description": "Enjoy Exculsive Deals at local hotspots",
      "image": "https://gcdnb.pbrd.co/images/Vqezxpi4jKMl.png?o=1",
    },
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CarouselSlider(
          items: featuresList
              .map((item) => Container(
                    width: width * .5,
                    decoration: BoxDecoration(
                      color: ColorManager.Blue,
                      borderRadius: BorderRadius.circular(width * .01),
                    ),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: AppPadding.p16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item['title'],
                                style: getBoldStyle(
                                  color: ColorManager.White,
                                  fontsize: AppSize.s20,
                                ),
                              ),
                              Text(
                                item['description'],
                                style: getRegularStyle(
                                  color: ColorManager.White,
                                  fontsize: AppSize.s14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned.fill(
                          bottom: -height * .03,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Image.network(
                              item['image'],
                              width: width * .25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.15,
            scrollPhysics: const BouncingScrollPhysics(),
            autoPlay: true,
            aspectRatio: 16 / 11,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                currIndex = index;
              });
            },
          ),
        ),
        SizedBox(height: height * .01),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: featuresList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: currIndex == entry.key ? AppSize.s14 : AppSize.s8,
                height: AppSize.s8,
                margin: const EdgeInsets.symmetric(
                  horizontal: 3.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s10),
                  color: currIndex == entry.key
                      ? ColorManager.Blue
                      : ColorManager.LightGrey,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
