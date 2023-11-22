import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/controller.dart';

class PetDetails extends StatelessWidget {
  const PetDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final provider = Provider.of<Controller>(context, listen: false);
    return Scaffold(
      backgroundColor: color1,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: height / 1.7,
                width: width,
                decoration: const BoxDecoration(
                  color: color3,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(100, 50),
                    bottomRight: Radius.elliptical(100, 50),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: height,
                  width: width,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
            child: SingleChildScrollView(
              child: Consumer<Controller>(builder: (context, petProvider, _) {
                return Form(
                  key: petProvider.petDetailsFormKEy,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage('assets/images/profile_pic.png'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: petProvider.petNameController,
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
                          hintText: 'Pet name',
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
                        controller: petProvider.breedNameController,
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
                          hintText: 'Breed name',
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
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: petProvider.petSexController,
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
                                hintText: 'Sex',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide(color: color2),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: petProvider.petAgeController,
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
                                hintText: 'Age',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide(color: color2),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: petProvider.petWeightController,
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
                                hintText: 'KG',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide(color: color2),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: petProvider.aboutMyPetController,
                        maxLines: 5,
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
                          hintText: 'About my pet',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            borderSide: BorderSide(color: color2),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: const ButtonStyle(
                          overlayColor: MaterialStatePropertyAll(color3),
                          backgroundColor: MaterialStatePropertyAll(color2),
                        ),
                        onPressed: () {
                          if (petProvider.petDetailsFormKEy.currentState!
                              .validate()) {
                            petProvider
                                .updatePetDetails(
                                    petProvider.petNameController.text,
                                    petProvider.breedNameController.text,
                                    petProvider.petSexController.text,
                                    petProvider.petAgeController.text,
                                    petProvider.petWeightController.text,
                                    petProvider.aboutMyPetController.text)
                                .then((value) => petProvider
                                    .getDataFromFirestore()
                                    .then((value) =>
                                        Navigator.of(context).pop()));
                          }
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(
                              fontFamily: 'AbhayaLibre_regular',
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: width,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new_sharp,
                            color: color2,
                          ),
                        ),
                        Image.asset(
                          'assets/images/logo_brown.png',
                          scale: 2,
                        ),
                        IconButton(
                          onPressed: () {
                            // provider.signOut(context);
                            // bottomProvider.currentIndex = 2;
                          },
                          icon: const Icon(
                            Icons.settings_outlined,
                            color: color2,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
