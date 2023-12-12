class ProductDetails {
  String? productId;
  String? imagePath;
  String? productName;
  double? price;

  ProductDetails({this.productId, this.imagePath, this.productName, this.price});

  List<ProductDetails> getProductList() {
    List<ProductDetails> listOfProduct = [];
    ProductDetails productDetails1 = ProductDetails(
        productId: 'P1', imagePath: 'assets/product1.jpg', price: 50.0, productName: 'Product 1');
    listOfProduct.add(productDetails1);

    ProductDetails productDetails2 = ProductDetails(
        productId: 'P2', imagePath: 'assets/product2.jpg', price: 40.0, productName: 'Product 2');
    listOfProduct.add(productDetails2);

    ProductDetails productDetails3 = ProductDetails(
        productId: 'P3', imagePath: 'assets/product3.jpg', price: 60.0, productName: 'Product 3');
    listOfProduct.add(productDetails3);

    ProductDetails productDetails4 = ProductDetails(
        productId: 'P4', imagePath: 'assets/product4.jpg', price: 20.0, productName: 'Product 4');
    listOfProduct.add(productDetails4);

    ProductDetails productDetails5 = ProductDetails(
        productId: 'P5', imagePath: 'assets/product2.jpg', price: 40.0, productName: 'Product 5');
    listOfProduct.add(productDetails5);

    ProductDetails productDetails6 = ProductDetails(
        productId: 'P6', imagePath: 'assets/product3.jpg', price: 60.0, productName: 'Product 6');
    listOfProduct.add(productDetails6);

    ProductDetails productDetails7 = ProductDetails(
        productId: 'P7', imagePath: 'assets/product4.jpg', price: 20.0, productName: 'Product 7');
    listOfProduct.add(productDetails7);
    return listOfProduct;
  }
}
