import 'package:dartz/dartz.dart';
import 'package:rentak/Core/Errors/failures.dart';
import 'package:rentak/Data/DataSources/Remote/firebase_remote_data_source.dart';
import 'package:rentak/Domain/Entities/Users/renter.dart';
import 'package:rentak/Domain/Entities/review.dart';
import 'package:rentak/Domain/Repositories/firebase_repository.dart';
import 'package:rentak/Domain/Usecases/Renter/sign_in_renter_usecase.dart';
import 'package:rentak/Domain/Usecases/Renter/sign_up_renter_usecase.dart';
import 'package:rentak/Domain/Usecases/RenterReview/create_review_usecase.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseRemoteDataSource firebaseRemoteDataSource;

  FirebaseRepositoryImpl({required this.firebaseRemoteDataSource});

  @override
  Future<Either<Failure, void>> deleteRenter(String renterID) async {
    try {
      return Right(firebaseRemoteDataSource.deleteRenter(renterID));
    } catch (err) {
      return Left(ServerFailure(msg: err.toString()));
    }
  }

  @override
  Future<Either<Failure, Renter>> getRenter(String renterID) async {
    try {
      return Right(await firebaseRemoteDataSource.getRenter(renterID));
    } catch (err) {
      return Left(ServerFailure(msg: err.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getcurrentRenterId() async {
    try {
      return Right(await firebaseRemoteDataSource.getcurrentRenterId());
    } catch (err) {
      return Left(ServerFailure(msg: err.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isSignIn() async {
    try {
      return Right(await firebaseRemoteDataSource.isSignIn());
    } catch (err) {
      return Left(ServerFailure(msg: err.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signInRenter(SignInParams params) async {
    try {
      return Right(await firebaseRemoteDataSource.signInRenter(params));
    } catch (err) {
      return Left(ServerFailure(msg: err.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOutRenter() async {
    try {
      return Right(await firebaseRemoteDataSource.signOutRenter());
    } catch (err) {
      return Left(ServerFailure(msg: err.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signUpRenter(SignUpParams params) async {
    try {
      return Right(await firebaseRemoteDataSource.signUpRenter(params));
    } catch (err) {
      return Left(ServerFailure(msg: err.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateRenter() async {
    try {
      return Right(await firebaseRemoteDataSource.updateRenter());
    } catch (err) {
      return Left(ServerFailure(msg: err.toString()));
    }
  }

  @override
  Future<Either<Failure, Review>> createReview(ReviewParams params) async {
    try {
      return Right(await firebaseRemoteDataSource.createReview(params));
    } catch (err) {
      return Left(ServerFailure(msg: err.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteReview(String reviewID) async {
    try {
      return Right(await firebaseRemoteDataSource.deleteReview(reviewID));
    } catch (err) {
      return Left(ServerFailure(msg: err.toString()));
    }
  }

  @override
  Future<Either<Failure, Review>> updateReview(ReviewParams params) async {
    try {
      return Right(await firebaseRemoteDataSource.updateReview(params));
    } catch (err) {
      return Left(ServerFailure(msg: err.toString()));
    }
  }
}
