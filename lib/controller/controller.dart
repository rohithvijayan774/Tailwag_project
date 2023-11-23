import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/bottomnavbar_controller.dart';
import 'package:tailwag/controller/sitter_controller.dart';
import 'package:tailwag/models/my_notes_model.dart';
import 'package:tailwag/models/reminder_model.dart';
import 'package:tailwag/models/sitter_model.dart';
import 'package:tailwag/models/user_model.dart';
import 'package:tailwag/views/splash_screen.dart';
import 'package:tailwag/views/user_signup/user_login.dart';
import 'package:tailwag/widgets/bottomnavbar.dart';
import 'package:tailwag/widgets/loading_screen.dart';

class Controller extends ChangeNotifier {
  Controller() {
    checkSignedIn();
  }
  final userSignUpFormKEy = GlobalKey<FormState>();
  final userLoginFormKEy = GlobalKey<FormState>();
  final petDetailsFormKEy = GlobalKey<FormState>();

  //------------------------OTP SERVICES----------------------------------------

  int secondsRemaining = 180;
  Timer? timer;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (Timer timer) {
      if (secondsRemaining == 0) {
        timer.cancel();
      } else {
        secondsRemaining--;
      }
    });
    notifyListeners();
  }

  //----------------------User Signup-------------------------------------------
  String? otpError;
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userNumberController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  TextEditingController userConfirmPasswordController = TextEditingController();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  UserModel? _userModel;
  UserModel get userModel => _userModel!;

  MyNotesModel? _myNotesModel;
  MyNotesModel get myNotesModel => _myNotesModel!;

  Country selectedCountry = Country(
      phoneCode: "91",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "India",
      example: 'India',
      displayName: 'India',
      displayNameNoCountryCode: "IN",
      e164Key: "");

  showCountries(context) {
    showCountryPicker(
      context: context,
      countryListTheme: const CountryListThemeData(bottomSheetHeight: 600),
      onSelect: (value) {
        selectedCountry = value;
      },
    );
    notifyListeners();
  }

  // Future<void> sendOTP(context,String userNumber) async {
  //   try {
  //     // userNumber = userNumberController.text.trim();
  //     await firebaseAuth.verifyPhoneNumber(
  //       phoneNumber: "+${selectedCountry.phoneCode}$userNumber}",
  //       verificationCompleted: (phoneAuthCredential) {},
  //       verificationFailed: (error) {
  //         otpError = error.toString();
  //         log('Verification Error : $otpError');
  //       },
  //       codeSent: (verificationId, forceResendingToken) {
  //         log(verificationId);
  //         Navigator.of(context).push(
  //           MaterialPageRoute(
  //             builder: (context) => EnterOTP(userNumber: userNumber),
  //           ),
  //         );
  //       },
  //       codeAutoRetrievalTimeout: (verificationId) {},
  //     );
  //   } catch (e) {
  //     print(e);
  //   }

  //   notifyListeners();
  // }

  Future<void> saveUser(
    String registerid,
    String userName,
    String userEmail,
    String userNumber,
  ) async {
    _userModel = UserModel(
      registerid: registerid,
      userName: userName,
      userEmail: userEmail,
      userNumber: userNumber,
    );

//Save user data
    await firebaseFirestore
        .collection('users')
        .doc(registerid)
        .set(_userModel!.toMap());

    notifyListeners();
  }

  Future<void> signUpUser(String userName, String userEmail, String userNumber,
      userPassword, context) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
              email: userEmail, password: userPassword);

      final user = firebaseAuth.currentUser;
      user?.sendEmailVerification();
      await saveUser(
        userCredential.user!.uid,
        userName,
        userEmail,
        userNumber,
      );
      myCustomAlert(
        context,
        '',
        userEmail,
        () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const UserLogin(),
            ),
          );
        },
      );

      clearRegisterFields();
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
    clearLoginFields();
    notifyListeners();
  }

  void clearRegisterFields() {
    userNameController.clear();
    userEmailController.clear();
    userNumberController.clear();
    userPasswordController.clear();
    userConfirmPasswordController.clear();
    notifyListeners();
  }

  //----------------------User Login-------------------------------------------

  TextEditingController userEmailLoginController = TextEditingController();
  TextEditingController userPasswordLoginController = TextEditingController();

  Future<void> userLogin(String userEmail, String userPassword, context) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: userEmail, password: userPassword);
      final user = firebaseAuth.currentUser;
      final emailVerified = user!.emailVerified;
      print('Verification : $emailVerified');

      if (emailVerified == false) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please verify your email')));
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const LoadingScreen(),
            ),
            (route) => false);
        setSignIn();
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

  void clearLoginFields() {
    userEmailLoginController.clear();
    userPasswordLoginController.clear();
    notifyListeners();
  }

  //----------------------Getting data-------------------------------------------
  String? _uid;
  String get uid => _uid!;
  Future getDataFromFirestore() async {
    try {
      print('********GETTING DATA*****************');
      await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .get()
          .then((DocumentSnapshot snapshot) {
        _userModel = UserModel(
            registerid: firebaseAuth.currentUser!.uid,
            userName: snapshot['userName'],
            userEmail: snapshot['userEmail'],
            userNumber: snapshot['userNumber'],
            petName: snapshot['petName'],
            breedName: snapshot['breedName'],
            petSex: snapshot['petSex'],
            petAge: snapshot['petAge'],
            petWeight: snapshot['petWeight'],
            aboutPet: snapshot['aboutPet'],
            petPic: snapshot['petPic']);
        _uid = userModel.registerid;
        print('********GETTING DATA COMPLETED*****************');
      });
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

  //----------------------User SplashScreen-------------------------------------------

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  void checkSignedIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _isSignedIn = sharedPreferences.getBool('is_signedIn') ?? false;
    notifyListeners();
  }

  Future setSignIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool('is_signedIn', true);
    _isSignedIn = true;

    notifyListeners();
  }

  Future setSignOut() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool('is_signedIn', false);
    _isSignedIn = false;

    notifyListeners();
  }

  final setSitter = SitterController().sitterSignIn;

  Future<void> gotoNext(context) async {
    await Future.delayed(const Duration(seconds: 2));
    if (isSignedIn == true) {
      print('Owner signedin : $isSignedIn');
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const BottomNavBar(),
        ),
      );
    }

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
                setSignOut();
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

  //----------------------Pet Details--------------------------------------

  TextEditingController petNameController = TextEditingController();
  TextEditingController breedNameController = TextEditingController();
  TextEditingController petSexController = TextEditingController();
  TextEditingController petAgeController = TextEditingController();
  TextEditingController petWeightController = TextEditingController();
  TextEditingController aboutMyPetController = TextEditingController();

  Future<void> updatePetDetails(
    String petName,
    String breedName,
    String petSex,
    String petAge,
    String petWeight,
    String aboutPet,
  ) async {
    try {
      print('***********Updating Pet Details********');
      DocumentReference docRef = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid);

      await docRef.update({
        'petName': petName,
        'breedName': breedName,
        'petSex': petSex,
        'petAge': petAge,
        'petWeight': petWeight,
        'aboutPet': aboutPet,
      });

      print('***********Updating Finished********');
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

//------------------------FETCH SITTERS-----------------------------

  List<SitterModel> sittersList = [];
  SitterModel? sitters;

  Future<void> fetchSitters() async {
    try {
      print('***************************FETCHING SITTERS************');
      sittersList.clear();
      CollectionReference sitterRef = firebaseFirestore.collection('sitters');
      QuerySnapshot sitterSnapshot = await sitterRef.get();

      for (var doc in sitterSnapshot.docs) {
        String sitterRegisterid = doc['sitterRegisterid'];
        String sitterName = doc['sitterName'];
        String sitterPlace = doc['sitterPlace'];
        String sitterNumber = doc['sitterNumber'];
        String sitterEmail = doc['sitterEmail'];
        String sitterTitle = doc['sitterTitle'];
        String sitterDetails = doc['sitterDetails'];
        String sitterProPic = doc['sitterProPic'] ?? 'null';
        String sitterCoverPic = doc['sitterCoverPic'] ?? 'null';

        sitters = SitterModel(
          sitterRegisterid: sitterRegisterid,
          sitterName: sitterName,
          sitterPlace: sitterPlace,
          sitterNumber: sitterNumber,
          sitterEmail: sitterEmail,
          sitterTitle: sitterTitle,
          sitterDetails: sitterDetails,
          sitterProPic: sitterProPic,
          sitterCoverPic: sitterCoverPic,
        );
        sittersList.add(sitters!);
        print('***************************FETCHING FINISHED************');
      }
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

  //_______________________________SAVE NOTES___________________________________

  TextEditingController noteDateController = TextEditingController();
  TextEditingController noteTitleController = TextEditingController();
  TextEditingController noteDescriptionController = TextEditingController();
  final myNotesKey = GlobalKey<FormState>();

  Future<void> saveMyNotes(
    String date,
    String title,
    String description,
  ) async {
    print('**************SAVE NOT STARTED**************');
    _myNotesModel = MyNotesModel(
      noteid: DateTime.now().microsecondsSinceEpoch.toString(),
      date: date,
      title: title,
      description: description,
    );

    await firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .collection('myNotes')
        .doc(DateTime.now().microsecondsSinceEpoch.toString())
        .set(_myNotesModel!.toMap());
    clearNotesField();
    print('**************NOtes saved**************');

    notifyListeners();
  }

  clearNotesField() {
    noteDateController.clear();
    noteTitleController.clear();
    noteDescriptionController.clear();
    notifyListeners();
  }

  List<MyNotesModel> myNotesList = [];
  MyNotesModel? myNotes;

 Future<void> fetchNotes() async {
    try {
      print('********FETCHING NOTES******************');
      myNotesList.clear();
      CollectionReference myNotesRef = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('myNotes');
      QuerySnapshot myNotesSnapshot = await myNotesRef.get();

      for (var doc in myNotesSnapshot.docs) {
        String myNotesid = doc['noteid'];
        String myNotesDate = doc['date'];
        String myNotesTitle = doc['title'];
        String myNotesDescription = doc['description'];

        myNotes = MyNotesModel(
          noteid: myNotesid,
          date: myNotesDate,
          title: myNotesTitle,
          description: myNotesDescription,
        );
        myNotesList.add(myNotes!);
      }
      print('********FETCHING COMPLETED******************');
    } catch (e) {
      print('Notes Fetching error : $e');
    }
    notifyListeners();
  }

  //_____________________________DATE PICKER____________________________________

  DateTime? selectedDate;
  DateTime todayDate = DateTime.now();
  // final formattedSelectedDate = DateFormat('MMMM dd,yyyy').format(todayDate);

  Future<void> selectDate(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      noteDateController.text = DateFormat('dd-MMM-yyyy').format(picked);
    }
    notifyListeners();
  }

  //_______________________ SAVE REMINDER ___________________________________

  ReminderModel? _reminderModel;
  ReminderModel get reminderModel => _reminderModel!;

  TextEditingController reminderDateController = TextEditingController();
  TextEditingController reminderTimeController = TextEditingController();
  TextEditingController reminderTitleController = TextEditingController();
  TextEditingController reminderDescriptionController = TextEditingController();

  final reminderFormKey = GlobalKey<FormState>();

  Future<void> saveReminder(
    String reminderid,
    String reminderDate,
    String reminderTime,
    String reminderTitle,
    String reminderDescription,
  ) async {
    _reminderModel = ReminderModel(
      reminderid: reminderid,
      reminderDate: reminderDate,
      reminderTime: reminderTime,
      reminderTitle: reminderTitle,
      reminderDescription: reminderDescription,
    );

    await firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .collection('reminder')
        .doc(reminderid)
        .set(_reminderModel!.toMap());
    print('***********REMINDER SAVED************');
    clearReminderFields();
    notifyListeners();
  }

  DateTime? reminderSelectedDate;

  Future<void> reminderSelectDate(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != reminderSelectedDate) {
      reminderSelectedDate = picked;
      reminderDateController.text = DateFormat('dd-MMM-yyyy').format(picked);
    }

    notifyListeners();
  }

  TimeOfDay? reminderSelectedTime;

  Future<void> reminderSelectTime(context) async {
    final picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (picked != null && picked != reminderSelectedTime) {
      reminderSelectedTime = picked;
      final formattedTime = reminderSelectedTime!.format(context).toString();
      reminderTimeController.text = formattedTime;
    }

    notifyListeners();
  }

  List<ReminderModel> reminderList = [];
  ReminderModel? reminders;

 Future<void> fetchReminder(selectedDate) async {
    try {
      print('*********FETCHING REMINDER *********');
      reminderList.clear();
      CollectionReference reminderRef = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('reminder');

      QuerySnapshot reminderSnapshot = await reminderRef
          .where('reminderDate', isEqualTo: selectedDate)
          .get();

      for (var doc in reminderSnapshot.docs) {
        String reminderid = doc['reminderid'];
        String reminderDate = doc['reminderDate'];
        String reminderTime = doc['reminderTime'];
        String reminderTitle = doc['reminderTitle'];
        String reminderDescription = doc['reminderDescription'];

        reminders = ReminderModel(
          reminderid: reminderid,
          reminderDate: reminderDate,
          reminderTime: reminderTime,
          reminderTitle: reminderTitle,
          reminderDescription: reminderDescription,
        );
        reminderList.add(reminders!);
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  clearReminderFields() {
    reminderDateController.clear();
    reminderTitleController.clear();
    reminderDescriptionController.clear();
    reminderTimeController.clear();
    notifyListeners();
  }

  //_________________________PICK UPLOAD________________________________________

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

  File? petPic;

  Future<File> pickPetPic(context) async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        petPic = File(pickedImage.path);
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
    return petPic!;
  }

  Future<void> selectPetPic(context) async {
    petPic = await pickPetPic(context);
    notifyListeners();
  }

  uploadPetPic(File petPic) async {
    await storeImagetoStorge(
            'Users Docs/Pet Pics/${firebaseAuth.currentUser!.uid}', petPic)
        .then((value) async {
      userModel.petPic = value;

      DocumentReference docRef = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid);
      docRef.update({'petPic': value});
    });
    _userModel = userModel;
    print('Pic uploaded successfully');
    notifyListeners();
  }

  //_______________________________DRAWER_______________________________________

  List<String> drawerTitles = [
    'Home',
    'Profile',
    'Articles',
    'Shop',
    'Hospital',
    'Sitters',
    'Favourites',
    'Notifications',
    'Settings',
    'Log out'
  ];

  List<Icon> drawerIcons = [
    const Icon(Icons.home_outlined),
    const Icon(Icons.person_outline_outlined),
    const Icon(Icons.menu_book_outlined),
    const Icon(Icons.shopping_bag_outlined),
    const Icon(Icons.local_hospital_outlined),
    const Icon(Icons.people_outline_sharp),
    const Icon(Icons.favorite_border_rounded),
    const Icon(Icons.notifications_none_outlined),
    const Icon(Icons.settings_outlined),
    const Icon(Icons.logout_rounded),
  ];
}
