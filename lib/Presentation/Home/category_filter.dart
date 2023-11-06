import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentak/Presentation/UsefullWidgets/custom_divider.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/values_manager.dart';

import 'package:searchfield/searchfield.dart';

class CategoryFilter extends StatefulWidget {
  const CategoryFilter({super.key});

  @override
  State<CategoryFilter> createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  final TextEditingController _controller = TextEditingController();
  List<String> searchedItems = [];
  Suggestion suggestion = Suggestion.hidden;
  final suggestions = [
    SearchFieldListItem("SeaView chalet"),
    SearchFieldListItem("Villa for family"),
    SearchFieldListItem("Ground Chalet"),
    SearchFieldListItem("Duplex"),
    SearchFieldListItem("Roof Chalet"),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchField(
            onSubmit: (value) {
              setState(() {
                if (!searchedItems.contains(value)) {
                  searchedItems.add(_controller.text);
                  suggestion = Suggestion.hidden;
                }
                _controller.clear();
              });
            },
            controller: _controller,
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
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    // setState(() {
                    //   searchedItems.add(_controller.text);
                    //   _controller.clear();
                    // });
                  }
                },
              ),
            ),
            itemHeight: AppSize.s40,
            maxSuggestionsInViewPort: 4,
            suggestionsDecoration: SuggestionDecoration(
              color: ColorManager.White,
              borderRadius: BorderRadius.circular(AppSize.s20),
            ),
            onSuggestionTap: (value) {
              setState(() {
                if (!searchedItems.contains(value.searchKey)) {
                  searchedItems.add(_controller.text);
                  suggestion = Suggestion.hidden;
                }
                _controller.clear();
              });
            },
            suggestionState: suggestion,
            suggestionAction: SuggestionAction.unfocus,
            suggestions: suggestions),
        // TextField(
        //   controller: _controller,
        //   onSubmitted: (value) {
        //     if (value.isNotEmpty) {
        //       setState(() {
        //         searchedItems.add(value);
        //         _controller.clear();
        //       });
        //     }
        //   },
        // decoration: InputDecoration(
        //   enabledBorder: Theme.of(context)
        //       .inputDecorationTheme
        //       .enabledBorder!
        //       .copyWith(borderSide: BorderSide.none),
        //   focusedBorder: Theme.of(context)
        //       .inputDecorationTheme
        //       .focusedBorder!
        //       .copyWith(borderSide: BorderSide.none),
        //   hintText: 'What do you look for...',
        //   suffixIcon: IconButton(
        //     icon: const Icon(Icons.search),
        //     onPressed: () {
        //       if (_controller.text.isNotEmpty) {
        //         setState(() {
        //           searchedItems.add(_controller.text);
        //           _controller.clear();
        //           _controller.value = TextEditingValue.empty;
        //         });
        //       }
        //     },
        //   ),
        // ),
        // ),
        CustomDivider(
          color: ColorManager.DarkGrey,
        ),
        Container(
          margin: const EdgeInsets.only(top: AppMargin.m4),
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: searchedItems.length,
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
                          searchedItems[index],
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            searchedItems.removeAt(index);
                          });
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
  }
}
