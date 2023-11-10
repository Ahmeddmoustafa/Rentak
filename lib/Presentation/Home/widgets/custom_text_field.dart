import 'package:flutter/material.dart';
import 'package:rentak/Presentation/Home/search_filter.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/values_manager.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * .5,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorManager.White,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s10),
            borderSide: BorderSide(
              color: ColorManager.LightGrey.withOpacity(0.5),
            ),
          ),
          suffixIcon: Icon(
            Icons.arrow_forward,
            color: ColorManager.LightGrey,
          ),
          hintText: "Search street, locality, address",
          hintStyle: TextStyle(color: ColorManager.LightGrey),
          prefixIcon: IconButton(
            splashRadius: AppSize.s20,
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: ColorManager.Transparent,
                  builder: (context) => const SearchFilter());
            },
            icon: Icon(
              Icons.filter_list,
              // weight: 200,
              color: ColorManager.Black,
            ),
          ),
        ),
      ),
    );
  }
}
