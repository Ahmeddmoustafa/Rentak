import 'package:dartz/dartz.dart';

import 'package:rentak/Core/Errors/failures.dart';
import 'package:rentak/Domain/Entities/apartment.dart';

abstract class ApartmentRepository {
  Future<Either<Failure, List<Apartment>>> getApartment();
}
