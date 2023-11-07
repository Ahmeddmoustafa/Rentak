import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rentak/Core/Errors/exceptions.dart';
import 'package:rentak/Data/Models/apartment_model.dart';
import 'package:rentak/Domain/Entities/apartment.dart';

abstract class SearchRemoteDataSource {
  Future<List<Apartment>> getSearchResults();
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final http.Client client;

  SearchRemoteDataSourceImpl({required this.client});

  // we need to implement search results using firebase here

  @override
  Future<List<Apartment>> getSearchResults() async {
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

class FirebaseSearchRemoteDataSource implements SearchRemoteDataSource {
  @override
  Future<List<Apartment>> getSearchResults() {
    // TODO: implement getSearchResults
    throw UnimplementedError();
  }
}
