import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/values_manager.dart';
import 'package:rentak/cubit/theme_cubit.dart';

class PopularPlaces extends StatelessWidget {
  const PopularPlaces({super.key});

  List<String> getPlaces() {
    final List<String> places = ["Dahab", "EL-Sokhna", "Siwa", "Nuweiba"];
    return places;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(getPlaces().length, (index) {
      return Container(
        margin: const EdgeInsets.only(right: AppSize.s14),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                BlocProvider.of<ThemeCubit>(context).toggletheme();
              },
              child: Container(
                width: AppSize.s40,
                height: AppSize.s40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s8),
                  color: ColorManager.LightSilver,
                ),
                child: const Icon(Icons.location_pin),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: AppMargin.m10),
              child: Text(
                getPlaces()[index],
                style: Theme.of(context).textTheme.bodySmall,
              ),
            )
          ],
        ),
      );
    }));
  }
}
