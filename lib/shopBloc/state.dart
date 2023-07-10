import 'package:equatable/equatable.dart';
import 'package:shopping_cart/model/UserMode.dart';
import 'package:shopping_cart/shopBloc/event.dart';

abstract class HomeState extends Equatable {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadedSuccessState extends HomeState {
  final List<CartModel> products;
  HomeLoadedSuccessState({required this.products});
  @override
  // TODO: implement props
  List<Object?> get props => [products];

  HomeLoadedSuccessState copyWith({List<CartModel>? products}) {
    return HomeLoadedSuccessState(products: products ?? this.products);
  }
}

class HomeErrorState extends HomeState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class HomeNavigateToCartPageActionState extends HomeActionState {
  @override
  List<Object?> get props => [];
}

class HomeProductItemCartedActionState extends HomeActionState {
  @override
  List<Object?> get props => [];
}

class ProudctQuantityIncrementState extends HomeActionState {
  @override
  List<Object?> get props => [];
}
