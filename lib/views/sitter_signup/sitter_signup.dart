import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/controller.dart';
import 'package:tailwag/controller/sitter_controller.dart';
import 'package:tailwag/views/sitter_signup/sitter_login.dart';

class SitterSignup extends StatelessWidget {
  const SitterSignup({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final userController = Provider.of<Controller>(context, listen: false);
    return Scaffold(
      backgroundColor: color1,
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
        child: Column(
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
                  ),
                ),
                Image.asset(
                  'assets/images/logo_brown.png',
                  scale: 2,
                ),
                const SizedBox(
                  height: 20,
                  width: 50,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Consumer<SitterController>(
                builder: (context, controller, _) {
                  return SingleChildScrollView(
                    child: Form(
                      key: controller.sitterSignUpFormKEy,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Stack(
                            children: [
                              const CircleAvatar(
                                // backgroundImage: AssetImage(proPicURL),
                                radius: 50,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: IconButton(
                                  onPressed: () {
                                    controller.selectProPic(context);
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            textCapitalization: TextCapitalization.words,
                            controller: controller.sitterNameController,
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
                              hintText: 'Name',
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
                            controller: controller.sitterPlaceController,
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
                              hintText: 'Place',
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
                                  controller: controller.sitterPhoneController,
                                  keyboardType: TextInputType.phone,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '*this field is required';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          userController.showCountries(context);
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${userController.selectedCountry.flagEmoji} + ${userController.selectedCountry.phoneCode}",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: color1,
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      borderSide: BorderSide(color: color2),
                                    ),
                                    hintStyle: const TextStyle(
                                      color: color2,
                                      fontFamily: 'AbhayaLibre_regular',
                                      fontWeight: FontWeight.w600,
                                    ),
                                    hintText: 'Phone',
                                    border: const OutlineInputBorder(
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
                                  controller: controller.sitterEmailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '*this field is required';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    prefixIcon:
                                        Icon(Icons.mail_outline_rounded),
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
                                    hintText: 'Email',
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
                            controller: controller.sitterPasswordController,
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
                              hintText: 'Password',
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
                            controller:
                                controller.sitterConfirmPasswordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '*this field is required';
                              } else if (value !=
                                  controller.sitterPasswordController.text) {
                                return 'Password didnot match';
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
                              hintText: 'Confirm Password',
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
                            controller: controller.sitterTitleController,
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
                              hintText: 'Title',
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
                            textCapitalization: TextCapitalization.sentences,
                            controller: controller.sitterDetailsController,
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
                              hintText: 'Details',
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
                          SizedBox(
                            width: width * 0.7,
                            height: 45,
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                overlayColor: MaterialStatePropertyAll(color3),
                                backgroundColor:
                                    MaterialStatePropertyAll(color2),
                              ),
                              onPressed: () async {
                                if (controller.sitterSignUpFormKEy.currentState!
                                    .validate()) {
                                  await controller.signUpSitter(
                                      controller.sitterNameController.text,
                                      controller.sitterPlaceController.text,
                                      controller.sitterPhoneController.text,
                                      controller.sitterEmailController.text,
                                      controller.sitterTitleController.text,
                                      controller.sitterDetailsController.text,
                                      controller.sitterPasswordController.text,
                                      context);
                                  await controller
                                      .uploadProPic(controller.proPic!);
                                }
                              },
                              child: const Text(
                                'Sign up',
                                style: TextStyle(
                                    fontFamily: 'AbhayaLibre_regular',
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account?',
                                style: TextStyle(
                                    color: color3,
                                    fontFamily: 'AbhayaLibre_regular',
                                    fontSize: 15),
                              ),
                              TextButton(
                                style: const ButtonStyle(
                                    overlayColor:
                                        MaterialStatePropertyAll(color3)),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const SitterLogin(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      color: color2,
                                      fontFamily: 'AbhayaLibre',
                                      fontSize: 17),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
