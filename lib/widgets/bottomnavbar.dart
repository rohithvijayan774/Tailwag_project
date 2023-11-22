import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/bottomnavbar_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // final provider =
    //     Provider.of<BottomNavBarController>(context, listen: false);
    return Consumer<BottomNavBarController>(
      builder: (context, bottomNavProvider, _) {
        return Scaffold(
          body: bottomNavProvider.pages[bottomNavProvider.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            // useLegacyColorScheme: false,
            unselectedItemColor: Colors.grey,
            selectedItemColor: color2,
            currentIndex: bottomNavProvider.currentIndex,
            onTap: (index) {
              bottomNavProvider.updateIndex(index);
            },
            items: [
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                ),
                label: 'Shop',
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.access_time_rounded,
                ),
                label: 'Sitters',
              ),
              BottomNavigationBarItem(
                icon: CircleAvatar(
                  backgroundColor: bottomNavProvider.currentIndex == 2
                      ? color2
                      : Colors.grey,
                  backgroundImage: const AssetImage('assets/images/Paw.png'),
                ),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: 'Care',
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_outlined,
                ),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
