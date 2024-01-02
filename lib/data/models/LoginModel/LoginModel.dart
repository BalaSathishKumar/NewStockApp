// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class  LoginResponseModel {
  bool status;
  String message;
  Data data;

  LoginResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  String otp;
  String authCode;
  String userType;

  Data({
    required this.otp,
    required this.authCode,
    required this.userType,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    otp: json["otp"],
    authCode: json["auth_code"],
    userType: json["user_type"],
  );

  Map<String, dynamic> toJson() => {
    "otp": otp,
    "auth_code": authCode,
    "user_type": userType,
  };
}
