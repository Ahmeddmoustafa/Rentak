// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/routes_manager.dart';
import 'package:rentak/Resources/Managers/values_manager.dart';

class ApartmentAppBar extends StatefulWidget {
  late bool scrolled;
  ApartmentAppBar({
    super.key,
    required this.scrolled,
  });

  @override
  State<ApartmentAppBar> createState() => _ApartmentAppBarState();
}

class _ApartmentAppBarState extends State<ApartmentAppBar> {
  @override
  Widget build(BuildContext context) {
    if (!widget.scrolled) {
      return AppBar(
        backgroundColor: ColorManager.Transparent,
        foregroundColor: ColorManager.Transparent,
        surfaceTintColor: ColorManager.Transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.mainRoute);
          },
          icon: Icon(
            Icons.arrow_back,
            color: ColorManager.White,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppSize.s10),
            child: Icon(
              Icons.share_sharp,
              color: ColorManager.White,
            ),
          )
        ],
        elevation: 0,
        shadowColor: ColorManager.Transparent,
      );
    } else {
      print("ssorry the app bar is scrolled");
      return AppBar(
        shadowColor: ColorManager.Transparent,
        backgroundColor: ColorManager.Transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.mainRoute);
          },
          icon: Icon(
            Icons.arrow_back,
            color: ColorManager.DarkGrey,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppSize.s10),
            child: Icon(
              Icons.share_sharp,
              color: ColorManager.DarkGrey,
            ),
          )
        ],
        elevation: 25,
      );
    }
  }
}
