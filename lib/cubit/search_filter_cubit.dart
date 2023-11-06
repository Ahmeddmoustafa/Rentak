import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';

import 'package:searchfield/searchfield.dart';

part 'search_filter_state.dart';

class SearchFilterCubit extends Cubit<SearchFilterState> {
  RangeValues rangeValues = const RangeValues(0, 100);
  DateTime? checkInDate;
  final suggestions = [
    SearchFieldListItem("SeaView chalet"),
    SearchFieldListItem("Villa for family"),
    SearchFieldListItem("Ground Chalet"),
    SearchFieldListItem("Duplex"),
    SearchFieldListItem("Roof Chalet"),
  ];
  SearchFilterCubit() : super(SearchFilterInitial());

  RangeValues get sliderRangeValue => rangeValues;
  String theCheckInDate() {
    emit(DateSelected(dateTime: checkInDate));

    if (checkInDate != null) {
      String date =
          "${checkInDate?.day}/${checkInDate?.month}/${checkInDate?.year}";
      return date;
    }
    return "Select a date";
  }

  void setSliderValues(RangeValues range) {
    emit(SearchFilterInitial());
    rangeValues = range;
    emit(SliderMoved(rangeValues: rangeValues));
  }

  void setCheckInDate(DateTime? date) {
    emit(SearchFilterInitial());
    checkInDate = date;
  }

  void printTheFilter() {
    debugPrint(
        "you have selected a villa with price range ${rangeValues.start.round()} EGP to ${rangeValues.end.round()} EGP on ${checkInDate?.day}/${checkInDate?.month} ");
  }
}
