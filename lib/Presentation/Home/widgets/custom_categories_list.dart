import 'package:flutter/material.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/styles_manager.dart';
import 'package:rentak/Resources/Managers/values_manager.dart';

class CustomCategoriesList extends StatelessWidget {
  const CustomCategoriesList({
    super.key,
  });

  static List categories = [
    {
      "title": "House",
      "image":
          "https://www.zillowstatic.com/bedrock/app/uploads/sites/15/May2015-Trulia-5-Reasons-The-Highest-Offer-Wont-Always-Get-You-The-House-neighborhood-house-sunny-day.jpg",
    },
    {
      "title": "Apartment",
      "image":
          "https://wp.dailybruin.com/images/2022/08/web.news_.universityapartments.EVD_.jpg",
    },
    {
      "title": "Villa",
      "image":
          "https://cf.bstatic.com/xdata/images/hotel/max1024x768/314234927.jpg?k=21291418450e2c1802e02864677b7cf811321797b1d36aaa55e1019133f82698&o=&hp=1",
    },
    {
      "title": "Rooms",
      "image":
          "https://assets-global.website-files.com/5c6d6c45eaa55f57c6367749/65045f093c166fdddb4a94a5_x-65045f0266217.webp",
    },
  ];

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
          SizedBox(height: height * .005),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              categories.length,
              (index) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(width * .01),
                    child: Container(
                      width: width * .10,
                      height: width * .08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * .01),
                        image: DecorationImage(
                          image: NetworkImage(categories[index]['image']),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * .005),
                  Text(categories[index]['title']),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
