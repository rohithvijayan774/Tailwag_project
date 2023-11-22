import 'package:flutter/material.dart';
import 'package:tailwag/const.dart';

class AboutMyPet extends StatelessWidget {
  final double width;
  final String description;
  const AboutMyPet({super.key, required this.width, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 100,
      decoration: BoxDecoration(
        color: color3,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          description,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontFamily: 'SofiaPro'),
        ),
      ),
    );
  }
}
