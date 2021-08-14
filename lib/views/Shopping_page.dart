import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getdemo/controllers/cart_controller.dart';
import 'package:getdemo/controllers/shopping_controller.dart';

// ignore: must_be_immutable
class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
    backgroundColor: Colors.teal,
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(
              builder: (controller) {
                return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Card(margin: const EdgeInsets.all(12),
                      child: Padding(padding: const EdgeInsets.all(16.0),child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text('${controller.products[index].productName}',style: TextStyle(fontSize: 24)),
                                 Text('${controller.products[index].productDescription}',style: TextStyle(fontSize: 18,color: Colors.grey))

                               ],
                             ),
                                 Text('\$${controller.products[index].price}',style: TextStyle(fontSize: 24))

                            ],
                          ),
                          MaterialButton(onPressed: (){
                            cartController.addToCart(controller.products[index]);
                          },
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: Text('Add to Cart'),)
                        ],
                      ),));
                    });
              }
            ),
          ),
          GetX<CartController>(
            builder: (controller) {
              return Text('Total Amount: ${cartController.totalPrice}');
            }
          ),
          SizedBox(height: 100)
        ],
      ),
    ));
  }
}
