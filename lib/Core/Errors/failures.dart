import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class ServerFailure extends Failure {
  final dynamic msg;
  ServerFailure({required this.msg});
  @override
  List<Object?> get props => [msg];
}

class CacheFailure extends Failure {
  final dynamic msg;
  CacheFailure({required this.msg});
  @override
  List<Object?> get props => [msg];
}
