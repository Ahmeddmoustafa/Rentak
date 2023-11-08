import 'package:dartz/dartz.dart';

import 'package:rentak/Core/Errors/failures.dart';
import 'package:rentak/Domain/Repositories/firebase_repository.dart';
import 'package:rentak/Domain/Usecases/usecase.dart';

class GetCurrentRenterID implements UseCase<String, NoParams> {
  final FirebaseRepository repository;

  GetCurrentRenterID({required this.repository});

  @override
  Future<Either<Failure, String>> call(NoParams params) =>
      repository.getcurrentRenterId();
}
