import 'package:dartz/dartz.dart';

import 'package:rentak/Core/Errors/failures.dart';
import 'package:rentak/Domain/Entities/apartment.dart';
import 'package:rentak/Domain/Usecases/search_usecase.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<Apartment>>> getSearchResults(
      SearchParams params);
}
