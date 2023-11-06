import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentak/Presentation/Apartment/apartment_image.dart';
import 'package:rentak/Presentation/Apartment/apartment_review.dart';
import 'package:rentak/Presentation/AppBars/apartment_app_bar.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/routes_manager.dart';
import 'package:rentak/Resources/Managers/strings_manager.dart';
import 'package:rentak/Resources/Managers/values_manager.dart';
import 'package:rentak/cubit/apartment_cubit.dart';

class ApartmentPage extends StatefulWidget {
  const ApartmentPage({super.key});

  @override
  State<ApartmentPage> createState() => _ApartmentPageState();
}

class _ApartmentPageState extends State<ApartmentPage> {
  Color appBarColor = ColorManager.Transparent;
  bool scrolled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size(0, 50),
        child: ApartmentAppBar(
          scrolled: scrolled,
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollUpdateNotification) {
            if (notification.metrics.axis == Axis.vertical) {
              setState(() {
                scrolled = notification.metrics.pixels >
                        MediaQuery.of(context).size.height * 0.35
                    ? true
                    : false;
              });
            }
          }
          return false;
        },
        child: SingleChildScrollView(
          child: BlocBuilder<ApartmentCubit, ApartmentState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: AppMargin.m4),
                    child: const ApartmentImage(),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (state is ApartmentSelected)
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.apartment.place,
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                  textAlign: TextAlign.start,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: AppPadding.p8),
                                  child: Text(
                                    AppStrings.villaDescription,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: AppPadding.p8),
                                  child: Text(
                                    state.apartment.price,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    textAlign: TextAlign.start,
                                  ),
                                )
                              ],
                            ),
                          ),
                        if (state is ApartmentSelected)
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(state.apartment.rating),
                                    const Icon(Icons.star)
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () => {
                                    Navigator.pushReplacementNamed(
                                        context, Routes.loginRoute)
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        ColorManager.Black),
                                    minimumSize: const MaterialStatePropertyAll(
                                      Size(AppSize.s25, AppSize.s30),
                                    ),
                                  ),
                                  child: const Text(AppStrings.bookNow),
                                )
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                  Divider(
                    color: ColorManager.LightSilver,
                    height: AppSize.s50,
                    thickness: AppSize.s1_5,
                    indent: AppMargin.m20,
                    endIndent: AppMargin.m20,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.reviews,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: AppSize.s20),
                          child: ApartmentReview(),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
