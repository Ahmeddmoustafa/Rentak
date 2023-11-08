import 'package:equatable/equatable.dart';

class Renter extends Equatable {
  final String name;
  final String id;
  final String image;

  const Renter({required this.name, required this.image, required this.id});

  @override
  List get props => [name, image, id];
}
