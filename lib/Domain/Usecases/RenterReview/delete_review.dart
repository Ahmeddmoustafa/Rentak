import 'package:dartz/dartz.dart';

import 'package:rentak/Core/Errors/failures.dart';
import 'package:rentak/Domain/Repositories/firebase_repository.dart';
import 'package:rentak/Domain/Usecases/usecase.dart';

class CreateReview implements UseCase<void, String> {
  final FirebaseRepository repository;

  CreateReview({required this.repository});

  @override
  Future<Either<Failure, void>> call(String reviewID) =>
      repository.deleteReview(reviewID);
}
