import 'package:flutter/material.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/values_manager.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.all(AppMargin.m14),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(width * .005),
        child: Container(
          width: width * .04,
          height: width * .04,
          decoration: BoxDecoration(
            color: ColorManager.White,
            borderRadius: BorderRadius.circular(width * .005),
          ),
          child: Center(
            child: Icon(icon),
          ),
        ),
      ),
    );
  }
}
