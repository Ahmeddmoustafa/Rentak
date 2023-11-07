part of 'apartment_cubit.dart';

@immutable
sealed class ApartmentState {}

final class ApartmentInitial extends ApartmentState {}

final class ApartmentFailed extends ApartmentState {
  final String msg;

  ApartmentFailed({required this.msg});
}

final class ApartmentLoaded extends ApartmentState {
  final List<Apartment> apartments;

  ApartmentLoaded({required this.apartments});
}

final class ApartmentSelected extends ApartmentState {
  final Apartment apartment;

  ApartmentSelected({required this.apartment});
}
