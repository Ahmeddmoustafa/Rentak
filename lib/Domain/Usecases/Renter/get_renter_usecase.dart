import 'package:dartz/dartz.dart';

import 'package:rentak/Core/Errors/failures.dart';
import 'package:rentak/Domain/Entities/Users/renter.dart';
import 'package:rentak/Domain/Repositories/firebase_repository.dart';
import 'package:rentak/Domain/Usecases/usecase.dart';

class GetRenter implements UseCase<Renter, String> {
  final FirebaseRepository repository;

  GetRenter({required this.repository});

  @override
  Future<Either<Failure, Renter>> call(String renterID) =>
      repository.getRenter(renterID);
}
