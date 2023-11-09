import 'package:equatable/equatable.dart';

abstract class Review extends Equatable {
  final String reviewID;

  final String renterID;
  final String renterName;
  final String rating;
  final String renterImage;
  final String reviewDescription;
  final List<String> images;

  const Review(
      {required this.renterID,
      required this.renterName,
      required this.reviewID,
      required this.rating,
      required this.renterImage,
      required this.reviewDescription,
      required this.images});

  @override
  List get props => [
        renterID,
        renterName,
        rating,
        renterImage,
        images,
        reviewDescription,
        reviewID
      ];
}
