import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/admin_bottom_navbar.dart';
import 'package:tailwag/controller/admin_controller.dart';
import 'package:tailwag/views/admin/hospital/admin_hospitals.dart';

class AdminLogin extends StatelessWidget {
  const AdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: color1,
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: height / 2.7,
                    width: width,
                    decoration: const BoxDecoration(color: color1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/pup.png',
                          scale: width / 270,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.1, right: 20),
                        child: Image.asset('assets/images/logo_brown.png'),
                      ),
                    ],
                  )
                ],
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(color: color1),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: height / 1.5,
              width: width,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 15,
                    offset: Offset(2, 0),
                  )
                ],
                gradient: LinearGradient(
                    colors: [color3, color1],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                  child: Consumer<AdminController>(
                    builder: (context, adminProvider, _) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Form(
                          key: adminProvider.adminLoginFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Admin Login',
                                style: TextStyle(
                                    fontFamily: 'Katibeh',
                                    fontSize: 50,
                                    color: color2),
                              ),
                              // const Text(
                              //   'Happy to see you again!!',
                              //   style: TextStyle(
                              //       fontFamily: 'Katibeh',
                              //       fontSize: 25,
                              //       color: color2),
                              // ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller:
                                    adminProvider.adminUsernameController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '*this field is required';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: const InputDecoration(
                                  filled: true,
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
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller:
                                    adminProvider.adminPasswordController,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '*this field is required';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: const InputDecoration(
                                  filled: true,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    style: const ButtonStyle(
                                        overlayColor:
                                            MaterialStatePropertyAll(color3)),
                                    onPressed: () {},
                                    child: const Text(
                                      'Forgot password?',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'AbhayaLibre',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: width * 0.7,
                                height: 45,
                                child: ElevatedButton(
                                  style: const ButtonStyle(
                                    overlayColor:
                                        MaterialStatePropertyAll(color3),
                                    backgroundColor:
                                        MaterialStatePropertyAll(color2),
                                  ),
                                  onPressed: () {
                                    if (adminProvider
                                        .adminLoginFormKey.currentState!
                                        .validate()) {
                                      if (adminProvider.adminID ==
                                              adminProvider
                                                  .adminUsernameController
                                                  .text &&
                                          adminProvider.adminPassword ==
                                              adminProvider
                                                  .adminPasswordController
                                                  .text) {
                                        adminProvider.setAdminSignIn().then(
                                              (value) => Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const AdminBottomNavBar(),
                                                      ),
                                                      (route) => false),
                                            );
                                      }
                                    }
                                  },
                                  child: const Text(
                                    'Log in',
                                    style: TextStyle(
                                        fontFamily: 'AbhayaLibre_regular',
                                        color: Colors.white,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              // const SizedBox(
                              //   height: 20,
                              // ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     const Text(
                              //       "Don't have an account?",
                              //       style: TextStyle(
                              //           color: Colors.white,
                              //           fontFamily: 'AbhayaLibre_regular',
                              //           fontSize: 15),
                              //     ),
                              //     TextButton(
                              //       style: const ButtonStyle(
                              //           overlayColor:
                              //               MaterialStatePropertyAll(color3)),
                              //       onPressed: () {
                              //         Navigator.of(context).pop();
                              //       },
                              //       child: const Text(
                              //         'Create Account',
                              //         style: TextStyle(
                              //             color: color2,
                              //             fontFamily: 'AbhayaLibre',
                              //             fontSize: 17),
                              //       ),
                              //     )
                              //   ],
                              // )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
