import 'package:flutter/material.dart';
import 'package:tailwag/const.dart';

// ignore: must_be_immutable
class ImagePickTile extends StatelessWidget {
  String title;
  String subtitile;
  VoidCallback onPressed;
  ImagePickTile(
      {required this.title,
      required this.subtitile,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Image.asset(
        'assets/images/docs.png',
        scale: 20,
      ),
      title: Text(
        title,
        style: const TextStyle(
            color: color2,
            fontFamily: 'AbhayaLibre_regular',
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitile,
        style: const TextStyle(
            color: Colors.grey, fontFamily: 'AbhayaLibre_regular'),
      ),
    );
  }
}
