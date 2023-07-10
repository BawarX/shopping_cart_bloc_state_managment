import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/cartBloc/cart_screen.dart';
import 'package:shopping_cart/model/UserMode.dart';
import 'package:shopping_cart/shopBloc/bloc.dart';
import 'package:shopping_cart/shopBloc/event.dart';
import 'package:shopping_cart/shopBloc/screen_shop_widget.dart';
import 'package:shopping_cart/shopBloc/state.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Item Carted')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text('Show Market'),
                actions: [
                  IconButton(
                      onPressed: () {
                        // homeBloc.add(HomeWishlistButtonNavigateEvent());
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigateEvent());
                      },
                      icon: Icon(Icons.shopping_bag_outlined)),
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    CartModel productDataModel;
                    int count = state.products.length;
                    return Card(
                      color: Colors.greenAccent,
                      child: ListTile(
                        leading:
                            Image.network(successState.products[index].image),
                        title: Text(successState.products[index].name),
                        subtitle: Column(
                          children: [
                            Text(successState.products[index].price),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.remove),
                                ),
                                Text('${count}'),
                                IconButton(
                                  onPressed: () {
                                    homeBloc.add(IncrementEventButton());
                                  },
                                  icon: Icon(Icons.add),
                                ),
                              ],
                            )
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            homeBloc.add(
                              HomeProductCartButtonClickedEvent(
                                  clickedProduct: successState.products[index]),
                            );
                          },
                          icon: Icon(Icons.shopping_bag_outlined),
                        ),
                      ),
                    );
                  }),
            );

          case HomeErrorState:
            return Scaffold(body: Center(child: Text('Error')));
          default:
            return SizedBox();
        }
      },
    );
  }
}
