import 'package:flutter/material.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/fonts_manager.dart';
import 'package:rentak/Resources/Managers/styles_manager.dart';
import 'package:rentak/Resources/Managers/values_manager.dart';

class CustomReviewCard extends StatelessWidget {
  const CustomReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(width * .01),
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * .01),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: width * .05,
                  height: width * .05,
                  decoration: BoxDecoration(
                    color: ColorManager.Black,
                    borderRadius: BorderRadius.circular(width * .01),
                  ),
                ),
                SizedBox(width: width * .01),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mohamed Ahmed",
                      style: getSemiBoldStyle(
                        color: ColorManager.Black,
                        fontsize: FontSize.s18,
                      ),
                    ),
                    Text(
                      "Software Engineer",
                      style: getRegularStyle(
                        color: ColorManager.DarkGrey,
                        fontsize: FontSize.s14,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: ColorManager.Golden.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(width * .5),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star_rate_rounded,
                        color: ColorManager.Golden,
                      ),
                      const Text('4.5'),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: height * .01),
            SizedBox(
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: getRegularStyle(
                  color: ColorManager.DarkGrey,
                  fontsize: FontSize.s16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
