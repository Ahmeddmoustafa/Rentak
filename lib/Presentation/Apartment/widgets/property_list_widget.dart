import 'package:flutter/material.dart';
import 'package:rentak/Presentation/Apartment/widgets/custom_property_icon.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/fonts_manager.dart';
import 'package:rentak/Resources/Managers/styles_manager.dart';

class PropertyListWidget extends StatelessWidget {
  const PropertyListWidget({
    super.key,
    required this.apartement,
  });

  final Map apartement;

  static const detailsMap = {
    "bedrooms": {
      "icon": Icons.bed_outlined,
      "text": "Bedrooms",
    },
    "bathrooms": {
      "icon": Icons.bathtub_outlined,
      "text": "Bathrooms",
    },
    "living": {
      "icon": Icons.living_outlined,
      "text": "Living rooms",
    },
    "year": {
      "icon": Icons.access_time_rounded,
      "text": "Bult in year",
    },
    "area": {
      "icon": Icons.area_chart_outlined,
      "text": "Area (in sqft)",
    },
  };

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Row(
          children: [
            Text(
              "Property Details",
              style: getSemiBoldStyle(
                color: ColorManager.Blue,
                fontsize: FontSize.s22,
              ),
            ),
          ],
        ),
        SizedBox(
          width: width * .5,
          height: height * .16,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2.2,
            ),
            itemCount:
                (apartement['property_details'] as Map).entries.toList().length,
            itemBuilder: (context, index) {
              var key = (apartement['property_details'] as Map)
                  .entries
                  .toList()[index]
                  .key;
              String value = (apartement['property_details'] as Map)
                  .entries
                  .toList()[index]
                  .value;
              Map values = detailsMap[key] as Map;

              return CustomPropertyIcon(
                value: value,
                text: values['text'],
                icon: values['icon'],
              );
            },
          ),
        ),
      ],
    );
  }
}
