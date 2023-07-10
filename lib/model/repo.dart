import 'package:shopping_cart/model/UserMode.dart';

class Data {
  static List<CartModel> dummyData = [
    CartModel(
      id: 1,
      name: 'Product 1',
      price: '10.99',
      image: 'https://picsum.photos/640/640?r=6896',
      quantity: '2',
    ),
    CartModel(
      id: 2,
      name: 'Product 2',
      price: '19.99',
      image: 'https://picsum.photos/640/640?r=1219',
      quantity: '1',
    ),
    CartModel(
      id: 3,
      name: 'Product 3',
      price: '5.99',
      image: 'https://picsum.photos/640/640?r=818',
      quantity: '3',
    ),
    CartModel(
      id: 4,
      name: 'Product 4',
      price: '8.99',
      image: 'https://picsum.photos/640/640?r=818',
      quantity: '8',
    ),
  ];
}
