import 'package:equatable/equatable.dart';

abstract class Apartment extends Equatable {
  final String place;
  final String price;
  final String rating;
  final String image;

  const Apartment(
      {required this.place,
      required this.price,
      required this.image,
      required this.rating});

  @override
  List get props => [place, price, rating, image];
}
