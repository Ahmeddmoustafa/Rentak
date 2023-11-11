import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rentak/Core/Network/network_info.dart';
import 'package:rentak/Data/DataSources/Remote/firebase_remote_data_source.dart';
import 'package:rentak/Data/DataSources/Remote/firebase_remote_data_source_impl.dart';
import 'package:rentak/Data/DataSources/apartment_local_data_source.dart';
import 'package:rentak/Data/DataSources/apartment_remote_data_source.dart';
import 'package:rentak/Data/DataSources/renter_remote_data_source.dart';
import 'package:rentak/Data/Models/apartment_model.dart';
import 'package:rentak/Data/Models/renter_model.dart';
import 'package:rentak/Data/Repositories/apartment_repository_impl.dart';
import 'package:rentak/Data/Repositories/firebase_repository.dart';
import 'package:rentak/Data/Repositories/renter_repository.dart';
import 'package:rentak/Domain/Repositories/apartment_repository.dart';
import 'package:rentak/Domain/Repositories/firebase_repository.dart';
import 'package:rentak/Domain/Repositories/renter_repository.dart';
import 'package:rentak/Domain/Usecases/Renter/get_renter_usecase.dart';
import 'package:rentak/Domain/Usecases/apartment_usecase.dart';
import 'package:rentak/cubit/Apartment/apartment_cubit.dart';
import 'package:rentak/cubit/Login/login_cubit.dart';
import 'package:rentak/cubit/SearchFilter/search_filter_cubit.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //   // **************** HIVE PACKAGES ************************//

  Hive.registerAdapter(ApartmentModelAdapter());
  await Hive.openBox<ApartmentModel>("Apartments");
  Hive.registerAdapter(RenterModelAdapter());
  await Hive.openBox<RenterModel>("Renters");

  //   // **************** EXTERNAL PACKAGES ************************//

  final sharedprefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedprefs);

  sl.registerLazySingleton<http.Client>(() => http.Client());

  // *************************** CORES **************************//

  sl.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );

//   //**********************  Internal Classes  *********************************** */

  sl.registerLazySingleton<ApartmentLocalDataSource>(
    () => AparmtentLocalDataSourceImpl(
      prefs: sl(),
    ),
  );

  sl.registerLazySingleton<ApartmentRemoteDataSource>(
    () => ApartmentRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<FirebaseRemoteDataSource>(
      () => FirebaseRemoteDataSourceImpl());

  sl.registerLazySingleton<RenterRemoteDataSource>(
    () => RenterRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      internetConnectionChecker: sl(),
    ),
  );

  sl.registerLazySingleton<ApartmentRepository>(
    () => ApartmentRepositoryImpl(
      apartmentLocalDataSourceImpl: sl(),
      apartmentRemoteDataSourceImpl: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<RenterRepository>(
    () => RenterRepositoryImpl(
      renterRemoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<FirebaseRepository>(() => FirebaseRepositoryImpl(
        firebaseRemoteDataSource: sl(),
      ));

  sl.registerLazySingleton<GetApartment>(
    () => GetApartment(
      apartmentRepository: sl(),
    ),
  );
  sl.registerLazySingleton<GetRenter>(
    () => GetRenter(
      repository: sl(),
    ),
  );

  sl.registerFactory(
    () => ApartmentCubit(
      getApartments: sl(),
    ),
  );
  sl.registerFactory(() => LoginCubit(getRenter: sl()));

  sl.registerFactory(() => SearchFilterCubit());
}




//   //final sharedprefs = await SharedPreferences.getInstance();
//   // final bookRepo = BookRepositoryImpl(
//   //   bookLocalDataSourceImpl: BookLocalDataSourceImpl(prefs: sharedprefs),
//   //   bookRemoteDataSourceImpl: BookRemoteDataSourceImpl(client: http.Client()),
//   //   networkInfo:
//   //       NetworkInfoImpl(internetConnectionChecker: InternetConnectionChecker()),
//   // );

//   // final getBook = GetBook(bookRepository: bookRepo);

//   // final cubit = BookCubit(appBooks: getBook);

//   // return cubit;