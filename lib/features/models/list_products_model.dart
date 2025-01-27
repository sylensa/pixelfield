// To parse this JSON data, do
//
//     final listProductsModel = listProductsModelFromJson(jsonString);

import 'dart:convert';

ListProductsModel listProductsModelFromJson(String str) => ListProductsModel.fromJson(json.decode(str));

String listProductsModelToJson(ListProductsModel data) => json.encode(data.toJson());

class ListProductsModel {
  String? status;
  List<ProductData>? data;
  String? message;

  ListProductsModel({
    this.status,
    this.data,
    this.message,
  });

  factory ListProductsModel.fromJson(Map<String, dynamic> json) => ListProductsModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<ProductData>.from(json["data"]!.map((x) => ProductData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };


  Map<String, dynamic> toMap() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ProductData {
  String? subTitle;
  String? title;
  String? stock;
  String? quantity;
  String? age;

  ProductData({
    this.subTitle,
    this.title,
    this.stock,
    this.quantity,
    this.age,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
    subTitle: json["subTitle"],
    title: json["title"],
    stock: json["stock"],
    age: json["age"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "subTitle": subTitle,
    "title": title,
    "stock": stock,
    "quantity": quantity,
  };
}
