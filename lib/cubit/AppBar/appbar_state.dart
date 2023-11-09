part of 'appbar_cubit.dart';

@immutable
sealed class AppBarState {}

final class AppBarInitial extends AppBarState {}

final class IsAppBarScrolled extends AppBarState {}
