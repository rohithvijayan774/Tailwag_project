import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/admin_controller.dart';
import 'package:tailwag/widgets/hospital_list_tile.dart';

class PetShops extends StatelessWidget {
  const PetShops({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        backgroundColor: color1,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: color2,
          ),
        ),
        title: const Text(
          'Shops',
          style: TextStyle(
            fontFamily: 'AbhayaLibre',
            color: color2,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<AdminController>(
          builder: (context, adminUserShopController, _) {
        return FutureBuilder(
            future: adminUserShopController.fetchShops(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    backgroundColor: color2,
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.separated(
                  itemCount: adminUserShopController.shopsList.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemBuilder: (context, index) {
                    return HospitalListTile(
                      hospitalTitle:
                          adminUserShopController.shopsList[index].shopName,
                      hospitalLocation:
                          adminUserShopController.shopsList[index].shopLocation,
                      rating:
                          adminUserShopController.shopsList[index].shopRating!,
                      imageURL:
                          adminUserShopController.shopsList[index].shopPhoto!,
                    );
                  },
                ),
              );
            });
      }),
    );
  }
}
