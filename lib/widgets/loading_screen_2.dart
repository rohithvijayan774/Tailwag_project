import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/sitter_controller.dart';
import 'package:tailwag/views/sitter_main_profile.dart';

class LoadingScreen2 extends StatelessWidget {
  const LoadingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SitterController>(context, listen: false);
    return Scaffold(
      backgroundColor: color1,
      body: FutureBuilder(
          future: provider
              .fetchSitterData()
              .then((value) => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const SitterMainProfile(),
                  ),
                  (route) => false)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: color2,
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 10,
                color: Colors.black,
              ),
            );
          }),
    );
  }
}
