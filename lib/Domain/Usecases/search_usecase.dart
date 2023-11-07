import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rentak/Core/Errors/failures.dart';
import 'package:rentak/Domain/Entities/apartment.dart';
import 'package:rentak/Domain/Repositories/search_repository.dart';
import 'package:rentak/Domain/Usecases/usecase.dart';

class GetSearchResultst implements UseCase<List<Apartment>, SearchParams> {
  final SearchRepository searchRepository;

  GetSearchResultst({required this.searchRepository});

  @override
  Future<Either<Failure, List<Apartment>>> call(SearchParams params) =>
      searchRepository.getSearchResults(params);
}

// Filter options and search value
class SearchParams extends Equatable {
  final String place;
  final int startPrice;
  final int endPrice;
  final DateTime checkInDate;
  final List<String> categories;

  const SearchParams(
      {required this.startPrice,
      required this.place,
      required this.endPrice,
      required this.checkInDate,
      required this.categories});

  @override
  List<Object?> get props =>
      [place, startPrice, endPrice, checkInDate, categories];
}
