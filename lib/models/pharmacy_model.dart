class PharmacyModel {
  String pharmacyid;
  String pharmacyName;
  String pharmacyDetails;
  String? pharmacyPhoto;
  String pharmacyLocation;
  String pharmacyMedicines;
  double? pharmacyRating;
  String? pharmacyImages;
  String? pharmacyMedia;

  PharmacyModel({
    required this.pharmacyid,
    required this.pharmacyName,
    required this.pharmacyDetails,
    this.pharmacyPhoto,
    required this.pharmacyLocation,
    required this.pharmacyMedicines,
    this.pharmacyRating,
    this.pharmacyImages,
    this.pharmacyMedia,
  });

  factory PharmacyModel.fromMap(Map<String, dynamic> map) {
    return PharmacyModel(
      pharmacyid: map['pharmacyid'],
      pharmacyName: map['pharmacyName'],
      pharmacyPhoto: map['pharmacyPhoto'],
      pharmacyLocation: map['pharmacyLocation'],
      pharmacyMedicines: map['pharmacyMedicines'],
      pharmacyRating: map['pharmacyRating'] ?? 0,
      pharmacyDetails: map['pharmacyDetails'],
      pharmacyImages: map['pharmacyImages'],
      pharmacyMedia: map['pharmacyMedia'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pharmacyid': pharmacyid,
      'pharmacyName': pharmacyName,
      'pharmacyPhoto': pharmacyPhoto,
      'pharmacyLocation': pharmacyLocation,
      'pharmacyMedicines': pharmacyMedicines,
      'pharmacyRating': pharmacyRating,
      'pharmacyDetails': pharmacyDetails,
      'pharmacyImages': pharmacyImages,
      'pharmacyMedia': pharmacyMedia,
    };
  }
}
