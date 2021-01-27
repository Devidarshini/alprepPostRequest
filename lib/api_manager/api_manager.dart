import 'dart:convert';

import 'package:alprep/models/login_model.dart';
import 'package:alprep/models/register_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  var client = http.Client();
  Future<Login> login(String email, String password) async {
    String url = "https://testapi.alprepedu.com/v1/user/login";
    var body = jsonEncode({'emailId': email, 'password': password});
    final responce = await client.post(url,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": "token"
        },
        body: body);
    if (responce.statusCode == 200 || responce.statusCode == 400) {
      var result = Login.fromMap(json.decode(responce.body));
      print('result from api:');
      print(result);
      return result;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Registration> Register(String email, String password, String firstName,
      String lastName, String mobileNo, String reffrealcode) async {
    try {
      String url = "https://testapi.alprepedu.com/v1/user/create";
      var body = jsonEncode({
        'emailId': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
        'mobileNo': mobileNo,
        'referralCode': reffrealcode
      });
      final responce = await client.post(url,
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          },
          body: body);

      if (responce.statusCode == 200 || responce.statusCode == 400) {
        var result = Registration.fromMap(json.decode(responce.body));
        print('result from api:');
        print(result);
        return result;
      } else {
        print(responce.statusCode.toString());
        throw Exception(
            'Failed load data with status code ${responce.statusCode}');
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
