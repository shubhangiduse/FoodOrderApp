import 'package:flutter_assignment_shubhangi/Utilities/json_helper.dart';

class CartItems {
  CartItems({
    this.productId,
    this.productQuantity,
    this.productName,
    this.userId,
    this.price,
    this.imagePath,
  });

  String? productId;
  String? productName;
  int? productQuantity;
  double? price;
  String? userId;
  String? imagePath;

  CartItems.fromJson(Map<String, Object?> json)
      : this(
          productId: JsonHelper.parseStringCz(json, CartItemsFN.productId),
          productQuantity: JsonHelper.parseInt(json, CartItemsFN.productQuantity),
          productName: JsonHelper.parseStringCz(json, CartItemsFN.productName),
          userId: JsonHelper.parseStringCz(json, CartItemsFN.userId),
          price: JsonHelper.parseDouble(json, CartItemsFN.price),
          imagePath: JsonHelper.parseStringCz(json, CartItemsFN.imagePath),
        );

  Map<String, Object?> toJsonForCreate() {
    return _toJson();
  }

  Map<String, Object?> _toJson() {
    return {
      CartItemsFN.productId: productId,
      CartItemsFN.price: price,
      CartItemsFN.productQuantity: productQuantity,
      CartItemsFN.userId: userId,
      CartItemsFN.productName: productName,
      CartItemsFN.imagePath: imagePath,
    };
  }
}

class CartItemsFN {
  static String productId = 'productId';
  static String productQuantity = 'productQuantity';
  static String productName = 'productName';
  static String price = 'price';
  static String userId = 'userId';
  static String imagePath = 'imagePath';
}
