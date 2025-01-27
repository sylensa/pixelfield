
 import 'package:pixelfield/features/models/list_products_model.dart';

class ListProductState  {}

class ListProductInitial extends ListProductState {}

class ListProductLoading extends ListProductState {}

class ListProductLoaded extends ListProductState {
  final List<ProductData> listProducts;
   ListProductLoaded({required this.listProducts,});
 
}

class ListProductError extends ListProductState {
  final String message;
   ListProductError({required this.message,});

}
