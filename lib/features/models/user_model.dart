// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';
import 'dart:math';

UserDataModel userModelFromJson(String? str) => UserDataModel.fromJson(json.decode(str!));

String? userModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  UserDataModel({
    this.status,
    this.data,
    this.message,
  });

  bool? status;
  UserModel? data;
  String? message;

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    status: json["status"],
    data: json["data"] == null ? null : UserModel.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class UserModel {
  UserModel({
    this.email,
    this.password,
  });

  String? email;
  String? password;


  factory UserModel.fromJson(Map<String, dynamic> json,{bool removeNotificationPreference = false}) => UserModel(
    email: json["email"],
    password: json["password"] ?? "",

  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}


