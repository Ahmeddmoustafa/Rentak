import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:rentak/Core/Errors/failures.dart';
import 'package:rentak/Domain/Repositories/firebase_repository.dart';
import 'package:rentak/Domain/Usecases/usecase.dart';

class SignUpRenter implements UseCase<void, SignUpParams> {
  final FirebaseRepository repository;

  SignUpRenter({required this.repository});

  @override
  Future<Either<Failure, void>> call(SignUpParams params) =>
      repository.signUpRenter(params);
}

class SignUpParams extends Equatable {
  final String email;
  final String password;

  const SignUpParams({required this.email, required this.password});
  @override
  List<Object?> get props => [email, password];
}
