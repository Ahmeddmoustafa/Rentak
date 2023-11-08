import 'package:rentak/Data/DataSources/Remote/firebase_remote_data_source.dart';
import 'package:rentak/Domain/Entities/Users/renter.dart';
import 'package:rentak/Domain/Usecases/Renter/sign_in_renter_usecase.dart';
import 'package:rentak/Domain/Usecases/Renter/sign_up_renter_usecase.dart';

//FIREBASE Implementation Is Here

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  // Add here the firebase store and auth and any need parameter...

  //
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

  @override
  Future<void> updateRenter() {
    throw UnimplementedError();
  }
}
