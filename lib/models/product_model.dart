class ProductModel {
  String productid;
  String productName;
  String productDetails;
  String? productPhoto;
  double? productRating;
  String shopID;

  ProductModel({
    required this.productid,
    required this.productName,
    required this.productDetails,
    this.productPhoto,
    this.productRating,
    required this.shopID,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productid: map['productid'],
      productName: map['productName'],
      productPhoto: map['productPhoto'],
      productRating: map['productRating'] ?? 0,
      productDetails: map['productDetails'],
      shopID: map['shopID'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productid': productid,
      'productName': productName,
      'productPhoto': productPhoto,
      'productRating': productRating,
      'productDetails': productDetails,
      'shopID': shopID,
    };
  }
}
