import 'package:equatable/equatable.dart';
import 'package:shopping_cart/model/UserMode.dart';

abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final CartModel clickedProduct;
  HomeProductCartButtonClickedEvent({
    required this.clickedProduct,
  });
}

class HomeCartButtonNavigateEvent extends HomeEvent {}

// class ProudctQuantityIncrementEvent extends HomeEvent {
//   final String quantityToAdd;
//   ProudctQuantityIncrementEvent({required this.quantityToAdd});
//   @override
//   List<Object?> get props => [quantityToAdd];
// }
//--------------------------------------------------------

class CounterEvent extends HomeEvent {}

class IncrementEventButton extends CounterEvent {}

class DecrementEventButton extends CounterEvent {}
