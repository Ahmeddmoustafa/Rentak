// ignore_for_file: annotate_overrides, overridden_fields

import 'package:rentak/Domain/Entities/apartment.dart';
import 'package:hive/hive.dart';

part 'apartment_model.g.dart';

@HiveType(typeId: 1)
class ApartmentModel extends Apartment {
  @HiveField(0)
  final String place;

  @HiveField(1)
  final String price;

  @HiveField(2)
  final String rating;

  @HiveField(3)
  final String image;

  const ApartmentModel({
    required this.place,
    required this.price,
    required this.rating,
    required this.image,
  }) : super(place: place, price: price, rating: rating, image: image);

  factory ApartmentModel.fromJson(Map<String, dynamic> json) => ApartmentModel(
        place: json["place"],
        price: json["price"],
        rating: json["rating"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "place": place,
        "price": price,
        "rating": rating,
        "image": image,
      };
}
