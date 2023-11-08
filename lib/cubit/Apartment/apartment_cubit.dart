import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';

import 'package:rentak/Core/Errors/failures.dart';
import 'package:rentak/Domain/Entities/apartment.dart';
import 'package:rentak/Domain/Usecases/apartment_usecase.dart';
import 'package:rentak/Domain/Usecases/usecase.dart';
part 'apartment_state.dart';

class ApartmentCubit extends Cubit<ApartmentState> {
  final GetApartment getApartments;
  List<Apartment> loadedApartments = []; // The previously loaded Apartments

  ApartmentCubit({required this.getApartments}) : super(ApartmentInitial());

  Future<void> loadApartments() async {
    emit(ApartmentInitial());
    final Either<Failure, List<Apartment>> apartments;
    // if the apartments loaded before then dont load again
    // note: when the data changes it wont reflect on the app without refreshing
    if (loadedApartments.isEmpty) {
      apartments = await getApartments(NoParams());
    } else {
      apartments = right(loadedApartments);
    }

    emit(apartments
        .fold((failure) => ApartmentFailed(msg: _mapFailureToString(failure)),
            (aparmentsList) {
      loadedApartments = aparmentsList;
      return ApartmentLoaded(apartments: aparmentsList);
    }));
    return Future.value();
  }

  Future<void> selectedApartment(Apartment apartment) {
    emit(ApartmentSelected(apartment: apartment));
    return Future.value();
  }

  String _mapFailureToString(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "SERVER_FAILURE";

      case CacheFailure:
        return "CACHE_FAILUR";

      default:
        return "UNEXPECTED_ERROR";
    }
  }
}
