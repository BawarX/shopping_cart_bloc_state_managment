import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/model/UserMode.dart';
import 'package:shopping_cart/model/cartItem.dart';
import 'package:shopping_cart/model/repo.dart';
import 'package:shopping_cart/shopBloc/event.dart';
import 'package:shopping_cart/shopBloc/state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<IncrementEventButton>(incrementEventButton);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: Data.dummyData
            .map((e) => CartModel(
                id: e.id,
                name: e.name,
                price: e.price,
                image: e.image,
                quantity: e.quantity))
            .toList()));
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Cart Product clicked');
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Cart Navigate clicked');
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> incrementEventButton(
      IncrementEventButton event, Emitter<HomeState> emit) {}
}
