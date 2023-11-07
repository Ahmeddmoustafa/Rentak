import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';

import 'package:searchfield/searchfield.dart';

part 'search_filter_state.dart';

class SearchFilterCubit extends Cubit<SearchFilterState> {
  RangeValues rangeValues = const RangeValues(0, 10000);
  DateTime? checkInDate;
  final suggestions = [
    SearchFieldListItem("SeaView chalet"),
    SearchFieldListItem("Villa for family"),
    SearchFieldListItem("Ground Chalet"),
    SearchFieldListItem("Duplex"),
    SearchFieldListItem("Roof Chalet"),
  ];
  final TextEditingController controller = TextEditingController();
  List<String> searchedItems = [];
  SearchFilterCubit() : super(SearchFilterInitial());

  /********************* SLIDER PUBLIC FUNCTIONS        *********** */ ///

  RangeValues get sliderRangeValue => rangeValues;

  void setSliderValues(RangeValues range) {
    emit(SearchFilterInitial());
    rangeValues = range;
    emit(SliderMoved(rangeValues: rangeValues));
  }

  /********************* DATE PUBLIC FUNCTIONS******************* */ ///

  void setCheckInDate(DateTime? date) {
    emit(SearchFilterInitial());
    checkInDate = date;
  }

  String theCheckInDate() {
    emit(DateSelected(dateTime: checkInDate));

    if (checkInDate != null) {
      String date =
          "${checkInDate?.day}/${checkInDate?.month}/${checkInDate?.year}";
      return date;
    }
    return "Select a date";
  }

  /********************* CATEGORY FILTER PUBLIC FUNCTIONS *********** */ ///

  void addCategory(String value) {
    emit(SearchFilterInitial());
    if (!searchedItems.contains(value)) {
      searchedItems.add(controller.text);
    }
    controller.clear();
    emit(CategoryAdded());
  }

  void removeCategory(int index) {
    emit(SearchFilterInitial());
    searchedItems.removeAt(index);
    emit(CategoryRemoved());
  }

  /********************* TOTAL PUBLIC FUNCTIONS *********** */ ///

  void clearFilter() {
    rangeValues = const RangeValues(0, 10000);
    checkInDate = null;
    searchedItems = [];
    emit(FilterCleared());
  }

  void printTheFilter() {
    debugPrint(
        "you have selected a villa with price range ${rangeValues.start.round()} EGP to ${rangeValues.end.round()} EGP on ${checkInDate?.day}/${checkInDate?.month} ");
  }
}
