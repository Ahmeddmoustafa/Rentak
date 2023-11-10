import 'package:rentak/Domain/Entities/Users/renter.dart';
import 'package:rentak/Domain/Entities/apartment.dart';
import 'package:rentak/Domain/Entities/review.dart';
import 'package:rentak/Domain/Usecases/Renter/sign_in_renter_usecase.dart';
import 'package:rentak/Domain/Usecases/Renter/sign_up_renter_usecase.dart';
import 'package:rentak/Domain/Usecases/RenterReview/create_review_usecase.dart';
import 'package:rentak/cubit/SearchFilter/search_filter_cubit.dart';

abstract class FirebaseRemoteDataSource {
  // CREDENTIALS
  Future<void> signUpRenter(SignUpParams params);
  Future<void> signInRenter(SignInParams params);
  Future<void> signOutRenter();
  Future<bool> isSignIn();

  // USER: RENTER
  Future<String> getcurrentRenterId();
  Future<Renter> getRenter(String renterID);
  Future<void> updateRenter();
  Future<void> deleteRenter(String renterID);

  // USER: RENTER -- APARTMENTS
  Future<Apartment> getApartment(String apartmentID);
  Future<List<Apartment>> getApartments(FilterOptions filter);

  // USER: RENTER -- REVIEWS
  Future<Review> createReview(ReviewParams params);
  Future<void> deleteReview(String reviewID);
  Future<Review> updateReview(ReviewParams params);

  //USER:OWNER -- APARTMENTS
  Future<Apartment> createApartment();
  Future<void> updateApartment();
  Future<void> deleteApartment(String apartmentID);
}
