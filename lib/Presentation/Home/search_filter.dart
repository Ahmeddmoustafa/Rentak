import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentak/Presentation/Home/category_filter.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/values_manager.dart';
import 'package:rentak/cubit/SearchFilter/search_filter_cubit.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({super.key});

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  List<String> searchedItems = [];

  void _openCalendar(BuildContext context) {
    // showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     contentPadding: const EdgeInsets.all(0),
    //     content: Container(
    //       width: AppSize.s200, // Set your desired width here
    //       height: AppSize.s400, // Set your desired height here
    //       child: const SearchCalender(),
    //     ),
    //   ),
    // );
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2024),
    ).then((value) =>
        BlocProvider.of<SearchFilterCubit>(context).setCheckInDate(value));
  }

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<SearchFilterCubit>(context)
    //     .setSliderValues(const RangeValues(0, 10000));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchFilterCubit, SearchFilterState>(
      builder: (context, state) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppSize.s25),
            topRight: Radius.circular(AppSize.s25),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.65,
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
              color: ColorManager.LightSilver,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSize.s25),
                topRight: Radius.circular(AppSize.s25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppSize.s20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CategoryFilter(),
                  Text(
                    "Select your price range (EGP/day) :",
                    style: Theme.of(context).textTheme.displayMedium,
                    textAlign: TextAlign.start,
                  ),
                  // if (state is SliderMoved)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: AppSize.s50,
                        child: Text(
                          context
                              .read<SearchFilterCubit>()
                              .sliderRangeValue
                              .start
                              .round()
                              .toString(),
                        ),
                      ),
                      RangeSlider(
                          inactiveColor: ColorManager.White,
                          activeColor: ColorManager.Black,
                          values: context
                              .read<SearchFilterCubit>()
                              .sliderRangeValue,
                          min: 0,
                          max: 10000,
                          divisions: 10,
                          onChanged: (RangeValues values) {
                            BlocProvider.of<SearchFilterCubit>(context)
                                .setSliderValues(values);
                          }),
                      SizedBox(
                        width: AppSize.s50,
                        child: Text(
                          context
                              .read<SearchFilterCubit>()
                              .sliderRangeValue
                              .end
                              .round()
                              .toString(),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Check-in ",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  GestureDetector(
                    onTap: () => _openCalendar(context),
                    child: Row(
                      children: [
                        Text(
                          context.read<SearchFilterCubit>().theCheckInDate(),
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        const Icon(Icons.calendar_month)
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<SearchFilterCubit>().clearFilter();
                        },
                        child: Row(
                          children: [
                            Text(
                              "Clear filters",
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            Icon(
                              Icons.close,
                              color: ColorManager.DarkGrey,
                              size: AppSize.s20,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<SearchFilterCubit>(context)
                            .printTheFilter();
                        Navigator.pop(context);
                      },
                      style: const ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(
                              Size(AppSize.s200, AppSize.s30))),
                      child: const Text("Apply"),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
