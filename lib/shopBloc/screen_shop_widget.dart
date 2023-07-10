import 'package:flutter/material.dart';
import 'package:shopping_cart/model/UserMode.dart';
import 'package:shopping_cart/shopBloc/bloc.dart';
import 'package:shopping_cart/shopBloc/event.dart';

class ProductTileWidget extends StatelessWidget {
  final CartModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTileWidget(
      {super.key, required this.productDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        Container(
          color: Colors.grey,
          child: Center(
            child: Text(productDataModel.name),
          ),
        ),
      ],
    );
  }
}
