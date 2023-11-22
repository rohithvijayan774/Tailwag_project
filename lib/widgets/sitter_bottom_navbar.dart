import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/sitter_bottomnavbar_controller.dart';

class SitterBottomNavBar extends StatelessWidget {
  const SitterBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // final provider =
    //     Provider.of<BottomNavBarController>(context, listen: false);
    return Consumer<SitterBottomNavBarController>(
        builder: (context, provider, _) {
      return Scaffold(
        body: provider.pages[provider.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // useLegacyColorScheme: false,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          currentIndex: provider.currentIndex,
          onTap: (index) {
            provider.updateIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag_outlined,
              ),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.access_time_rounded,
              ),
              label: 'Sitters',
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: color2,
                backgroundImage: AssetImage('assets/images/Paw.png'),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'Care',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
              ),
              label: 'Profile',
            ),
          ],
        ),
      );
    });
  }
}
