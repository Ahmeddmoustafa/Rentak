import 'package:rentak/Data/DataSources/Local/local_data_source.dart';
import 'package:rentak/Domain/Entities/Users/renter.dart';
import 'package:rentak/Domain/Entities/apartment.dart';
import 'package:rentak/cubit/SearchFilter/search_filter_cubit.dart';

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<Renter> getSignedInRenter() {
    throw UnimplementedError();
  }

  @override
  Future<bool> isRenterSignIn() {
    throw UnimplementedError();
  }

  @override
  Future<void> signOutRenter() {
    throw UnimplementedError();
  }

  @override
  Future<void> updateRenter(Renter renter) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteRenter(String renterID) {
    throw UnimplementedError();
  }

  @override
  Future<String> getcurrentRenterId() {
    throw UnimplementedError();
  }

  @override
  Future<Renter> getRenter(String renterID) {
    throw UnimplementedError();
  }

  @override
  Future<Apartment> getApartment(String apartmentID) {
    throw UnimplementedError();
  }

  @override
  Future<List<Apartment>> getApartments(FilterOptions filter) {
    throw UnimplementedError();
  }

  @override
  Future<void> loadApartments(List<Apartment> apartments) {
    throw UnimplementedError();
  }
}
