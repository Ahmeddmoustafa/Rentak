import 'package:flutter/material.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/styles_manager.dart';
import 'package:rentak/Resources/Managers/values_manager.dart';

class CustomApartementInfo extends StatelessWidget {
  const CustomApartementInfo({
    super.key,
    required this.apartement,
  });

  final Map apartement;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Classical Apartement",
              style: getSemiBoldStyle(
                color: ColorManager.Blue,
                fontsize: AppSize.s25,
              ),
            ),
          ],
        ),
        SizedBox(height: height * .005),
        Row(
          children: [
            Icon(
              Icons.location_on_rounded,
              color: ColorManager.DarkGrey,
            ),
            Text(
              ' ${apartement['address']}',
              style: getRegularStyle(
                color: ColorManager.DarkGrey,
                fontsize: AppSize.s16,
              ),
            )
          ],
        )
      ],
    );
  }
}
