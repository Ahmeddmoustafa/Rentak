part of 'search_filter_cubit.dart';

@immutable
sealed class SearchFilterState {}

final class SearchFilterInitial extends SearchFilterState {}

final class SliderMoved extends SearchFilterState {
  final RangeValues _rangeValues;

  SliderMoved({required RangeValues rangeValues}) : _rangeValues = rangeValues;

  RangeValues get sliderRange => _rangeValues;
}

final class DateSelected extends SearchFilterState {
  final DateTime? dateTime;

  DateSelected({required this.dateTime});
}
