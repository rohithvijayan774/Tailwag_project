import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/bottomnavbar_controller.dart';

class AdminBottomNavBar extends StatelessWidget {
  const AdminBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarController>(
      builder: (context, bottomNavProvider, _) {
        return Scaffold(
          body:
              bottomNavProvider.adminPages[bottomNavProvider.adminCurrentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            selectedItemColor: color2,
            currentIndex: bottomNavProvider.adminCurrentIndex,
            onTap: (index) {
              bottomNavProvider.updateAdminIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.dashboard,
                ),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.medical_services_outlined,
                ),
                label: 'Hospitals',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                ),
                label: 'Shops',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.local_pharmacy_outlined,
                ),
                label: 'Pharmacy',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.production_quantity_limits,
                ),
                label: 'Product',
              ),
            ],
          ),
        );
      },
    );
  }
}
