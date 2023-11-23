import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/models/sitter_model.dart';
import 'package:tailwag/views/on_boarding/onboarding_4.dart';
import 'package:tailwag/views/sitter_signup/sitter_login.dart';
import 'package:tailwag/views/splash_screen.dart';
import 'package:tailwag/widgets/loading_screen_2.dart';
import 'package:tailwag/widgets/sitter_bottom_navbar.dart';

class SitterController extends ChangeNotifier {
  SitterController() {
    checkSitterSignedIn();
  }
  final sitterSignUpFormKEy = GlobalKey<FormState>();
  final sitterLoginFormKEy = GlobalKey<FormState>();

  TextEditingController sitterNameController = TextEditingController();
  TextEditingController sitterPlaceController = TextEditingController();
  TextEditingController sitterPhoneController = TextEditingController();
  TextEditingController sitterEmailController = TextEditingController();
  TextEditingController sitterPasswordController = TextEditingController();
  TextEditingController sitterConfirmPasswordController =
      TextEditingController();
  TextEditingController sitterTitleController = TextEditingController();
  TextEditingController sitterDetailsController = TextEditingController();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  SitterModel? _sitterModel;
  SitterModel get sitterModel => _sitterModel!;

//_____________________________SIGNUP____________________________________

  Future<void> saveSitter(
    String sitterRegisterid,
    String sitterName,
    String sitterPlace,
    String sitterNumber,
    String sitterEmail,
    String sitterTitle,
    String sitterDetails,
  ) async {
    _sitterModel = SitterModel(
        sitterRegisterid: sitterRegisterid,
        sitterName: sitterName,
        sitterPlace: sitterPlace,
        sitterNumber: sitterNumber,
        sitterEmail: sitterEmail,
        sitterTitle: sitterTitle,
        sitterDetails: sitterDetails);

    await firebaseFirestore
        .collection('sitters')
        .doc(sitterRegisterid)
        .set(_sitterModel!.toMap());

    notifyListeners();
  }

  Future<void> signUpSitter(
    String sitterName,
    String sitterPlace,
    String sitterPhone,
    String sitterEmail,
    String sitterTitle,
    String sitterDetails,
    String sitterPassword,
    context,
  ) async {
    try {
      print('******************* Signup Initialized*****************');
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
              email: sitterEmail, password: sitterPassword);

      final sitter = firebaseAuth.currentUser;
      sitter!.sendEmailVerification();

      await saveSitter(userCredential.user!.uid, sitterName, sitterPlace,
          sitterPhone, sitterEmail, sitterTitle, sitterDetails);

      myCustomAlert(
        context,
        '',
        sitterEmail,
        () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SitterLogin(),
            ),
          );
        },
      );
      clearSignupFields();
      print('******************* Signup Finished*****************');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Pasword is too weak')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Email already used')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
    notifyListeners();
  }

  clearSignupFields() {
    sitterNameController.clear();
    sitterPlaceController.clear();
    sitterPhoneController.clear();
    sitterEmailController.clear();
    sitterPasswordController.clear();
    sitterConfirmPasswordController.clear();
    sitterTitleController.clear();
    sitterDetailsController.clear();
    notifyListeners();
  }

  //_________________________________LOGIN______________________________________

  TextEditingController sitterEmailLoginController = TextEditingController();
  TextEditingController sitterpasswordLoginController = TextEditingController();

  Future<void> sitterLogin(
      String sitterEmail, String sitterPassword, context) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: sitterEmail, password: sitterPassword);

      final sitter = firebaseAuth.currentUser;
      final emailVerified = sitter!.emailVerified;
      print('verfification : $emailVerified');

      if (emailVerified == false) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please verify your email')));
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const LoadingScreen2(),
            ),
            (route) => false);
        setSitterSignIn();
        clearLoginFields();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('No user found')));
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('No user found')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Incorrect password')));
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  bool _sitterSignIn = false;
  bool get sitterSignIn => _sitterSignIn;

  void checkSitterSignedIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _sitterSignIn = sharedPreferences.getBool('sitter_signin') ?? false;
    notifyListeners();
  }

  Future setSitterSignIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool('sitter_signin', true);
    _sitterSignIn = true;
    print('Set SItter Signed in $_sitterSignIn');
    print('Set SItter Signed in $sitterSignIn');
    notifyListeners();
    return _sitterSignIn;
  }

  Future setSitterSignOut() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool('sitter_signin', false);
    _sitterSignIn = false;

    notifyListeners();
  }

  clearLoginFields() {
    sitterEmailLoginController.clear();
    sitterpasswordLoginController.clear();
    notifyListeners();
  }

  void signOut(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          // content: Text("Do you want to SignOut?"),
          title: const Text(
            'Do you want to SignOut?',
            style:
                TextStyle(fontFamily: 'SofiaPro', fontWeight: FontWeight.w600),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 17, fontFamily: "SofiaPro"),
              ),
            ),
            TextButton(
              onPressed: () async {
                setSitterSignOut();
                // _isSignedIn = false;
                // await clearLocalData();

                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (ctx1) => const SplashScreen(),
                    ),
                    (route) => false);
              },
              child: const Text(
                'SignOut',
                style: TextStyle(
                    fontSize: 17, color: Colors.red, fontFamily: "SofiaPro"),
              ),
            ),
          ],
        );
      },
    );
    notifyListeners();
  }

  //________________________________GET DATA______________________________________

  String? _sitterid;
  String get sitterid => _sitterid!;

  Future<void> fetchSitterData() async {
    try {
      print('******************* STARTED FETCHING DATA**********');
      await firebaseFirestore
          .collection('sitters')
          .doc(firebaseAuth.currentUser!.uid)
          .get()
          .then((DocumentSnapshot snapshot) {
        _sitterModel = SitterModel(
          sitterRegisterid: firebaseAuth.currentUser!.uid,
          sitterName: snapshot['sitterName'],
          sitterPlace: snapshot['sitterPlace'],
          sitterNumber: snapshot['sitterNumber'],
          sitterEmail: snapshot['sitterEmail'],
          sitterTitle: snapshot['sitterTitle'],
          sitterDetails: snapshot['sitterDetails'],
          sitterProPic: snapshot['sitterProPic'],
          sitterCoverPic: snapshot['sitterCoverPic'],
        );

        _sitterid = sitterModel.sitterRegisterid;
      });
      print('******************* FINISHED FETCHING DATA**********');
      print(
          "***************SitterCoverPic : ${sitterModel.sitterCoverPic}***************");
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  //________________________________CUSTOM______________________________________

  myCustomAlert(context, message, email, Function onTap) {
    CoolAlert.show(
        onConfirmBtnTap: () {
          onTap;
        },
        backgroundColor: color3,
        title: 'Verification',
        text: 'A verification link sent to $email. Verify email before login.',
        confirmBtnColor: color2,
        context: context,
        type: CoolAlertType.info,
        widget: Container(
          alignment: Alignment.center,
          child: Column(
            children: [Text(message)],
          ),
        ),
        width: 300);
    notifyListeners();
  }

  //_____________________________UPLOAD AND STORE PICS__________________________

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

  File? proPic;

  Future<File> pickProPic(context) async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        proPic = File(pickedImage.path);
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
    return proPic!;
  }

  Future<void> selectProPic(context) async {
    proPic = await pickProPic(context);
    notifyListeners();
  }

  uploadProPic(File profilePic) async {
    await storeImagetoStorge(
            'Sitters Docs/Profile Pics/${firebaseAuth.currentUser!.uid}',
            profilePic)
        .then((value) async {
      sitterModel.sitterProPic = value;

      DocumentReference docRef = firebaseFirestore
          .collection('sitters')
          .doc(firebaseAuth.currentUser!.uid);
      docRef.update({'sitterProPic': value});
    });
    _sitterModel = sitterModel;
    print('Pic Uploaded successfully');
    notifyListeners();
  }

  File? coverPic;

  Future<File> pickCoverPic(context) async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        coverPic = File(pickedImage.path);
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
    return coverPic!;
  }

  Future<void> selectCoverPic(context) async {
    coverPic = await pickCoverPic(context);
    notifyListeners();
  }

  uploadCoverPic(File coverPic) async {
    await storeImagetoStorge(
            'Sitters Docs/Cover Pics/${firebaseAuth.currentUser!.uid}',
            coverPic)
        .then((value) async {
      sitterModel.sitterCoverPic = value;

      DocumentReference docRef = firebaseFirestore
          .collection('sitters')
          .doc(firebaseAuth.currentUser!.uid);
      docRef.update({'sitterCoverPic': value});
    });
    _sitterModel = sitterModel;
    print('Cover pic updated successfully');
    notifyListeners();
  }

  gotoNext(context) {
    if (sitterSignIn == true) {
      print('Sitter signedin : $sitterSignIn');
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const SitterBottomNavBar(),
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const OnBoarding4(),
        ),
      );
    }
    notifyListeners();
  }
}
