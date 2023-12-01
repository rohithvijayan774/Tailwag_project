class SitterModel {
  String sitterRegisterid;
  String sitterName;
  String sitterPlace;
  String sitterNumber;
  String sitterEmail;
  String sitterTitle;
  String sitterDetails;
  String? sitterProPic;
  String? sitterCoverPic;
  double? sitterRating;

  SitterModel({
    required this.sitterRegisterid,
    required this.sitterName,
    required this.sitterPlace,
    required this.sitterNumber,
    required this.sitterEmail,
    required this.sitterTitle,
    required this.sitterDetails,
    this.sitterProPic,
    this.sitterCoverPic,
    this.sitterRating,
  });

  factory SitterModel.fromMap(Map<String, dynamic> map) {
    return SitterModel(
      sitterRegisterid: map['sitterRegisterid'],
      sitterName: map['sitterName'],
      sitterPlace: map['sitterPlace'],
      sitterNumber: map['sitterNumber'],
      sitterEmail: map['sitterEmail'],
      sitterTitle: map['sitterTitle'],
      sitterDetails: map['sitterDetails'],
      sitterProPic: map['sitterProPic'],
      sitterCoverPic: map['sitterCoverPic'],
      sitterRating: map['sitterRating'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sitterRegisterid': sitterRegisterid,
      'sitterName': sitterName,
      'sitterPlace': sitterPlace,
      'sitterNumber': sitterNumber,
      'sitterEmail': sitterEmail,
      'sitterTitle': sitterTitle,
      'sitterDetails': sitterDetails,
      'sitterProPic': sitterProPic,
      'sitterCoverPic': sitterCoverPic,
      'sitterRating':sitterRating,
    };
  }
}
