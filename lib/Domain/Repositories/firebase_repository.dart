import 'package:dartz/dartz.dart';
import 'package:rentak/Core/Errors/failures.dart';
import 'package:rentak/Domain/Entities/Users/renter.dart';
import 'package:rentak/Domain/Usecases/Renter/sign_in_renter_usecase.dart';
import 'package:rentak/Domain/Usecases/Renter/sign_up_renter_usecase.dart';

abstract class FirebaseRepository {
  // CREDENTIALS
  Future<Either<Failure, void>> signUpRenter(SignUpParams params);
  Future<Either<Failure, void>> signInRenter(SignInParams params);
  Future<Either<Failure, void>> signOutRenter();
  Future<Either<Failure, bool>> isSignIn();

  // USER: RENTER
  Future<Either<Failure, String>> getcurrentRenterId();
  Future<Either<Failure, Renter>> getRenter(String renterID);
  Future<Either<Failure, void>> updateRenter();
  Future<Either<Failure, void>> deleteRenter(String renterID);
}
