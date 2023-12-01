import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/admin_controller.dart';
import 'package:tailwag/controller/bottomnavbar_controller.dart';
import 'package:tailwag/controller/controller.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavBarController = Provider.of<BottomNavBarController>(context);
    List<String> items = ['Hopitals', 'Shops', 'Pharmacies', 'Products'];
    final dashboardAdminController =
        Provider.of<AdminController>(context, listen: false);

    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Dashboard',
          style:
              TextStyle(color: color2, fontFamily: 'AbhayaLibre', fontSize: 30),
        ),
        backgroundColor: color1,
        actions: [
          IconButton(
            onPressed: () {
              dashboardAdminController.adminsignOut(context);
              bottomNavBarController.currentIndex = 0;
            },
            icon: const Icon(
              Icons.logout,
              color: color2,
            ),
          )
        ],
      ),
      body: Consumer<AdminController>(
        builder: (context, adminDashboardController, _) {
          List<int> itemsCount = [
            adminDashboardController.hospitalsList.length,
            adminDashboardController.shopsList.length,
            adminDashboardController.pharmacyList.length,
            adminDashboardController.productList.length,
          ];
          return ListView.separated(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    color: color2,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            items[index],
                            style: const TextStyle(
                                fontFamily: 'AbhayaLibre',
                                color: Colors.white,
                                fontSize: 20),
                          ),
                          Text(
                            itemsCount[index].toString(),
                            style: const TextStyle(
                              fontFamily: 'AbhayaLibre',
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
              itemCount: items.length);
        },
      ),
    );
  }
}
