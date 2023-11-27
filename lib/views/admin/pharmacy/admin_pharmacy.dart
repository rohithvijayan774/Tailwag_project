import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/admin_controller.dart';
import 'package:tailwag/views/admin/pharmacy/add_pharmacy.dart';
import 'package:tailwag/widgets/shop_list_tile.dart';

class AdminPharmacy extends StatelessWidget {
  const AdminPharmacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Pharmacies',
          style:
              TextStyle(color: color2, fontFamily: 'AbhayaLibre', fontSize: 30),
        ),
        backgroundColor: color1,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddPharmacy(),
                ),
              );
            },
            icon: const Icon(
              Icons.add_to_photos_outlined,
              color: color2,
            ),
          )
        ],
      ),
      body: Consumer<AdminController>(
        builder: (context, adminPharmacyController, _) {
          return FutureBuilder(
            future: adminPharmacyController.fetchPharmacy(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: color2,
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: adminPharmacyController.pharmacyList.isEmpty
                    ? const Center(
                        child: Text(
                          'No Pharmacies Found',
                          style: TextStyle(
                              fontFamily: 'AbhayaLibre', color: color2),
                        ),
                      )
                    : ListView.separated(
                        itemCount: adminPharmacyController.pharmacyList.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                        itemBuilder: (context, index) {
                          return ShopListTile(
                            shopTitle: adminPharmacyController
                                .pharmacyList[index].pharmacyName,
                            shopLocation: adminPharmacyController
                                .pharmacyList[index].pharmacyLocation,
                            rating: adminPharmacyController
                                        .pharmacyList[index].pharmacyRating !=
                                    null
                                ? adminPharmacyController
                                    .pharmacyList[index].pharmacyRating!
                                : 0,
                            imageURL: adminPharmacyController
                                .pharmacyList[index].pharmacyPhoto!,
                          );
                        },
                      ),
              );
            },
          );
        },
      ),
    );
  }
}
