import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_assignment_shubhangi/Common_Widgets/alert_dialog.dart';
import 'package:flutter_assignment_shubhangi/Models/product_details.dart';
import 'package:flutter_assignment_shubhangi/Services/cart_db_service.dart';
import 'package:flutter_assignment_shubhangi/Services/order_db_service.dart';
import 'package:get/get.dart';

class ProductListController extends ChangeNotifier {
  List<ProductDetails> listOfProduct = [];
  String _totalPrice = '0';

  String get totalPrice => productsInCart.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toString();

  Map<dynamic, dynamic> productsInCart = {};
  String cartId = '';
  String orderId = '';
  void addToCart(ProductDetails product) async {
    if (productsInCart.containsKey(product)) {
      if (productsInCart[product] < 2) {
        productsInCart[product] += 1;
      } else {
        CustomAlertDialog.alertBox(
          'Limit Reached.',
          'You can add maximum 2 products in cart',
          () {
            Get.back();
          },
        );
      }
    } else {
      productsInCart[product] = 1;
    }
    if (productsInCart[product] == 1 && cartId.isEmpty) {
      cartId = await CartDbService.insertActiveCart();
    }
    CartDbService.insertOrUpdateCartDetails(product, productsInCart[product], cartId);

    notifyListeners();
  }

  void removeFromCart(ProductDetails product) async {
    if (productsInCart[product] == null) return;
    if (productsInCart.containsKey(product) && productsInCart[product] == 1) {
      CartDbService.removeCartDetails(product.productId!, 0, cartId);
      productsInCart.removeWhere((key, value) => key == product);
    } else {
      productsInCart[product] -= 1;
      CartDbService.removeCartDetails(product.productId!, productsInCart[product], cartId);
    }

    notifyListeners();
  }

  void createOrderDetails(String cartId) async {
    orderId = OrderDbService.insertOrderStatus(cartId, double.parse(totalPrice));

    productsInCart.forEach((product, quantity) {
      OrderDbService.insertOrderDetails(product, quantity, orderId);
    });
  }
}
