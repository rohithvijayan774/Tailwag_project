import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/admin_controller.dart';
import 'package:tailwag/widgets/hospital_list_tile.dart';

class PetPharmacy extends StatelessWidget {
  const PetPharmacy({super.key});

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
          'Hospitals',
          style: TextStyle(
            fontFamily: 'AbhayaLibre',
            color: color2,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<AdminController>(
        builder: (context, adminUserPharmacyController, _) {
          return FutureBuilder(
            future: adminUserPharmacyController.fetchPharmacy(),
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
                  itemCount: adminUserPharmacyController.pharmacyList.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemBuilder: (context, index) {
                    return HospitalListTile(
                      hospitalTitle: adminUserPharmacyController
                          .pharmacyList[index].pharmacyName,
                      hospitalLocation: adminUserPharmacyController
                          .pharmacyList[index].pharmacyLocation,
                      rating: adminUserPharmacyController
                          .pharmacyList[index].pharmacyRating!,
                      imageURL: adminUserPharmacyController
                          .pharmacyList[index].pharmacyPhoto,
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
