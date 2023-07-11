part of 'order_cubit.dart';

class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderCustomizationValidation extends OrderState {}

class OrderLoaded extends OrderState {
  List<CartModel> products;
  OrderLoaded({List<CartModel>? products}) : products = products ?? [];
}

class OrderAdd extends OrderState {
  CartModel product;
  OrderAdd({required this.product});
}
