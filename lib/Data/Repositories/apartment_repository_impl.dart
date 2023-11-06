import 'package:dartz/dartz.dart';
import 'package:rentak/Core/Errors/exceptions.dart';
import 'package:rentak/Core/Errors/failures.dart';
import 'package:rentak/Core/Network/network_info.dart';
import 'package:rentak/Data/DataSources/apartment_local_data_source.dart';
import 'package:rentak/Data/DataSources/apartment_remote_data_source.dart';
import 'package:rentak/Domain/Entities/apartment.dart';
import 'package:rentak/Domain/Repositories/apartment_repository.dart';

class ApartmentRepositoryImpl implements ApartmentRepository {
  final NetworkInfo networkInfo;
  final ApartmentLocalDataSource apartmentLocalDataSourceImpl;
  final ApartmentRemoteDataSource apartmentRemoteDataSourceImpl;

  ApartmentRepositoryImpl(
      {required this.apartmentLocalDataSourceImpl,
      required this.apartmentRemoteDataSourceImpl,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<Apartment>>> getApartment() async {
    if (await networkInfo.isConnected) {
      try {
        final apartments = await apartmentRemoteDataSourceImpl.getApartment();
        apartmentLocalDataSourceImpl.cacheApartment(apartments);
        return Right(apartments);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final apartments =
            await apartmentLocalDataSourceImpl.getLastApartment();
        return Right(apartments);
      } on CacheException {
        return Left(CachFailure());
      }
    }
  }
}
