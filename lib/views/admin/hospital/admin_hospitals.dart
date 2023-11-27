import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/admin_controller.dart';
import 'package:tailwag/views/admin/hospital/add_hospital.dart';
import 'package:tailwag/widgets/hospital_list_tile.dart';

class AdminHospital extends StatelessWidget {
  const AdminHospital({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Hospitals',
          style:
              TextStyle(color: color2, fontFamily: 'AbhayaLibre', fontSize: 30),
        ),
        backgroundColor: color1,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddHospital(),
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
        builder: (context, adminHospitalController, _) {
          return FutureBuilder(
            future: adminHospitalController.fetchHospitals(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: adminHospitalController.hospitalsList.isEmpty
                    ? const Center(
                        child: Text('No Hospitals Found'),
                      )
                    : ListView.separated(
                        itemCount: adminHospitalController.hospitalsList.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                        itemBuilder: (context, index) {
                          return HospitalListTile(
                            hospitalTitle: adminHospitalController
                                .hospitalsList[index].hospitalName,
                            hospitalLocation: adminHospitalController
                                .hospitalsList[index].hospitalLocation,
                            rating: adminHospitalController
                                        .hospitalsList[index].hospitalRating !=
                                    null
                                ? adminHospitalController
                                    .hospitalsList[index].hospitalRating!
                                : 0,
                            imageURL: adminHospitalController
                                .hospitalsList[index].hospitalPhoto,
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
