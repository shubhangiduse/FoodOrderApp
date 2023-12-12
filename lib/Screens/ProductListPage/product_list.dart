
import 'package:flutter/material.dart';
import 'package:flutter_assignment_shubhangi/Common_Widgets/alert_dialog.dart';
import 'package:flutter_assignment_shubhangi/Common_Widgets/elevated_button.dart';
import 'package:flutter_assignment_shubhangi/Models/product_details.dart';
import 'package:flutter_assignment_shubhangi/Screens/OrderDetailsPage/orderdetails_page.dart';
import 'package:flutter_assignment_shubhangi/Screens/ProductListPage/productlist_controller.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final productDetails = ProductDetails();
  ProductListController productController = ProductListController();
  TextStyle customStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  @override
  void initState() {
    productController.listOfProduct = productDetails.getProductList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartValue = Provider.of<ProductListController>(context, listen: false);
    return Scaffold(
      appBar: _appBar(),
      body: _body(cartValue),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('Product List Page'),
    );
  }

  Column _body(cartValue) {
    return Column(
      children: [
        Flexible(
          child: ListView.builder(
              itemCount: productController.listOfProduct.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductCard(context: context, index: index, controller: productController);
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              buildTotalPrice(),
              const SizedBox(
                height: 20,
              ),
              buildPlaceOrderButton()
            ],
          ),
        )
      ],
    );
  }

  Row buildTotalPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Total : ',
          style: customStyle,
        ),
        Provider.of<ProductListController>(context).productsInCart.isNotEmpty
            ? Text('RS: ${Provider.of<ProductListController>(context).totalPrice}', style: customStyle)
            : Text('RS: 0', style: customStyle)
      ],
    );
  }

  RoundedElevatedButton buildPlaceOrderButton() {
    return RoundedElevatedButton(
        title: 'Place Order',
        onPressed: () {
          if (Provider.of<ProductListController>(context, listen: false).productsInCart.isNotEmpty) {
            CustomAlertDialog.alertBox(
              'Order Placed.',
              'You order has been placed.',
              () {
                Provider.of<ProductListController>(context, listen: false)
                    .createOrderDetails(Provider.of<ProductListController>(context, listen: false).cartId);
                Get.back();
                Provider.of<ProductListController>(context, listen: false).productsInCart = {};
                setState(() {});
                Get.to(OrderDetailsPage(
                    orderId: Provider.of<ProductListController>(context, listen: false).orderId));
              },
            );
          } else {
            CustomAlertDialog.alertBox('Cart empty', 'Add minimum 1 item in cart to place the order.', () {
              Get.back();
            });
          }
        });
  }
}

class ProductCard extends StatelessWidget {
  final BuildContext context;
  final int index;
  final ProductListController controller;
  const ProductCard({required this.context, required this.index, required this.controller, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(controller.listOfProduct[index].imagePath!),
        title: Text(controller.listOfProduct[index].productName.toString()),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('RS: ${controller.listOfProduct[index].price.toString()}'),
                Container(
                  color: Colors.blue,
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Provider.of<ProductListController>(context, listen: false)
                                .removeFromCart(controller.listOfProduct[index]);
                          },
                          child: const Icon(Icons.remove)),
                      Provider.of<ProductListController>(context)
                                  .productsInCart[controller.listOfProduct[index]]
                                  .toString() ==
                              'null'
                          ? const Text('0')
                          : Text(Provider.of<ProductListController>(context)
                              .productsInCart[controller.listOfProduct[index]]
                              .toString()),
                      InkWell(
                          onTap: () {
                            Provider.of<ProductListController>(context, listen: false)
                                .addToCart(controller.listOfProduct[index]);
                          },
                          child: const Icon(Icons.add)),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
