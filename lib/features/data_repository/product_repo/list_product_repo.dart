import 'dart:convert';
import 'dart:developer';

import 'package:pixelfield/core/helper.dart';
import 'package:pixelfield/core/response_status.dart';
import 'package:pixelfield/features/controllers/shared_preference.dart';
import 'package:pixelfield/features/data_repository/product_repo/list_products_data.dart';
import 'package:pixelfield/features/models/list_products_model.dart';



class ListProductRepo {

  Future<List<ProductData>> getProducts() async {

    try{
        ListProductsModel listProductsModel = ListProductsModel.fromJson(listProductData);
        if(listProductsModel.status == AppResponseCodes.success && listProductsModel.data?.isNotEmpty == true){
          return listProductsModel.data ?? [];
        }
    }catch(e){
      log("error_codes:${e.toString()}");
    }
    return [];

  }


}
