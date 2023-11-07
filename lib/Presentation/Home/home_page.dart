import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentak/Presentation/Home/near_apartment.dart';
import 'package:rentak/Presentation/Home/popular_places.dart';
import 'package:rentak/Presentation/Home/search_filter.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/values_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget showTheBottomSheet() {
    return const SearchFilter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BlocProvider(
      //   create: (context) => BottomBarCubit(),
      //   child: const CustomBottomAppBar(),
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: AppSize.s50),
        child: Column(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        color: ColorManager.Black,
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            "Find Your Dream Villa",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.0,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.09,
                        child: TextField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorManager.White,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s14),
                                borderSide:
                                    BorderSide(color: ColorManager.LightGrey),
                              ),
                              suffixIcon: Icon(
                                Icons.arrow_forward,
                                color: ColorManager.Black,
                              ),
                              hintText: "Search for a villa or location",
                              prefixIcon: IconButton(
                                splashRadius: AppSize.s20,
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: ColorManager.Transparent,
                                      builder: (context) =>
                                          showTheBottomSheet());
                                },
                                icon: Icon(
                                  Icons.filter_list,
                                  // weight: 200,
                                  color: ColorManager.Black,
                                ),
                              )),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left: AppSize.s25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: AppSize.s25),
                        child: Text(
                          "Villas near North Coast",
                          style: Theme.of(context).textTheme.displayMedium,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const NearApartments(),
                      Container(
                        margin: const EdgeInsets.only(top: AppSize.s25),
                        child: Text(
                          "Other popular places",
                          style: Theme.of(context).textTheme.displayMedium,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: AppSize.s12),
                        child: const PopularPlaces(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
