import 'package:rentak/Domain/Entities/Users/renter.dart';
import 'package:rentak/Domain/Entities/apartment.dart';
import 'package:rentak/cubit/SearchFilter/search_filter_cubit.dart';

abstract class LocalDataSource {
  // Future<void> signUpRenter(SignUpParams params);
  // Future<void> signInRenter(SignInParams params);
  Future<void> signOutRenter();
  Future<bool> isRenterSignIn();
  Future<Renter> getSignedInRenter();

  // USER: RENTER
  Future<String> getcurrentRenterId();
  Future<Renter> getRenter(String renterID);
  Future<void> updateRenter(Renter renter);
  Future<void> deleteRenter(String renterID);

  // USER: RENTER -- APARTMENTS
  Future<Apartment> getApartment(String apartmentID);
  Future<List<Apartment>> getApartments(FilterOptions filter);
  Future<void> loadApartments(List<Apartment> apartments);
}
