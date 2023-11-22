import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/controller.dart';
import 'package:tailwag/views/user_signup/user_login.dart';

class UserSignup extends StatelessWidget {
  const UserSignup({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final controller = Provider.of<Controller>(context, listen: false);
    return Scaffold(
      backgroundColor: color1,
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: height / 3,
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
              height: height / 1.4,
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
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Consumer<Controller>(
                      builder: (context, provider, _) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Form(
                            key: provider.userSignUpFormKEy,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Start with us !',
                                  style: TextStyle(
                                      fontFamily: 'Katibeh',
                                      fontSize: 50,
                                      color: color2),
                                ),
                                TextFormField(
                                  controller: provider.userNameController,
                                  textCapitalization: TextCapitalization.words,
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
                                    hintText: 'Username',
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
                                  controller: provider.userEmailController,
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
                                  controller: provider.userNumberController,
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
                                          provider.showCountries(context);
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${provider.selectedCountry.flagEmoji} + ${provider.selectedCountry.phoneCode}",
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
                                    hintText: 'Phonenumber',
                                    border: const OutlineInputBorder(
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
                                  controller: provider.userPasswordController,
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
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller:
                                      provider.userConfirmPasswordController,
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '*this field is required';
                                    } else if (value !=
                                        provider.userPasswordController.text) {
                                      return 'Password didnot match';
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
                                    hintText: 'Confirm password',
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
                                      overlayColor:
                                          MaterialStatePropertyAll(color3),
                                      backgroundColor:
                                          MaterialStatePropertyAll(color2),
                                    ),
                                    onPressed: () {
                                      if (provider
                                          .userSignUpFormKEy.currentState!
                                          .validate()) {
                                        provider.signUpUser(
                                          provider.userNameController.text,
                                          provider.userEmailController.text,
                                          '+${provider.selectedCountry.phoneCode}${provider.userNumberController.text}',
                                          provider.userPasswordController.text,
                                          context,
                                        );
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
                                          color: Colors.white,
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
                                            builder: (context) =>
                                                const UserLogin(),
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
