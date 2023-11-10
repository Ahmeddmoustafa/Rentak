import 'package:flutter/material.dart';
import 'package:rentak/Presentation/Home/widgets/custom_villa_card.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/routes_manager.dart';
import 'package:rentak/Resources/Managers/styles_manager.dart';
import 'package:rentak/Resources/Managers/values_manager.dart';

class PopularListWidget extends StatelessWidget {
  const PopularListWidget({super.key});
  static List units = [
    {
      "image":
          "https://images.posarellivillas.com/property_posarelli/96037/asra10:16:480:x/dsc-5347-easyhdr.jpg",
      "price": "1800",
      "duration": "Month",
      "address": "7I, Marasi, North Cost",
      "rate": "5",
      "bedrooms": "3",
      "bathrooms": "2",
      "type": "villa",
    },
    {
      "image":
          "https://incyprusproperty.com/wp-content/uploads/2023/02/ImageHandler-3262.jpg",
      "price": "1600",
      "duration": "Day",
      "address": "12H, Seashell, North Cost",
      "rate": "5",
      "bedrooms": "3",
      "bathrooms": "2",
      "type": "apartement",
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.height;
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width * .5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular nearest you",
                style: getSemiBoldStyle(
                  color: ColorManager.Black,
                  fontsize: AppSize.s18,
                ),
              ),
              Text(
                "see all >",
                style: getSemiBoldStyle(
                  color: ColorManager.Blue,
                  fontsize: AppSize.s16,
                ),
              ),
            ],
          ),
          SizedBox(height: height * .005),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              units.length,
              (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.detailsRoute);
                  },
                  child: CustomVillaCard(
                    image: units[index]['image'],
                    price: units[index]['price'],
                    bedrooms: units[index]['bedrooms'],
                    bathrooms: units[index]['bathrooms'],
                    duration: units[index]['duration'],
                    address: units[index]['address'],
                    rate: units[index]['rate'],
                    type: units[index]['type'],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
