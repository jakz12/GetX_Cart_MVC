import 'dart:math';

import 'package:get/get.dart';
import 'package:getdemo/models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  get totalPrice => cartItems.length == 0?0: cartItems.map((element) => element.price+0).reduce((value, element) => value+element);

  addToCart(Product product) {
    cartItems.add(product);
  }
}
