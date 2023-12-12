import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_assignment_shubhangi/Models/cart_items.dart';
import 'package:flutter_assignment_shubhangi/Models/product_details.dart';
import 'package:flutter_assignment_shubhangi/Services/auth_service.dart';

class CartDbService {
  static final _authController = AuthService();
  static final cartCollection = FirebaseFirestore.instance.collection('cart_collection');

  static Future<String> insertActiveCart() async {
    String docId = cartCollection.doc().id;
    await cartCollection.doc(docId).set({
      'docId': docId,
      'userId': _authController.uid,
    });
    return docId;
  }

  static void insertOrUpdateCartDetails(ProductDetails product, int productQuantity, String docId) {
    CartItems cartModel = CartItems(
        productId: product.productId,
        productName: product.productName,
        productQuantity: productQuantity,
        price: product.price,
        imagePath: product.imagePath,
        userId: _authController.uid);

    cartCollection
        .doc(docId)
        .collection('cart_items')
        .doc(product.productId)
        .set(cartModel.toJsonForCreate());
  }

  static void removeCartDetails(String productId, int productQuantity, String docId) {
    cartCollection
        .doc(docId)
        .collection('cart_items')
        .doc(productId)
        .update({CartItemsFN.productQuantity: productQuantity});
  }

  static void updateStatus(String docId) {
    cartCollection.doc(docId).update({'isActive': false});
  }
}
