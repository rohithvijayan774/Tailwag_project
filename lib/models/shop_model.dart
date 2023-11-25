class ShopModel {
  String shopid;
  String shopName;
  String shopDetails;
  String? shopPhoto;
  String shopLocation;
  String shopServices;
  double? shopRating;
  String? shopImages;
  String? shopMedia;

  ShopModel({
    required this.shopid,
    required this.shopName,
    required this.shopDetails,
    this.shopPhoto,
    required this.shopLocation,
    required this.shopServices,
    this.shopRating,
    this.shopImages,
    this.shopMedia,
  });

  factory ShopModel.fromMap(Map<String, dynamic> map) {
    return ShopModel(
      shopid: map['shopid'],
      shopName: map['shopName'],
      shopPhoto: map['shopPhoto'],
      shopLocation: map['shopLocation'],
      shopServices: map['shopServices'],
      shopRating: map['shopRating'] ?? 0,
      shopDetails: map['shopDetails'],
      shopImages: map['shopImages'],
      shopMedia: map['shopMedia'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'shopid': shopid,
      'shopName': shopName,
      'shopPhoto': shopPhoto,
      'shopLocation': shopLocation,
      'shopServices': shopServices,
      'shopRating': shopRating,
      'shopDetails': shopDetails,
      'shopImages': shopImages,
      'shopMedia': shopMedia,
    };
  }
}
