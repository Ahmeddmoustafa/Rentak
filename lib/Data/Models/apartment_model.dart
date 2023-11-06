import 'package:rentak/Domain/Entities/apartment.dart';

class ApartmentModel extends Apartment {
  const ApartmentModel({
    required String place,
    required String price,
    required String rating,
    required String image,
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
