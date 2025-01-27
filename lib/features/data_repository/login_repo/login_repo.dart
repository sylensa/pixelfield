import 'dart:convert';
import 'dart:developer';

import 'package:pixelfield/core/response_status.dart';
import 'package:pixelfield/features/controllers/shared_preference.dart';
import 'package:pixelfield/features/data_repository/product_repo/list_products_data.dart';
import 'package:pixelfield/features/models/list_products_model.dart';
import 'package:pixelfield/features/models/user_model.dart';



class LoginRepo {

  Future<UserModel?> login(var userModel) async {
    try{
      await UserPreferences().setUser(userModel);
     final userData = await UserPreferences().getUser(loading: false);
      return userData;
    }catch(e){
      log("error_codes:${e.toString()}");
    }
    return null;

  }
}
