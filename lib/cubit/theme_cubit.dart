import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeMode theme = ThemeMode.system;

  ThemeCubit() : super(ThemeInitial());

  ThemeMode get appTheme => theme;

  void toggletheme() {
    emit(ThemeInitial());
    switch (theme) {
      case (ThemeMode.dark):
        theme = ThemeMode.system;
        emit(BrightTheme(themeMode: theme));
      case (ThemeMode.system):
        theme = ThemeMode.dark;
        emit(DarkTheme(themeMode: theme));
      default:
        return;
    }
  }
}
