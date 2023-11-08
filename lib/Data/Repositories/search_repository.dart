import 'package:dartz/dartz.dart';
import 'package:rentak/Core/Errors/exceptions.dart';
import 'package:rentak/Core/Errors/failures.dart';
import 'package:rentak/Core/Network/network_info.dart';
import 'package:rentak/Data/DataSources/search_remote_darta_source.dart';
import 'package:rentak/Domain/Entities/apartment.dart';
import 'package:rentak/Domain/Repositories/search_repository.dart';
import 'package:rentak/Domain/Usecases/search_usecase.dart';

class SearchRepositoryImpl implements SearchRepository {
  final NetworkInfo networkInfo;
  final SearchRemoteDataSource searchRemoteDataSourceImpl;

  SearchRepositoryImpl(
      {required this.searchRemoteDataSourceImpl, required this.networkInfo});

  @override
  Future<Either<Failure, List<Apartment>>> getSearchResults(
      SearchParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final apartments = await searchRemoteDataSourceImpl.getSearchResults();
        // apartmentLocalDataSourceImpl.cacheApartment(apartments);
        return Right(apartments);
      } on ServerException {
        return Left(ServerFailure(msg: "error"));
      }
    } else {
      return Left(ServerFailure(msg: "error"));
    }
    // else {
    //   try {
    //     final apartments =
    //         await apartmentLocalDataSourceImpl.getLastApartment();
    //     return Right(apartments);
    //   } on CacheException {
    //     return Left(CachFailure());
    //   }
    // }
  }
}
