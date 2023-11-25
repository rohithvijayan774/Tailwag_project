import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tailwag/models/hospital_model.dart';
import 'package:tailwag/models/pharmacy_model.dart';
import 'package:tailwag/models/shop_model.dart';

class AdminController extends ChangeNotifier {
  final adminID = 'tailwag@gmail.com';
  final adminPassword = 'tailwag123';

  TextEditingController adminUsernameController = TextEditingController();
  TextEditingController adminPasswordController = TextEditingController();

  final adminLoginFormKey = GlobalKey<FormState>();

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  //____________________ADMIN LOGIN_____________________________________________
  bool _adminSignIn = false;
  bool get adminSignIn => _adminSignIn;

  void checkAdminSignedIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _adminSignIn = sharedPreferences.getBool('admin_signin') ?? false;
    notifyListeners();
  }

  Future setAdminSignIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool('admin_signin', true);
    _adminSignIn = true;
    print('Set Admin Signed in $_adminSignIn');
    print('Set Admin Signed in $adminSignIn');
    notifyListeners();
    return _adminSignIn;
  }

  Future setAdminSignOut() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool('admin_signin', false);
    _adminSignIn = false;

    notifyListeners();
  }

  //______________________HOSPITAL CONTROL______________________________________

  TextEditingController hospitalNameController = TextEditingController();
  TextEditingController hospitalDetailsController = TextEditingController();
  TextEditingController hospitalPhotoController = TextEditingController();
  TextEditingController hospitalLocationController = TextEditingController();
  TextEditingController hospitalRatingController = TextEditingController();

  final hospitalAddKey = GlobalKey<FormState>();

  HospitalModel? _hospitalModel;
  HospitalModel get hospitalModel => _hospitalModel!;

  Future<void> saveHospital(
    String hospitalName,
    String hospitalLocation,
    String hospitalDetails,
  ) async {
    try {
      _hospitalModel = HospitalModel(
        hospitalid: hospitalName,
        hospitalName: hospitalName,
        hospitalLocation: hospitalLocation,
        hospitalDetails: hospitalDetails,
      );

      await firebaseFirestore
          .collection('hospitals')
          .doc(hospitalName)
          .set(_hospitalModel!.toMap());
      print('**********Hospital Stored*******');
    } catch (e) {
      print("Hospital storing failed : $e");
    }

    notifyListeners();
  }

  List<HospitalModel> hospitalsList = [];
  HospitalModel? hospitals;

  Future<void> fetchHospitals() async {
    try {
      hospitalsList.clear();

      CollectionReference hospitalsRef =
          firebaseFirestore.collection('hospitals');
      QuerySnapshot hospitalSnapshot = await hospitalsRef.get();

      for (var doc in hospitalSnapshot.docs) {
        String hospitalid = doc['hospitalid'];
        String hospitalName = doc['hospitalName'];
        String hospitalPhoto = doc['hospitalPhoto'];
        String hospitalLocation = doc['hospitalLocation'];
        double hospitalRating = doc['hospitalRating'] ?? 0;
        String hospitalDetails = doc['hospitalDetails'] ?? '';
        String hospitalImages = doc['hospitalImages'] ?? '';
        String hospitalMedia = doc['hospitalMedia'] ?? '';

        hospitals = HospitalModel(
          hospitalid: hospitalid,
          hospitalName: hospitalName,
          hospitalPhoto: hospitalPhoto,
          hospitalLocation: hospitalLocation,
          hospitalRating: hospitalRating,
          hospitalDetails: hospitalDetails,
          hospitalImages: hospitalImages,
          hospitalMedia: hospitalMedia,
        );
        hospitalsList.add(hospitals!);
        // print('HospitalPhoto : $photoURL');
      }
      print('*********HOSPITAL FETCH COMPLETE');
    } catch (e) {
      print(e);
    }
  }

  Future<String> storeImagetoStorge(String ref, File file) async {
    SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
    UploadTask uploadTask =
        firebaseStorage.ref().child(ref).putFile(file, metadata);
    TaskSnapshot snapshot = await uploadTask;
    String downloadURL = await snapshot.ref.getDownloadURL();
    log(downloadURL);
    notifyListeners();
    return downloadURL;
  }

  File? hospitalPic;

  Future<File> pickHospitalPhoto(context) async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        hospitalPic = File(pickedImage.path);
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
    return hospitalPic!;
  }

  Future<void> selecthospitalPic(context) async {
    hospitalPic = await pickHospitalPhoto(context);
    notifyListeners();
  }

  uploadHospitalPhoto(File hospitalPhoto, String hospitalName) async {
    await storeImagetoStorge(
            'Hospital Docs/$hospitalName/Profile pic', hospitalPhoto)
        .then((value) async {
      hospitalModel.hospitalPhoto = value;

      DocumentReference docRef =
          firebaseFirestore.collection('hospitals').doc(hospitalName);
      docRef.update({'hospitalPhoto': value});
    });
    _hospitalModel = hospitalModel;
    print('Pic uploaded successfully');
    notifyListeners();
  }

  clearFields() {
    hospitalNameController.clear();
    hospitalDetailsController.clear();
    hospitalPhotoController.clear();
    hospitalLocationController.clear();
    hospitalRatingController.clear();

    notifyListeners();
  }

  //______________________SHOP CONTROL______________________________________

  TextEditingController shopNameController = TextEditingController();
  TextEditingController shopDetailsController = TextEditingController();
  TextEditingController shopLocationController = TextEditingController();
  TextEditingController shopServiceController = TextEditingController();

  final shopAddKey = GlobalKey<FormState>();

  ShopModel? _shopModel;
  ShopModel get shopModel => _shopModel!;

  Future<void> saveShop(
    String shopName,
    String shopLocation,
    String shopDetails,
    String shopServices,
  ) async {
    try {
      _shopModel = ShopModel(
          shopid: shopName,
          shopName: shopName,
          shopDetails: shopDetails,
          shopLocation: shopLocation,
          shopServices: shopServices);
      await firebaseFirestore
          .collection('shops')
          .doc(shopName)
          .set(_shopModel!.toMap());
      print('**********Shop Stored*******');
    } catch (e) {
      print("Hospital storing failed : $e");
    }

    notifyListeners();
  }

  List<ShopModel> shopsList = [];
  ShopModel? shops;

  Future<void> fetchShops() async {
    try {
      shopsList.clear();

      CollectionReference shopsRef = firebaseFirestore.collection('shops');
      QuerySnapshot shopsSnapshot = await shopsRef.get();

      for (var doc in shopsSnapshot.docs) {
        String shopid = doc['shopid'];
        String shopName = doc['shopName'];
        String shopPhoto = doc['shopPhoto'];
        String shopLocation = doc['shopLocation'];
        String shopServices = doc['shopServices'];
        double shopRating = doc['shopRating'] ?? 0;
        String shopDetails = doc['shopDetails'] ?? '';
        String shopImages = doc['shopImages'] ?? '';
        String shopMedia = doc['shopMedia'] ?? '';

        shops = ShopModel(
          shopid: shopid,
          shopName: shopName,
          shopDetails: shopDetails,
          shopLocation: shopLocation,
          shopServices: shopServices,
          shopPhoto: shopPhoto,
          shopRating: shopRating,
          shopImages: shopImages,
          shopMedia: shopMedia,
        );
        shopsList.add(shops!);
      }
      print('*********SHOPS FETCH COMPLETE');
    } catch (e) {
      print(e);
    }
    // notifyListeners();
  }

  clearshopFields() {
    shopNameController.clear();
    shopDetailsController.clear();
    shopLocationController.clear();
    shopServiceController.clear();
    notifyListeners();
  }

  File? shopPic;

  Future<File> pickShopPhoto(context) async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        shopPic = File(pickedImage.path);
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
    return shopPic!;
  }

  Future<void> selectShopPic(context) async {
    shopPic = await pickShopPhoto(context);
    notifyListeners();
  }

  uploadShopPhoto(File shopPhoto, String shopName) async {
    await storeImagetoStorge('Shop Docs/$shopName/Profile pic', shopPhoto)
        .then((value) async {
      shopModel.shopPhoto = value;

      DocumentReference docRef =
          firebaseFirestore.collection('shops').doc(shopName);
      docRef.update({'shopPhoto': value});
    });
    _shopModel = shopModel;
    print('Pic uploaded successfully');
    notifyListeners();
  }

//______________________________________________________________________________
  File? pharmacyPic;

  Future<File> pickPharmacyPhoto(context) async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        pharmacyPic = File(pickedImage.path);
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
    return pharmacyPic!;
  }

  Future<void> selectPharmacyPic(context) async {
    pharmacyPic = await pickPharmacyPhoto(context);
    notifyListeners();
  }

  uploadPharmacyPhoto(File pharmacyPhoto, String pharmacyName) async {
    await storeImagetoStorge(
            'Pharmacy Docs/$pharmacyName/Profile pic', pharmacyPhoto)
        .then((value) async {
      pharmacyModel.pharmacyPhoto = value;

      DocumentReference docRef =
          firebaseFirestore.collection('pharmacy').doc(pharmacyName);
      docRef.update({'pharmacyPhoto': value});
    });
    _pharmacyModel = pharmacyModel;
    print('Pic uploaded successfully');
    notifyListeners();
  }

  //__________________________PHARMACY CONTROL__________________________________

  TextEditingController pharmacyNameController = TextEditingController();
  TextEditingController pharmacyDetailsController = TextEditingController();
  TextEditingController pharmacyLocationController = TextEditingController();
  TextEditingController pharmacyMedicineController = TextEditingController();

  final pharmacyAddKey = GlobalKey<FormState>();

  PharmacyModel? _pharmacyModel;
  PharmacyModel get pharmacyModel => _pharmacyModel!;

  Future<void> savePharmacy(
    String pharmacyName,
    String pharmacyLocation,
    String pharmacyDetails,
    String pharmacyMedicines,
  ) async {
    try {
      _pharmacyModel = PharmacyModel(
          pharmacyid: pharmacyName,
          pharmacyName: pharmacyName,
          pharmacyDetails: pharmacyDetails,
          pharmacyLocation: pharmacyLocation,
          pharmacyMedicines: pharmacyMedicines);
      await firebaseFirestore
          .collection('pharmacy')
          .doc(pharmacyName)
          .set(_pharmacyModel!.toMap());
      print('**********Shop Stored*******');
      notifyListeners();
    } catch (e) {
      print("Shop storing failed : $e");
    }

    notifyListeners();
  }

  List<PharmacyModel> pharmacyList = [];
  PharmacyModel? pharmacies;

  Future<void> fetchPharmacy() async {
    try {
      pharmacyList.clear();

      CollectionReference pharmacyRef =
          firebaseFirestore.collection('pharmacy');
      QuerySnapshot pharmacySnapshot = await pharmacyRef.get();

      for (var doc in pharmacySnapshot.docs) {
        String pharmacyid = doc['pharmacyid'];
        String pharmacyName = doc['pharmacyName'];
        String pharmacyPhoto = doc['pharmacyPhoto'];
        String pharmacyLocation = doc['pharmacyLocation'];
        String pharmacyMedicines = doc['pharmacyMedicines'];
        double pharmacyRating = doc['pharmacyRating'] ?? 0;
        String pharmacyDetails = doc['pharmacyDetails'] ?? '';
        String pharmacyImages = doc['pharmacyImages'] ?? '';
        String pharmacyMedia = doc['pharmacyMedia'] ?? '';

        pharmacies = PharmacyModel(
          pharmacyid: pharmacyid,
          pharmacyName: pharmacyName,
          pharmacyDetails: pharmacyDetails,
          pharmacyLocation: pharmacyLocation,
          pharmacyMedicines: pharmacyMedicines,
          pharmacyPhoto: pharmacyPhoto,
          pharmacyRating: pharmacyRating,
          pharmacyImages: pharmacyImages,
          pharmacyMedia: pharmacyMedia,
        );
        pharmacyList.add(pharmacies!);
      }
      print('*********PHARMACY FETCH COMPLETE');
      notifyListeners();
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
