import 'package:coffee_shop/model/product_model.dart';

class CartModel {
  ProductModel product;
  List<Map<String, String>> config;

  CartModel({required this.product, List<Map<String, String>>? config})
      : config = config ?? [];
}
