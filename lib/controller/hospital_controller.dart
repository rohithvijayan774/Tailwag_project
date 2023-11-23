import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tailwag/models/hospital_model.dart';

class HospitalController extends ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  HospitalModel? _hospitalModel;
  HospitalModel get hospitalModel => _hospitalModel!;

  Future<void> saveHospital(
    String hospitalName,
    String hospitalPhoto,
    String hospitalLocation,
    double hospitalRating,
  ) async {
    try {
      _hospitalModel = HospitalModel(
        hospitalid: hospitalName,
        hospitalName: hospitalName,
        hospitalPhoto: hospitalPhoto,
        hospitalLocation: hospitalLocation,
        hospitalRating: hospitalRating,
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

  fetchHospitals() async {
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
        double hospitalRating = doc['hospitalRating'];
        String hospitalDetails = doc['hospitalDetails'] ?? '';
        String hospitalImages = doc['hospitalImages'] ?? '';
        String hospitalMedia = doc['hospitalMedia'] ?? '';
        // print('Before pic convert ');
        // String photoURL =
        //     await firebaseStorage.ref(hospitalPhoto).getDownloadURL();
        // print('pic converted ');

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
}
