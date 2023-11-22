import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/controller.dart';
import 'package:tailwag/widgets/bottomnavbar.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Controller>(context, listen: false);
    return Scaffold(
      backgroundColor: color1,
      body: FutureBuilder(
          future: provider
              .getDataFromFirestore()
              .then((value) => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const BottomNavBar(),
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
