import 'package:flutter/material.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/views/on_boarding/onboarding_2.dart';

class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: color1,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width,
            height: height / 1.7,
            decoration: const BoxDecoration(
              // color: Colors.grey,
              image: DecorationImage(
                image: AssetImage('assets/images/onboard3.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: height,
              width: width,
              // color: Colors.grey,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Text(
                          'From paws to',
                          style: TextStyle(
                              fontSize: 45,
                              color: color2,
                              fontFamily: 'AbhayaLibre'),
                        ),
                        Text(
                          'paradise!',
                          style: TextStyle(
                              fontSize: 45,
                              color: color2,
                              fontFamily: 'AbhayaLibre'),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Text(
                          "Easily locate and explore",
                          style: TextStyle(
                              fontSize: 23, fontFamily: 'AbhayaLibre_regular'),
                        ),
                        Text(
                          "neighborhood pet shops and",
                          style: TextStyle(
                              fontSize: 23, fontFamily: 'AbhayaLibre_regular'),
                        ),
                        Text(
                          "discover exclusive deals.",
                          style: TextStyle(
                              fontSize: 23, fontFamily: 'AbhayaLibre_regular'),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: CircleAvatar(
                                backgroundColor: color2,
                                radius: 3,
                                child: CircleAvatar(
                                  radius: 2,
                                  backgroundColor: color1,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                height: 5,
                                width: 15,
                                decoration: BoxDecoration(
                                    color: color2,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: CircleAvatar(
                                backgroundColor: color2,
                                radius: 3,
                                child: CircleAvatar(
                                  radius: 2,
                                  backgroundColor: color1,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: CircleAvatar(
                                backgroundColor: color2,
                                radius: 3,
                                child: CircleAvatar(
                                  radius: 2,
                                  backgroundColor: color1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          color: color2,
                          onPressed: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        FadeTransition(
                                  opacity: animation,
                                  child: const OnBoarding2(),
                                ),
                              ),
                            );
                          },
                          icon: const CircleAvatar(
                            radius: 25,
                            backgroundColor: color2,
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
