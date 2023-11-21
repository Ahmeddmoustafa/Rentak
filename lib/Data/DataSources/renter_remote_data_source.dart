import 'package:http/http.dart' as http;
import 'package:rentak/Core/Errors/exceptions.dart';
import 'package:rentak/Data/Models/renter_model.dart';
import 'package:rentak/Domain/Entities/Users/renter.dart';

abstract class RenterRemoteDataSource {
  Future<Renter> getRenter(String email, String password);
}

class RenterRemoteDataSourceImpl implements RenterRemoteDataSource {
  @override
  Future<Renter> getRenter(String email, String password) async {
    // print("$email recieved");
    final uri = Uri.parse("https://reqres.in/api/login");
    final response = await http.Client()
        .post(uri, body: {"email": email, "password": password});
    if (response.statusCode == 200) {
      const model = RenterModel(name: "name", id: "id", image: "image");
      // print(response.body);
      return model;
    } else {
      throw ServerException();
    }
  }
}
