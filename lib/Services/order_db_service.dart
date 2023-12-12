import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_assignment_shubhangi/Models/order_details.dart';
import 'package:flutter_assignment_shubhangi/Models/product_details.dart';
import 'package:flutter_assignment_shubhangi/Services/auth_service.dart';

class OrderDbService {
  static final _authController = AuthService();
  static final orderCollection = FirebaseFirestore.instance.collection('order_collection');

  static String insertOrderStatus(String cartId, double totalPrice) {
    String docId = orderCollection.doc().id;
    orderCollection.doc(docId).set({
      'cartId': cartId,
      'userId': _authController.uid,
      'docId': docId,
      'status': 'confirmed',
      'totalPrice': totalPrice
    });
    return docId;
  }

  static insertOrderDetails(ProductDetails product, int productQuantity, String docId) {
    OrderDetails orderModel = OrderDetails(
        productId: product.productId,
        productName: product.productName,
        productQuantity: productQuantity,
        price: product.price,
        imagePath: product.imagePath,
        userId: _authController.uid);

    orderCollection
        .doc(docId)
        .collection('order_items')
        .doc(product.productId)
        .set(orderModel.toJsonForCreate());
  }
}
