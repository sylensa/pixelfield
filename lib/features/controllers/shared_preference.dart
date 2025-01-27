import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:pixelfield/features/models/list_products_model.dart';
import 'package:pixelfield/features/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

String FORCE_UPDATE = "shouldForceUpdate";

class UserPreferences {
  static late SharedPreferences _prefs;

  static set prefs(SharedPreferences prefs) => _prefs = prefs;

  static SharedPreferences get instance => _prefs;


  Future<bool> saveProducts(var products) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("products", jsonEncode(products));
    return true;
  }

  Future< List<ProductData>> getProducts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? products = prefs.getString("products");
    log("products:$products");
    List<ProductData> productData = [];
    if(products != null){
      List<dynamic> data = jsonDecode(products);
      productData.addAll(data.map((toElement) => ProductData.fromJson(toElement)).toList());
    }
    return productData;
  }

  Future<bool> setUser(var user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", jsonEncode(user));
    return true;
  }

  Future<UserModel?> getUser({bool? loading = false}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user = prefs.getString("user");
    log("user:$user");
    UserModel? userInfo;
    if(user != null){
      userInfo = UserModel.fromJson(jsonDecode(user));
    }
    return userInfo;
  }

  Future<bool> clearPrefs() async {
    var sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }

  logout() async {
    await clearPrefs();
    // Get.offAll(() => const CreateAccountPage());
  }
}
