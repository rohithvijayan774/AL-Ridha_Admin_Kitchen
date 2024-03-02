class ProductsModel {
  String productID;
  String productTitle;
  String productImage;
  String productDescription;
  int productPrice;
  int productOffer;

  ProductsModel({
    required this.productID,
    required this.productTitle,
    required this.productDescription,
    required this.productImage,
    required this.productPrice,
    required this.productOffer,
  });

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
        productID: map['productID'],
        productTitle: map['productTitle'],
        productDescription: map['productDescription'],
        productImage: map['productImage'],
        productPrice: map['productPrice'],
        productOffer: map['productOffer']);
  }

  Map<String, dynamic> toMap() {
    return {
      'productID': productID,
      'productTitle': productTitle,
      'productDescription': productDescription,
      'productImage': productImage,
      'productPrice': productPrice,
      'productOffer': productOffer,
    };
  }
}
