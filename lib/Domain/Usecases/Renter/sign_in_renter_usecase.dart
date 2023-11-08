import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:rentak/Core/Errors/failures.dart';
import 'package:rentak/Domain/Repositories/firebase_repository.dart';
import 'package:rentak/Domain/Usecases/usecase.dart';

class SignInRenter implements UseCase<void, SignInParams> {
  final FirebaseRepository repository;

  SignInRenter({required this.repository});

  @override
  Future<Either<Failure, void>> call(SignInParams params) =>
      repository.signInRenter(params);
}

class SignInParams extends Equatable {
  final String email;
  final String password;

  const SignInParams({required this.email, required this.password});
  @override
  List<Object?> get props => [email, password];
}
