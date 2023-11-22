import 'package:flutter/material.dart';
import 'package:tailwag/const.dart';

class ProfilePetData extends StatelessWidget {
  final String title;
  const ProfilePetData({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 70,
      decoration: BoxDecoration(
        color: color3,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              fontFamily: 'SofiaPro',
              color: color2,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
