import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffee_shop/model/cart_model.dart';
import 'package:coffee_shop/model/product_model.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderState());

  void initOrder() {
    emit(OrderLoaded(products: null));
  }

  void addOrder(ProductModel data, List<Map<String, String>> config) {
    var curState = state as OrderLoaded;
    emit(OrderLoading());
    if (data.productCustomization.length != config.length) {
      emit(OrderCustomizationValidation());
      emit(curState);
      return;
    }
    curState.products.add(CartModel(product: data, config: config));
    emit(curState);
  }

  void removeOrder(int index) {
    var curState = state as OrderLoaded;
    emit(OrderLoading());
    curState.products.removeAt(index);
    emit(curState);
  }

  void updateOrder(index, config) {
    var curState = state as OrderLoaded;
    emit(OrderLoading());
    curState.products[index] =
        CartModel(product: curState.products[index].product, config: config);
    emit(curState);
  }
}
