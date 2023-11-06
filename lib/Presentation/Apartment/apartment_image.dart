import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rentak/Resources/Managers/assets_manager.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/values_manager.dart';

class ApartmentImage extends StatefulWidget {
  const ApartmentImage({super.key});

  @override
  State<ApartmentImage> createState() => _ApartmentImageState();
}

class _ApartmentImageState extends State<ApartmentImage> {
  // final ScrollController _controller = ScrollController();
  final CarouselController _controller = CarouselController();
  List villas = [];
  int currIndex = 0;
  @override
  void initState() {
    villas = [
      {
        "id": 1,
        "image": AssetsManager.VillaImage,
      },
      {
        "id": 2,
        "image": AssetsManager.VillaImage2,
      },
      {
        "id": 3,
        "image": AssetsManager.VillaImage3,
      },
      {
        "id": 4,
        "image": AssetsManager.VillaImage4,
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppMargin.m10),
      // height: MediaQuery.of(context).size.height * 0.4,
      // width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          CarouselSlider(
            items: villas
                .map(
                  (item) => Image.asset(
                    item['image'],
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.45,
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
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: villas.asMap().entries.map((entry) {
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
                            ? ColorManager.LightSilver
                            : ColorManager.LightGrey),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
