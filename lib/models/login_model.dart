// To parse this JSON data, do
//
//     final login = loginFromMap(jsonString);

import 'dart:convert';

Login loginFromMap(String str) => Login.fromMap(json.decode(str));

String loginToMap(Login data) => json.encode(data.toMap());

class Login {
  Login({
    this.emailId,
    this.password,
  });

  String emailId;
  String password;

  factory Login.fromMap(Map<String, dynamic> json) => Login(
        emailId: json["emailId"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "emailId": emailId,
        "password": password,
      };
}

class LoginResponseModel {
  final String token;
  final String error;
  LoginResponseModel({this.error, this.token});
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
        token: json['token'] != null ? json['token'] : "",
        error: json["error"] != null ? json["error"] : "");
  }
}
