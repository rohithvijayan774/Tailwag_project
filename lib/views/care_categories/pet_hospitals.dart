import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/hospital_controller.dart';

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
      body: Consumer<HospitalController>(
          builder: (context, hospitalController, _) {
        return FutureBuilder(
            future: hospitalController.fetchHospitals(),
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
                  itemCount: hospitalController.hospitalsList.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: color3,
                          image: DecorationImage(
                            image: hospitalController
                                        .hospitalsList[index].hospitalPhoto !=
                                    ""
                                ? NetworkImage(hospitalController
                                    .hospitalsList[index].hospitalPhoto)
                                : const AssetImage(
                                        'assets/images/hospital_default_dp.jpg')
                                    as ImageProvider<Object>,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                          hospitalController.hospitalsList[index].hospitalName),
                    );
                  },
                ),
              );
            });
      }),
    );
  }
}
