import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tailwag/models/hospital_model.dart';

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
}
