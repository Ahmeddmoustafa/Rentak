import 'package:flutter/material.dart';
import 'package:rentak/Resources/Managers/styles_manager.dart';
import 'package:rentak/Resources/Managers/values_manager.dart';
import 'package:rentak/Resources/Managers/fonts_manager.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.color,
    required this.circleColor,
    required this.text,
    required this.icon,
  });

  final Color color;
  final Color circleColor;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.height;
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(width * .5),
      child: Container(
        width: width * .20,
        padding: const EdgeInsets.all(AppPadding.p8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(width * .5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width * .03,
              height: width * .03,
              decoration: BoxDecoration(
                color: circleColor,
                borderRadius: BorderRadius.circular(width * .5),
              ),
              child: Center(child: Icon(icon, color: color)),
            ),
            SizedBox(width: width * .01),
            Text(
              text,
              style: getRegularStyle(
                color: circleColor,
                fontsize: FontSize.s12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
