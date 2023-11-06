import 'package:dartz/dartz.dart';
import 'package:rentak/Core/Errors/failures.dart';
import 'package:rentak/Domain/Entities/apartment.dart';
import 'package:rentak/Domain/Repositories/apartment_repository.dart';
import 'package:rentak/Domain/Usecases/usecase.dart';

class GetApartment implements UseCase<List<Apartment>, NoParams> {
  final ApartmentRepository apartmentRepository;

  GetApartment({required this.apartmentRepository});

  @override
  Future<Either<Failure, List<Apartment>>> call(NoParams params) =>
      apartmentRepository.getApartment();
}
