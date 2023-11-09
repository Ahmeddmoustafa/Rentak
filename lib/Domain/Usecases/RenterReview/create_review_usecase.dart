import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:rentak/Core/Errors/failures.dart';
import 'package:rentak/Domain/Entities/review.dart';
import 'package:rentak/Domain/Repositories/firebase_repository.dart';
import 'package:rentak/Domain/Usecases/usecase.dart';

class CreateReview implements UseCase<Review, ReviewParams> {
  final FirebaseRepository repository;

  CreateReview({required this.repository});

  @override
  Future<Either<Failure, Review>> call(ReviewParams params) =>
      repository.createReview(params);
}

class ReviewParams extends Equatable {
  final String renterID;
  final String renterName;
  final String rating;
  final String renterImage;
  final String reviewDescription;
  final List<String> images;

  const ReviewParams(
      {required this.renterID,
      required this.renterName,
      required this.rating,
      required this.renterImage,
      required this.reviewDescription,
      required this.images});

  @override
  List<Object?> get props => [
        renterID,
        renterImage,
        renterName,
        reviewDescription,
        images,
        rating,
      ];
}
