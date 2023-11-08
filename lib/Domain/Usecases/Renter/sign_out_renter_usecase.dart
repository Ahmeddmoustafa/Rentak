import 'package:dartz/dartz.dart';

import 'package:rentak/Core/Errors/failures.dart';
import 'package:rentak/Domain/Repositories/firebase_repository.dart';
import 'package:rentak/Domain/Usecases/usecase.dart';

class SignOutRenter implements UseCase<void, NoParams> {
  final FirebaseRepository repository;

  SignOutRenter({required this.repository});

  @override
  Future<Either<Failure, void>> call(NoParams params) =>
      repository.signOutRenter();
}
