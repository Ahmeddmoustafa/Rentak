// ignore_for_file: annotate_overrides, overridden_fields

import 'package:hive/hive.dart';
import 'package:rentak/Domain/Entities/Users/renter.dart';
part 'renter_model.g.dart';

@HiveType(typeId: 2)
class RenterModel extends Renter {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String id;
  @HiveField(2)
  final String image;
  const RenterModel({
    required this.name,
    required this.id,
    required this.image,
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
