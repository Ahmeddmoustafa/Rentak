import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rentak/Presentation/Apartment/review_image.dart';
import 'package:rentak/Presentation/UsefullWidgets/custom_divider.dart';
import 'package:rentak/Resources/Managers/assets_manager.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/strings_manager.dart';
import 'package:rentak/Resources/Managers/values_manager.dart';

class ApartmentReview extends StatefulWidget {
  const ApartmentReview({super.key});

  @override
  State<ApartmentReview> createState() => _ApartmentReviewState();
}

class _ApartmentReviewState extends State<ApartmentReview> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return ConstrainedBox(
            constraints: const BoxConstraints(minHeight: AppSize.s100),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              // margin: const EdgeInsets.symmetric(vertical: AppSize.s25),
              // color: ColorManager.DarkGrey,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: AppSize.s50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                              AssetsManager.UserImage,
                            ),
                            fit: BoxFit.scaleDown),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: AppPadding.p10, right: AppPadding.p14),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.userName,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          CustomDivider(),
                          Text(
                            AppStrings.reviewDate,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          CustomDivider(),
                          Row(
                            children: List.generate(
                              5,
                              (index) {
                                return Icon(
                                  Icons.star,
                                  color: ColorManager.Golden,
                                  size: AppSize.s14,
                                );
                              },
                            ),
                          ),
                          CustomDivider(),
                          Text(
                            AppStrings.reviewDescription,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          // GridView.builder(
                          //   padding: EdgeInsets.all(0),
                          //   physics: const NeverScrollableScrollPhysics(),
                          //   shrinkWrap: true,
                          //   itemCount: 10, // For 3x3 grid
                          //   gridDelegate:
                          //       const SliverGridDelegateWithFixedCrossAxisCount(
                          //     crossAxisCount: 3,
                          //   ),
                          //   itemBuilder: (BuildContext context, int index) {
                          // return Card(
                          //   margin: const EdgeInsets.only(
                          //       right: AppMargin.m8, top: AppMargin.m8),
                          //   child: Center(child: Text('Image $index')),
                          // );
                          //   },
                          // ),
                          CustomDivider(),
                          MasonryGridView.builder(
                              padding: const EdgeInsets.all(0),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 15,
                              gridDelegate:
                                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                              ),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return ReviewImages(
                                            link:
                                                "https://source.unsplash.com/random?sig={$index}");
                                      },
                                    );
                                  },
                                  child: Card(
                                    child: index <= 5
                                        ? Center(
                                            child: Image.network(
                                              "https://source.unsplash.com/random?sig={$index}",
                                            ),
                                          )
                                        : const Center(),
                                  ),
                                );
                              }),
                          CustomDivider(
                            divider: AppSize.s40,
                            color: ColorManager.LightSilver,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
