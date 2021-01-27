// To parse this JSON data, do
//
//     final registration = registrationFromMap(jsonString);

import 'dart:convert';

Registration registrationFromMap(String str) =>
    Registration.fromMap(json.decode(str));

String registrationToMap(Registration data) => json.encode(data.toMap());

class Registration {
  Registration({
    this.emailId,
    this.firstName,
    this.lastName,
    this.mobileNo,
    this.password,
    this.referralCode,
  });

  String emailId;
  String firstName;
  String lastName;
  String mobileNo;
  String password;
  String referralCode;

  factory Registration.fromMap(Map<String, dynamic> json) => Registration(
        emailId: json["emailId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        mobileNo: json["mobileNo"],
        password: json["password"],
        referralCode: json["referralCode"],
      );

  Map<String, dynamic> toMap() => {
        "emailId": emailId,
        "firstName": firstName,
        "lastName": lastName,
        "mobileNo": mobileNo,
        "password": password,
        "referralCode": referralCode,
      };
}
