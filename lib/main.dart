import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentak/Core/injection_control.dart' as di;

import 'package:rentak/Resources/Managers/routes_manager.dart';
import 'package:rentak/Resources/Theme/theme_data.dart';
import 'package:rentak/Resources/Theme/theme_manager.dart';
import 'package:rentak/cubit/Apartment/apartment_cubit.dart';
import 'package:rentak/cubit/Login/login_cubit.dart';
import 'package:rentak/cubit/SearchFilter/search_filter_cubit.dart';

// import 'Cubit/login_cubit.dart';
// import 'cubit/search_filter_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeMode themeMode = ThemeManager().themeMode;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<ApartmentCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<LoginCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<SearchFilterCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getApplicationtheme(false),
        darkTheme: getApplicationtheme(true),
        // themeMode: state.themeMode,

        // home: HomePage(),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.mainRoute,
      ),
    );
  }
}
