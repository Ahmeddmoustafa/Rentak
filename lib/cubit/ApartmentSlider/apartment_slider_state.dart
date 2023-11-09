part of 'apartment_slider_cubit.dart';

@immutable
sealed class ApartmentSliderState {}

class ApartmentSliderInitial extends ApartmentSliderState {}

class ApartmentSliderMoved extends ApartmentSliderState {}
