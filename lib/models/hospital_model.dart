class HospitalModel {
  String hospitalid;
  String hospitalName;
  String? hospitalDetails;
  String hospitalPhoto;
  String hospitalLocation;
  double hospitalRating;
  String? hospitalImages;
  String? hospitalMedia;

  HospitalModel({
    required this.hospitalid,
    required this.hospitalName,
    this.hospitalDetails,
    required this.hospitalPhoto,
    required this.hospitalLocation,
    required this.hospitalRating,
    this.hospitalImages,
    this.hospitalMedia,
  });

  factory HospitalModel.fromMap(Map<String, dynamic> map) {
    return HospitalModel(
      hospitalid: map['hospitalid'],
      hospitalName: map['hospitalName'],
      hospitalPhoto: map['hospitalPhoto'],
      hospitalLocation: map['hospitalLocation'],
      hospitalRating: map['hospitalRating'],
      hospitalDetails: map['hospitalDetails'],
      hospitalImages: map['hospitalImages'],
      hospitalMedia: map['hospitalMedia'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hospitalid': hospitalid,
      'hospitalName': hospitalName,
      'hospitalPhoto': hospitalPhoto,
      'hospitalLocation': hospitalLocation,
      'hospitalRating': hospitalRating,
      'hospitalDetails': hospitalDetails,
      'hospitalImages': hospitalImages,
      'hospitalMedia': hospitalMedia,
    };
  }
}
