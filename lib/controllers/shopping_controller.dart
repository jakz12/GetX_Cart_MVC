
import 'package:get/get.dart';
import 'package:getdemo/models/product.dart';

class ShoppingController extends GetxController{
  var products = <Product>[].obs;

  @override
  void onInit(){
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    products.value = [
      Product(
        id: 1,
        price: 100.50,
        productDescription: 'Eraser pencil',
        productImage: 'image',
        productName: 'Pencil'
      ),
      Product(
        id: 2,
        price: 200.50,
        productDescription: 'storage box',
        productImage: 'image',
        productName: 'compass'
      ),
      Product(
        id: 1,
        price: 10.50,
        productDescription: 'Eraser with different color',
        productImage: 'image',
        productName: 'Eraser'
      ),
    ];
  }

}