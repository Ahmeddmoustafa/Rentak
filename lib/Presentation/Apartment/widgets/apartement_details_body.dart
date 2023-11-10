import 'package:flutter/material.dart';
import 'package:rentak/Presentation/Apartment/widgets/custom_appartment_info_widget.dart';
import 'package:rentak/Presentation/Apartment/widgets/custom_bottom_button_widget.dart';
import 'package:rentak/Presentation/Apartment/widgets/custom_icon.dart';
import 'package:rentak/Presentation/Apartment/widgets/custom_icon_button.dart';
import 'package:rentak/Presentation/Apartment/widgets/custom_review_card.dart';
import 'package:rentak/Presentation/Apartment/widgets/property_list_widget.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/fonts_manager.dart';
import 'package:rentak/Resources/Managers/styles_manager.dart';

class ApartementDetailsBody extends StatelessWidget {
  const ApartementDetailsBody({super.key});

  static const Map apartement = {
    "price": "1600",
    "duration": "Day",
    "address": "12H, Seashell, North Cost, Egypt",
    "rate": "5",
    "bedrooms": "3",
    "bathrooms": "2",
    "type": "apartement",
    "images": [
      "https://incyprusproperty.com/wp-content/uploads/2023/02/ImageHandler-3262.jpg",
      "https://images.posarellivillas.com/property_posarelli/96037/asra10:16:480:x/dsc-5347-easyhdr.jpg",
      "https://incyprusproperty.com/wp-content/uploads/2023/02/ImageHandler-3262.jpg",
      "https://images.posarellivillas.com/property_posarelli/96037/asra10:16:480:x/dsc-5347-easyhdr.jpg",
    ],
    "property_details": {
      "bedrooms": "3",
      "bathrooms": "2",
      "living": "2",
      "year": "2020",
      "area": "1550",
    }
  };

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: width,
                height: height * .35,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(apartement['images'][0]),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(width * .01),
                ),
              ),
              SizedBox(height: height * .01),
              // Address
              const CustomApartementInfo(apartement: apartement),
              SizedBox(height: height * .02),
              // Icons
              const PropertyListWidget(apartement: apartement),
              SizedBox(height: height * .01),
              // Reviews
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Reviews",
                        style: getSemiBoldStyle(
                          color: ColorManager.Blue,
                          fontsize: FontSize.s22,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: width,
                    height: height * .20,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemExtent: width * .45,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.all(8),
                          child: CustomReviewCard(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned.fill(
            top: height * .28,
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIcon(
                    text: 'virtual tour',
                    color: ColorManager.Black,
                    circleColor: ColorManager.White,
                    icon: Icons.threed_rotation_outlined,
                  ),
                  SizedBox(width: width * .01),
                  CustomIcon(
                    text: 'photo gallery',
                    color: ColorManager.White,
                    circleColor: ColorManager.Black,
                    icon: Icons.camera_alt_rounded,
                  ),
                ],
              ),
            ),
          ),
          const CustomBottomButtonWidget(apartement: apartement),
          const CustomIconButton(icon: Icons.arrow_back_ios_new_rounded),
          const Align(
            alignment: Alignment.topRight,
            child: CustomIconButton(icon: Icons.share),
          ),
        ],
      ),
    );
  }
}
