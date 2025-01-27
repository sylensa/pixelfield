import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield/core/helper.dart';
import 'package:pixelfield/features/controllers/product_controller/list_product_state.dart';
import 'package:pixelfield/features/controllers/shared_preference.dart';
import 'package:pixelfield/features/data_repository/product_repo/list_product_repo.dart';
import 'package:pixelfield/features/models/list_products_model.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class ListProductControllerCubit extends Cubit<ListProductState> {
  ListProductRepo _listProductRepo;
  ListProductControllerCubit(this._listProductRepo) : super(ListProductInitial());
  Timer? _debounce;
  List<ProductData> products = [];
  TextEditingController searchController = TextEditingController();
   getProductCubit({bool? initial = true}) async {
   if(initial == true){
     products.clear();
     emit(ListProductLoading());
   }
    try {
      if(await checkIfUserIsOnline()){
        List<ProductData> productData = await _listProductRepo.getProducts();
        products.addAll(productData);
        await UserPreferences().saveProducts(ListProductsModel(data: products).toMap()["data"]);
      }else{
        products.clear();
        products = await UserPreferences().getProducts();
      }
      if(products.isNotEmpty){
        emit(ListProductLoaded(listProducts: products));
      }else{
        emit( ListProductError(
          message: "No data available",
        ));
      }
    } catch (e) {
      emit( ListProductError(
        message: e.toString(),
      ));
    }
  }

  void onRefresh(RefreshController refreshController) async{
     await getProductCubit();
    refreshController.refreshCompleted();
  }
  void onLoading(RefreshController refreshController) async{
    await getProductCubit(initial: false);
    refreshController.loadComplete();
  }

  onSearchChanged(String value){
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(seconds: 0), ()async{
      if(value.isNotEmpty){
        products = products.where((test) => test.title!.toLowerCase().contains(value.toLowerCase())
        || test.subTitle!.toLowerCase().contains(value.toLowerCase()) ||
            test.quantity!.toLowerCase().contains(value.toLowerCase()) ||
            test.stock!.toLowerCase().contains(value.toLowerCase())).toList();

        if(products.isNotEmpty){
          emit(ListProductLoaded(listProducts: products));
        }else{
          emit( ListProductError(
            message: "No data available",
          ));
        }

      }else{
        getProductCubit();
      }
    });

  }
}