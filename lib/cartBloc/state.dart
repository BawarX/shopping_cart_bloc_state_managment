import 'package:shopping_cart/model/UserMode.dart';

abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<CartModel> cartItems;
  CartSuccessState({
    required this.cartItems,
  });
}
