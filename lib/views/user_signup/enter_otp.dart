import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/views/user_signup/user_login.dart';

class EnterOTP extends StatelessWidget {
  final String userNumber;
  const EnterOTP({super.key, required this.userNumber});

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: color1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: color2,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Tailwag',
          style: TextStyle(fontFamily: 'Katibeh', fontSize: 50, color: color2),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Verification code',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'We have sent the code verification to',
                style: TextStyle(
                  fontFamily: 'SofiaPro',
                  fontSize: 15,
                ),
              ),
              Row(
                children: [
                  const Text(
                    'your number ',
                    style: TextStyle(
                      fontFamily: 'SofiaPro',
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    userNumber,
                    style: const TextStyle(
                      fontFamily: 'SofiaPro',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Pinput(
                      length: 4,
                      autofocus: true,
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      '00:00',
                      style: TextStyle(fontSize: 20, fontFamily: 'SofiaPro'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: width,
                      height: 50,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          overlayColor: MaterialStatePropertyAll(color3),
                          backgroundColor: MaterialStatePropertyAll(color2),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const UserLogin(),
                          ));
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                              fontFamily: 'SofiaPro',
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Didn't recieve the code?",
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'SofiaPro',
                              fontSize: 15),
                        ),
                        TextButton(
                          style: const ButtonStyle(
                              overlayColor: MaterialStatePropertyAll(color3)),
                          onPressed: () {},
                          child: const Text(
                            'Resend',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'SofiaPro',
                                fontSize: 17),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      // bottomSheet: DraggableScrollableSheet(
      //   initialChildSize: 0.1,
      //   minChildSize: 0.1,
      //   maxChildSize: 1.0,
      //   expand: false,
      //   builder: (context, scrollController) {
      //     return Container();
      //   },
      // ),
    );
  }
}
