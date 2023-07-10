import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/CartBloc/event.dart';
import 'package:shopping_cart/CartBloc/state.dart';
import 'package:shopping_cart/model/cartItem.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productDataModel);
// emit()
    emit(CartSuccessState(cartItems: cartItems));
  }
}
