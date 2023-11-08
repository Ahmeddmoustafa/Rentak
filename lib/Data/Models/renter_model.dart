import 'package:rentak/Domain/Entities/Users/renter.dart';

class RenterModel extends Renter {
  const RenterModel({
    required final String name,
    required final String id,
    required final String image,
  }) : super(name: name, id: id, image: image);

  factory RenterModel.fromJson(Map<String, dynamic> json) => RenterModel(
        name: json["name"],
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "image": image,
      };
}
