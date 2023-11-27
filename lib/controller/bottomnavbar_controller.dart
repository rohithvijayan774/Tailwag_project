import 'package:flutter/material.dart';
import 'package:tailwag/views/admin/admin_dashboard.dart';
import 'package:tailwag/views/admin/hospital/admin_hospitals.dart';
import 'package:tailwag/views/admin/pharmacy/admin_pharmacy.dart';
import 'package:tailwag/views/admin/shops/admin_shop.dart';
import 'package:tailwag/views/home_screen.dart';
import 'package:tailwag/views/profile.dart';
import 'package:tailwag/views/care.dart';
import 'package:tailwag/views/shop.dart';
import 'package:tailwag/views/sitters.dart';

class BottomNavBarController extends ChangeNotifier {
  int currentIndex = 2;

  List<Widget> pages = [
    const Shop(),
    const Sitters(),
    const HomeScreen(),
    const Care(),
    const Profile(),
  ];

  void updateIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }

  Future<void> homeIndex() async {
    currentIndex = 2;
    notifyListeners();
  }

//____________________________________FOR ADMIN ________________________________

  int adminCurrentIndex = 0;

  List<Widget> adminPages = [
    const AdminHospital(),
    const AdminShop(),
    const AdminDashboard(),
    const AdminPharmacy(),
  ];

  void updateAdminIndex(int newIndex) {
    adminCurrentIndex = newIndex;
    notifyListeners();
  }
}
