import 'package:shopping_cart/model/UserMode.dart';

abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveFromCartEvent extends CartEvent {
  final CartModel productDataModel;
  CartRemoveFromCartEvent({
    required this.productDataModel,
  });
}
