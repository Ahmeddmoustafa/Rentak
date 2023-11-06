part of 'theme_cubit.dart';

@immutable
sealed class ThemeState {
  ThemeMode get themeMode;
  const ThemeState();
}

final class ThemeInitial extends ThemeState {
  final ThemeMode _themeMode = ThemeMode.system;
  @override
  ThemeMode get themeMode => _themeMode;
}

final class DarkTheme extends ThemeState {
  final ThemeMode _themeMode;

  const DarkTheme({required ThemeMode themeMode}) : _themeMode = themeMode;
  @override
  ThemeMode get themeMode => _themeMode;
}

final class BrightTheme extends ThemeState {
  final ThemeMode _themeMode;

  const BrightTheme({required ThemeMode themeMode}) : _themeMode = themeMode;
  @override
  ThemeMode get themeMode => _themeMode;
}
