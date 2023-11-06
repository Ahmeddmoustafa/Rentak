import 'package:dartz/dartz.dart';
import 'package:rentak/Core/Errors/exceptions.dart';
import 'package:rentak/Core/Errors/failures.dart';
import 'package:rentak/Data/DataSources/renter_remote_data_source.dart';
import 'package:rentak/Domain/Entities/renter.dart';
import 'package:rentak/Domain/Repositories/renter_repository.dart';
import 'package:rentak/Domain/Usecases/renter_usecase.dart';

class RenterRepositoryImpl implements RenterRepository {
  final RenterRemoteDataSource _renterRemoteDataSource;

  RenterRepositoryImpl({required RenterRemoteDataSource renterRemoteDataSource})
      : _renterRemoteDataSource = renterRemoteDataSource;
  @override
  Future<Either<Failure, Renter>> getRenter(LoginParams loginParams) async {
    try {
      final renter = await _renterRemoteDataSource.getRenter(
          loginParams.email, loginParams.password);
      return right(renter);
    } on ServerFailure {
      throw (left(ServerException()));
    }
  }
}
