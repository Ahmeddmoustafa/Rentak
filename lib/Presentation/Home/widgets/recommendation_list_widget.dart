import 'package:flutter/material.dart';
import 'package:rentak/Presentation/Home/widgets/custom_villa_card.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/styles_manager.dart';
import 'package:rentak/Resources/Managers/values_manager.dart';

class RecommendationListWidget extends StatelessWidget {
  const RecommendationListWidget({super.key});
  static List units = [
    {
      "image":
          "https://img.freepik.com/free-photo/design-house-modern-villa-with-open-plan-living-private-bedroom-wing-large-terrace-with-privacy_1258-169741.jpg?size=626&ext=jpg&ga=GA1.1.1413502914.1697155200&semt=ais",
      "price": "2100",
      "duration": "Month",
      "address": "7I, Marasi, North Cost",
      "rate": "5",
      "bedrooms": "4",
      "bathrooms": "5",
      "type": "villa",
    },
    {
      "image":
          "https://housing.com/news/wp-content/uploads/2023/01/modern-villa-designs-FEATURE-compressed.jpg",
      "price": "7000",
      "duration": "Week",
      "address": "12H, Seashell, North Cost",
      "rate": "5",
      "bedrooms": "5",
      "bathrooms": "4",
      "type": "villa",
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
                "Recommendations for you",
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
          SizedBox(height: height * .01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              units.length,
              (index) {
                return CustomVillaCard(
                  image: units[index]['image'],
                  price: units[index]['price'],
                  bedrooms: units[index]['bedrooms'],
                  bathrooms: units[index]['bathrooms'],
                  duration: units[index]['duration'],
                  address: units[index]['address'],
                  rate: units[index]['rate'],
                  type: units[index]['type'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
