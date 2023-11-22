
class UserModel {
  String registerid;
  String userName;
  String userEmail;
  String userNumber;
  String? petName;
  String? breedName;
  String? petSex;
  String? petAge;
  String? petWeight;
  String? aboutPet;
  String? petPic;

  UserModel({
    required this.registerid,
    required this.userName,
    required this.userEmail,
    required this.userNumber,
    this.petName,
    this.breedName,
    this.petSex,
    this.petAge,
    this.petWeight,
    this.aboutPet,
    this.petPic,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      registerid: map['register_id'] ?? '',
      userName: map['userName'] ?? '',
      userEmail: map['userEmail'] ?? '',
      userNumber: map['userNumber'] ?? '',
      petName: map['petName'],
      breedName: map['breedName'],
      petSex: map['petSex'],
      petAge: map['petAge'],
      petWeight: map['petWeight'],
      aboutPet: map['aboutPet'],
      petPic: map['petPic'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'register_id': registerid,
      'userName': userName,
      'userEmail': userEmail,
      'userNumber': userNumber,
      'petName': petName,
      'breedName': breedName,
      'petSex': petSex,
      'petAge': petAge,
      'petWeight': petWeight,
      'aboutPet': aboutPet,
      'petPic': petPic,
    };
  }
}
