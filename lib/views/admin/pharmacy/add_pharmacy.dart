import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/admin_controller.dart';
import 'package:tailwag/widgets/image_pick_tile.dart';

class AddPharmacy extends StatelessWidget {
  const AddPharmacy({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Add Pharmacy',
          style:
              TextStyle(color: color2, fontFamily: 'AbhayaLibre', fontSize: 30),
        ),
        backgroundColor: color1,
      ),
      body: Consumer<AdminController>(
        builder: (context, pharmacyAddController, _) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: SingleChildScrollView(
              child: Form(
                key: pharmacyAddController.pharmacyAddKey,
                child: Column(
                  children: [
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      controller: pharmacyAddController.pharmacyNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*this field is required';
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        // filled: true,
                        fillColor: color1,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(color: color2),
                        ),
                        hintStyle: TextStyle(
                          color: color2,
                          fontFamily: 'AbhayaLibre_regular',
                          fontWeight: FontWeight.w600,
                        ),
                        hintText: 'Pharmacy Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(color: color2),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      maxLines: 3,
                      textCapitalization: TextCapitalization.words,
                      controller:
                          pharmacyAddController.pharmacyDetailsController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*this field is required';
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        // filled: true,
                        fillColor: color1,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(color: color2),
                        ),
                        hintStyle: TextStyle(
                          color: color2,
                          fontFamily: 'AbhayaLibre_regular',
                          fontWeight: FontWeight.w600,
                        ),
                        hintText: 'Pharmacy Details',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(color: color2),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ImagePickTile(
                      onPressed: () {
                        pharmacyAddController.selectPharmacyPic(context);
                      },
                      subtitile: pharmacyAddController.pharmacyPic == null
                          ? 'Nothing Selected'
                          : pharmacyAddController.pharmacyPic.toString(),
                      title: 'Pharmacy Photo',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      controller:
                          pharmacyAddController.pharmacyLocationController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*this field is required';
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        // filled: true,
                        fillColor: color1,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(color: color2),
                        ),
                        hintStyle: TextStyle(
                          color: color2,
                          fontFamily: 'AbhayaLibre_regular',
                          fontWeight: FontWeight.w600,
                        ),
                        hintText: 'Pharmacy Location',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(color: color2),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      controller:
                          pharmacyAddController.pharmacyMedicineController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*this field is required';
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        // filled: true,
                        fillColor: color1,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(color: color2),
                        ),
                        hintStyle: TextStyle(
                          color: color2,
                          fontFamily: 'AbhayaLibre_regular',
                          fontWeight: FontWeight.w600,
                        ),
                        hintText: 'Pharmacy Medicines',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(color: color2),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: width * 0.7,
                      height: 45,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          overlayColor: MaterialStatePropertyAll(color3),
                          backgroundColor: MaterialStatePropertyAll(color2),
                        ),
                        onPressed: () async {
                          if (pharmacyAddController.pharmacyAddKey.currentState!
                              .validate()) {
                            await pharmacyAddController.savePharmacy(
                              pharmacyAddController.pharmacyNameController.text,
                              pharmacyAddController
                                  .pharmacyLocationController.text,
                              pharmacyAddController
                                  .pharmacyDetailsController.text,
                              pharmacyAddController
                                  .pharmacyMedicineController.text,
                            );
                            pharmacyAddController.uploadPharmacyPhoto(
                                pharmacyAddController.pharmacyPic!,
                                pharmacyAddController
                                    .pharmacyNameController.text);
                            pharmacyAddController.clearPharmacyFields();
                            Navigator.of(context).pop();
                          }
                        },
                        child: const Text(
                          'Add',
                          style: TextStyle(
                              fontFamily: 'AbhayaLibre_regular',
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
