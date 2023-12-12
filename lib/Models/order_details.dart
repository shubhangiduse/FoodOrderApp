import 'package:flutter_assignment_shubhangi/Utilities/json_helper.dart';

class OrderDetails {
  OrderDetails({
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

  OrderDetails.fromJson(Map<String, Object?> json)
      : this(
          productId: JsonHelper.parseStringCz(json, OrderDetailsFN.productId),
          productQuantity: JsonHelper.parseInt(json, OrderDetailsFN.productQuantity),
          productName: JsonHelper.parseStringCz(json, OrderDetailsFN.productName),
          userId: JsonHelper.parseStringCz(json, OrderDetailsFN.userId),
          price: JsonHelper.parseDouble(json, OrderDetailsFN.price),
          imagePath: JsonHelper.parseStringCz(json, OrderDetailsFN.imagePath),
        );

  Map<String, Object?> toJsonForCreate() {
    return _toJson();
  }

  Map<String, Object?> _toJson() {
    return {
      OrderDetailsFN.productId: productId,
      OrderDetailsFN.price: price,
      OrderDetailsFN.productQuantity: productQuantity,
      OrderDetailsFN.userId: userId,
      OrderDetailsFN.productName: productName,
      OrderDetailsFN.imagePath: imagePath,
    };
  }
}

class OrderDetailsFN {
  static String productId = 'productId';
  static String productQuantity = 'productQuantity';
  static String productName = 'productName';
  static String price = 'price';
  static String userId = 'userId';
  static String imagePath = 'imagePath';
}
