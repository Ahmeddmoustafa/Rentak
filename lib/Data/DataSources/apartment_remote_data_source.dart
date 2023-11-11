import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:rentak/Core/Errors/exceptions.dart';
import 'package:rentak/Data/Models/apartment_model.dart';
import 'package:rentak/Domain/Entities/apartment.dart';

abstract class ApartmentRemoteDataSource {
  Future<List<Apartment>> getApartment();
}

class ApartmentRemoteDataSourceImpl implements ApartmentRemoteDataSource {
  final http.Client client;

  ApartmentRemoteDataSourceImpl({required this.client});

  @override
  Future<List<Apartment>> getApartment() async {
    Uri uri = Uri.parse(
        "https://e6dee12a-32fb-40bc-bb59-3addcbd5e482.mock.pstmn.io/");
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final jsonString = response.body;
      // print(jsonDecode(jsonString)[0]);
      final List decodedJson = jsonDecode(jsonString);
      List<Apartment> apartments = [];
      for (int i = 0; i < decodedJson.length; i++) {
        apartments.add(ApartmentModel.fromJson(decodedJson[i]));
      }
      return apartments;
    } else {
      throw ServerException();
    }
  }
}
