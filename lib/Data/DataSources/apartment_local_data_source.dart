import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:rentak/Core/Errors/exceptions.dart';
import 'package:rentak/Data/Models/apartment_model.dart';
import 'package:rentak/Domain/Entities/apartment.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ApartmentLocalDataSource {
  Future<void> cacheApartment(List<Apartment> book);

  Future<List<Apartment>> getLastApartment();
}

class AparmtentLocalDataSourceImpl implements ApartmentLocalDataSource {
  final SharedPreferences prefs;

  AparmtentLocalDataSourceImpl({required this.prefs});

  @override
  Future<void> cacheApartment(List<Apartment> apartment) {
    prefs.setString("GET_LAST_APARTMENT", jsonEncode(apartment));
    // prefs.setStringList("GET_LAST_APARTMENT", jsonEncode(apartment));

    return Future.value();
  }

  @override
  Future<List<Apartment>> getLastApartment() async {
    String? jsonString = prefs.getString("GET_LAST_APARTMENT");
    if (jsonString != null) {
      // print("[${jsonDecode(jsonString).length}]");
      final decodedString = jsonDecode(jsonString);

      List<Apartment> apartments = [];
      for (int i = 0; i < decodedString.length; i++) {
        apartments.add(ApartmentModel.fromJson(decodedString[i]));
      }

      // print(apartments);
      return Future.value(apartments);
    } else {
      throw CacheException();
    }
  }
}
