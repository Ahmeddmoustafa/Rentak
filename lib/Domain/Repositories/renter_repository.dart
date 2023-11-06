import 'package:dartz/dartz.dart';

import 'package:rentak/Core/Errors/failures.dart';
import 'package:rentak/Domain/Entities/renter.dart';
import 'package:rentak/Domain/Usecases/renter_usecase.dart';

abstract class RenterRepository {
  Future<Either<Failure, Renter>> getRenter(LoginParams loginParams);
}
