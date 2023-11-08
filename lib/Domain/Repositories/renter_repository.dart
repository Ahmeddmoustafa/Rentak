import 'package:dartz/dartz.dart';

import 'package:rentak/Core/Errors/failures.dart';
import 'package:rentak/Domain/Entities/Users/renter.dart';
import 'package:rentak/Domain/Usecases/Renter/sign_in_renter_usecase.dart';

abstract class RenterRepository {
  Future<Either<Failure, Renter>> getRenter(SignInParams signInParams);
}
