import 'package:rentak/Domain/Entities/Users/renter.dart';
import 'package:rentak/Domain/Usecases/Renter/sign_in_renter_usecase.dart';
import 'package:rentak/Domain/Usecases/Renter/sign_up_renter_usecase.dart';

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
}
