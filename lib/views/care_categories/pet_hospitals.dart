import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/admin_controller.dart';
import 'package:tailwag/widgets/hospital_list_tile.dart';

class PetHospitals extends StatelessWidget {
  const PetHospitals({super.key});

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
      body: Consumer<AdminController>(builder: (context, adminController, _) {
        return FutureBuilder(
            future: adminController.fetchHospitals(),
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
                  itemCount: adminController.hospitalsList.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemBuilder: (context, index) {
                    return HospitalListTile(
                      hospitalTitle:
                          adminController.hospitalsList[index].hospitalName,
                      hospitalLocation:
                          adminController.hospitalsList[index].hospitalLocation,
                      rating:
                          adminController.hospitalsList[index].hospitalRating!,
                      imageURL:
                          adminController.hospitalsList[index].hospitalPhoto,
                    );
                    // return ListTile(
                    //   leading: Container(
                    //     height: 50,
                    //     width: 50,
                    //     decoration: BoxDecoration(
                    //       color: color3,
                    //       image: DecorationImage(
                    //         image: AdminController
                    //                     .hospitalsList[index].hospitalPhoto !=
                    //                 ""
                    //             ? NetworkImage(AdminController
                    //                 .hospitalsList[index].hospitalPhoto)
                    //             : const AssetImage(
                    //                     'assets/images/hospital_default_dp.jpg')
                    //                 as ImageProvider<Object>,
                    //         fit: BoxFit.cover,
                    //       ),
                    //     ),
                    //   ),
                    //   title: Text(
                    //       AdminController.hospitalsList[index].hospitalName),
                    // );
                  },
                ),
              );
            });
      }),
    );
  }
}
