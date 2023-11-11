import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/styles_manager.dart';
import 'package:rentak/Resources/Managers/values_manager.dart';

class CustomHomeCard extends StatefulWidget {
  const CustomHomeCard({super.key});

  @override
  State<CustomHomeCard> createState() => _CustomHomeCardState();
}

class _CustomHomeCardState extends State<CustomHomeCard> {
  List units = [
    {
      "price": "1600",
      "duration": "Day",
      "address": "12H, Seashell, North Cost",
      "rate": "5",
      "bedrooms": "3",
      "bathrooms": "2",
      "type": "apartement",
      "images": [
        "https://images.posarellivillas.com/property_posarelli/96037/asra10:16:480:x/dsc-5347-easyhdr.jpg",
        "https://incyprusproperty.com/wp-content/uploads/2023/02/ImageHandler-3262.jpg",
        "https://images.posarellivillas.com/property_posarelli/96037/asra10:16:480:x/dsc-5347-easyhdr.jpg",
        "https://incyprusproperty.com/wp-content/uploads/2023/02/ImageHandler-3262.jpg",
      ]
    }
  ];

  final CarouselController _imageCarouselController = CarouselController();

  int imageCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        CarouselSlider(
          items: (units).map((unit) {
            return Container(
              width: width * .5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * .01),
              ),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: CarouselSlider(
                      carouselController: _imageCarouselController,
                      items: (unit['images'] as List)
                          .map(
                            (image) => Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(width * .01),
                                image: DecorationImage(
                                  image: NetworkImage(image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: false,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {},
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: height * .01,
                    child: Container(
                      width: width,
                      height: height * .10,
                      foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * .01),
                        gradient: const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            // ColorManager.Blue.withOpacity(0.7),
                            // const Color(0x00000000),
                            Color(0xCC000000),
                            Color(0x00000000),
                            Color(0x00000000),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * .01,
                    child: Container(
                      width: width,
                      height: height * .10,
                      foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * .01),
                        gradient: const LinearGradient(
                          end: Alignment.bottomCenter,
                          begin: Alignment.topCenter,
                          colors: [
                            // ColorManager.Blue.withOpacity(0.3),
                            // const Color(0x00000000),
                            Color(0xCC000000),
                            Color(0x00000000),
                            Color(0x00000000),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    bottom: height * .02,
                    left: width * .01,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(AppPadding.p12),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(width * .5),
                                    gradient: LinearGradient(
                                      end: Alignment.topCenter,
                                      begin: Alignment.bottomCenter,
                                      colors: [
                                        ColorManager.Blue,
                                        ColorManager.Blue.withOpacity(0.8),
                                      ],
                                    )),
                                child: Text(
                                  "${unit['type']}",
                                  style: getSemiBoldStyle(
                                    color: ColorManager.White,
                                  ),
                                ),
                              ),
                              SizedBox(width: width * .02),
                              Container(
                                padding: const EdgeInsets.all(AppPadding.p12),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(width * .5),
                                    gradient: LinearGradient(
                                      end: Alignment.topCenter,
                                      begin: Alignment.bottomCenter,
                                      colors: [
                                        ColorManager.Blue,
                                        ColorManager.Blue.withOpacity(0.8),
                                      ],
                                    )),
                                child: Text(
                                  "${unit['price']}EGP / ${unit['duration']}",
                                  style: getSemiBoldStyle(
                                    color: ColorManager.White,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height * .02),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                color: ColorManager.White,
                              ),
                              SizedBox(
                                width: width * .25,
                                child: Text(
                                  unit['address'],
                                  style: getSemiBoldStyle(
                                    color: ColorManager.White,
                                    fontsize: AppSize.s20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned.fill(
                    top: height * .02,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: (unit['images'] as List)
                            .asMap()
                            .entries
                            .map((entry) {
                          return GestureDetector(
                            onTap: () => _imageCarouselController
                                .animateToPage(entry.key),
                            child: Container(
                              width:
                                  width * .4 / (unit['images'] as List).length,
                              height: AppSize.s4,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 3.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s10),
                                color: imageCurrentIndex == entry.key
                                    ? ColorManager.Blue
                                    : ColorManager.White,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: height * 0.30,
            scrollPhysics: const BouncingScrollPhysics(),
            autoPlay: false,
            viewportFraction: 1,
            onPageChanged: (index, reason) {},
          ),
        )
      ],
    );
  }
}
