import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:rentak/Core/Errors/failures.dart';
import 'package:rentak/Domain/Entities/renter.dart';
import 'package:rentak/Domain/Repositories/renter_repository.dart';
import 'package:rentak/Domain/Usecases/usecase.dart';

class GetRenter implements UseCase<Renter, LoginParams> {
  final RenterRepository renterRepository;

  GetRenter({required this.renterRepository});

  @override
  Future<Either<Failure, Renter>> call(LoginParams loginParams) =>
      renterRepository.getRenter(loginParams);
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});
  @override
  List<Object?> get props => [email, password];
}
