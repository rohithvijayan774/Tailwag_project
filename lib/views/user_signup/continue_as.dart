import 'package:flutter/material.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/views/sitter_signup/sitter_signup.dart';
import 'package:tailwag/views/user_signup/user_signup.dart';

class ContinueAs extends StatelessWidget {
  const ContinueAs({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: color1,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "You're ?",
              style: TextStyle(
                  fontFamily: 'AbhayaLibre', color: color2, fontSize: 25),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: width / 2,
              child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(color2)),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const UserSignup(),
                    ),
                  );
                },
                child: const Text(
                  'Pet Owner',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'AbhayaLibre',
                      fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: width / 2,
              child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(color2)),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SitterSignup(),
                    ),
                  );
                },
                child: const Text(
                  'Sitter',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'AbhayaLibre',
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
