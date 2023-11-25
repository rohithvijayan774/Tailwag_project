import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/admin_controller.dart';
import 'package:tailwag/widgets/image_pick_tile.dart';

class AddHospital extends StatelessWidget {
  const AddHospital({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Add Hospital',
          style:
              TextStyle(color: color2, fontFamily: 'AbhayaLibre', fontSize: 30),
        ),
        backgroundColor: color1,
      ),
      body: Consumer<AdminController>(
        builder: (context, hospitalAddController, _) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: SingleChildScrollView(
              child: Form(
                key: hospitalAddController.hospitalAddKey,
                child: Column(
                  children: [
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      controller: hospitalAddController.hospitalNameController,
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
                        hintText: 'Hospital Name',
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
                          hospitalAddController.hospitalDetailsController,
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
                        hintText: 'Hospital Details',
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
                        hospitalAddController.selecthospitalPic(context);
                      },
                      subtitile: hospitalAddController.hospitalPic == null
                          ? 'Nothing Selected'
                          : hospitalAddController.hospitalPic.toString(),
                      title: 'Hospital Photo',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      controller:
                          hospitalAddController.hospitalLocationController,
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
                        hintText: 'Hospital Location',
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
                          if (hospitalAddController.hospitalAddKey.currentState!
                              .validate()) {
                            await hospitalAddController.saveHospital(
                              hospitalAddController.hospitalNameController.text,
                              hospitalAddController
                                  .hospitalLocationController.text,
                              hospitalAddController
                                  .hospitalDetailsController.text,
                            );
                            hospitalAddController.uploadHospitalPhoto(
                              hospitalAddController.hospitalPic!,
                              hospitalAddController.hospitalNameController.text,
                            );
                            hospitalAddController.clearFields();
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
