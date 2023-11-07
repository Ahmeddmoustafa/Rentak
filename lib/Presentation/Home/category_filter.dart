import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentak/Presentation/UsefullWidgets/custom_divider.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/values_manager.dart';
import 'package:rentak/cubit/SearchFilter/search_filter_cubit.dart';

import 'package:searchfield/searchfield.dart';

class CategoryFilter extends StatefulWidget {
  const CategoryFilter({super.key});

  @override
  State<CategoryFilter> createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  Suggestion suggestion = Suggestion.hidden;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchFilterCubit, SearchFilterState>(
      builder: (context, state) {
        return Column(
          children: [
            SearchField(
              onSubmit: (value) {},
              controller: context.read<SearchFilterCubit>().controller,
              searchInputDecoration: InputDecoration(
                enabledBorder: Theme.of(context)
                    .inputDecorationTheme
                    .enabledBorder!
                    .copyWith(borderSide: BorderSide.none),
                focusedBorder: Theme.of(context)
                    .inputDecorationTheme
                    .focusedBorder!
                    .copyWith(borderSide: BorderSide.none),
                hintText: 'What do you look for...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
              ),
              itemHeight: AppSize.s40,
              maxSuggestionsInViewPort: 4,
              suggestionsDecoration: SuggestionDecoration(
                color: ColorManager.White,
                borderRadius: BorderRadius.circular(AppSize.s20),
              ),
              onSuggestionTap: (value) {
                context.read<SearchFilterCubit>().addCategory(value.searchKey);
              },
              suggestionState: Suggestion.hidden,
              suggestionAction: SuggestionAction.unfocus,
              suggestions: context.read<SearchFilterCubit>().suggestions,
            ),
            CustomDivider(
              color: ColorManager.DarkGrey,
            ),
            Container(
              margin: const EdgeInsets.only(top: AppMargin.m4),
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:
                      context.read<SearchFilterCubit>().searchedItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 16 / 5,
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(AppMargin.m4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s8),
                          border: Border.all(color: ColorManager.LightGrey)),
                      // width: AppSize.s14,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              context
                                  .read<SearchFilterCubit>()
                                  .searchedItems[index],
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<SearchFilterCubit>()
                                  .removeCategory(index);
                            },
                            child: const Icon(
                              Icons.close_sharp,
                              size: AppSize.s20,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        );
      },
    );
  }
}
