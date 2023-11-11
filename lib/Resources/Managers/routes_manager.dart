// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentak/Presentation/Apartment/apartement_details_screen.dart';
import 'package:rentak/Presentation/Apartment/apartment_page.dart';
import 'package:rentak/Presentation/Home/home_page.dart';
import 'package:rentak/Presentation/Home/home_view.dart';
import 'package:rentak/Presentation/Login/login_page.dart';
import 'package:rentak/Resources/Managers/strings_manager.dart';
import 'package:rentak/cubit/AppBar/appbar_cubit.dart';

class Routes {
  static const String mainRoute = '/main';
  static const String apartmentRoute = '/apartment';
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String storeDetailsRoute = '/store';
  static const String onBoardingRoute = '/onboarding';
  static const String settingsRoute = '/settings';
  static const String homeRoute = "/home";
  static const String detailsRoute = "/details";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainRoute:
        {
          return MaterialPageRoute(
              builder: (context) => SafeArea(child: HomePage()));
        }
      case Routes.apartmentRoute:
        {
          return MaterialPageRoute(
              builder: (context) => SafeArea(
                      child: BlocProvider(
                    create: (context) => AppBarCubit(),
                    child: ApartmentPage(),
                  )));
        }
      case Routes.loginRoute:
        {
          return MaterialPageRoute(
              builder: (context) => SafeArea(child: LoginPage()));
        }
      case Routes.homeRoute:
        {
          return MaterialPageRoute(
              builder: (context) => SafeArea(child: HomeView()));
        }
      case Routes.detailsRoute:
        {
          return MaterialPageRoute(
              builder: (context) => SafeArea(child: ApartementDetailsScreen()));
        }

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: Text(AppStrings.noRouteFound),
      ),
    );
  }
}
