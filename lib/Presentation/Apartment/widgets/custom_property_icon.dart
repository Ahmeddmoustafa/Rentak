import 'package:flutter/material.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/fonts_manager.dart';
import 'package:rentak/Resources/Managers/styles_manager.dart';
import 'package:rentak/Resources/Managers/values_manager.dart';

class CustomPropertyIcon extends StatelessWidget {
  const CustomPropertyIcon({
    super.key,
    required this.value,
    required this.text,
    required this.icon,
  });
  final String value;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: ColorManager.DarkGrey,
              size: AppSize.s30,
            ),
            Text(
              '  $value',
              style: getSemiBoldStyle(
                color: ColorManager.DarkGrey,
                fontsize: FontSize.s20,
              ),
            ),
          ],
        ),
        Text(
          text,
          style: getRegularStyle(
            color: ColorManager.DarkGrey,
            fontsize: FontSize.s16,
          ),
        ),
      ],
    );
  }
}
