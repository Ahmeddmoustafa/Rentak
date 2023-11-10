import 'package:rentak/Data/DataSources/Remote/firebase_remote_data_source.dart';
import 'package:rentak/Domain/Entities/Users/renter.dart';
import 'package:rentak/Domain/Entities/apartment.dart';
import 'package:rentak/Domain/Entities/review.dart';
import 'package:rentak/Domain/Usecases/Renter/sign_in_renter_usecase.dart';
import 'package:rentak/Domain/Usecases/Renter/sign_up_renter_usecase.dart';
import 'package:rentak/Domain/Usecases/RenterReview/create_review_usecase.dart';
import 'package:rentak/cubit/SearchFilter/search_filter_cubit.dart';

//FIREBASE Implementation Is Here

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  // Add here the firebase store and auth and any need parameter...

  //
  /********************************CREDENTIALS*********************************** */ ///
  @override
  Future<bool> isSignIn() {
    throw UnimplementedError();
  }

  @override
  Future<void> signInRenter(SignInParams params) {
    throw UnimplementedError();
  }

  @override
  Future<void> signOutRenter() {
    throw UnimplementedError();
  }

  @override
  Future<void> signUpRenter(SignUpParams params) {
    throw UnimplementedError();
  }

  /********************************USER: RENTER*********************************** */ ///

  @override
  Future<void> deleteRenter(String renterID) {
    throw UnimplementedError();
  }

  @override
  Future<Renter> getRenter(String renterID) {
    throw UnimplementedError();
  }

  @override
  Future<String> getcurrentRenterId() {
    throw UnimplementedError();
  }

  @override
  Future<void> updateRenter() {
    throw UnimplementedError();
  }

  /******************************** USER: RENTER APARTMENT *********************************** */ ///
  @override
  Future<Apartment> createApartment() {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteApartment(String apartmentID) {
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
  Future<void> updateApartment() {
    throw UnimplementedError();
  }

  /******************************** USER: RENTER REVIEW *********************************** */ ///

  @override
  Future<Review> createReview(ReviewParams params) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteReview(String reviewID) {
    throw UnimplementedError();
  }

  @override
  Future<Review> updateReview(ReviewParams params) {
    throw UnimplementedError();
  }
}
