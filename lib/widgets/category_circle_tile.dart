import 'package:flutter/material.dart';
import 'package:tailwag/const.dart';

class CategoryCircleTile extends StatelessWidget {
  final double width;
  final Function onPressed;
  final String title;
  final String imageURL;
  const CategoryCircleTile({
    super.key,
    required this.width,
    required this.onPressed,
    required this.title,
    required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            onPressed();
          },
          icon: CircleAvatar(
            backgroundColor: const Color(0xFF84AC9D),
            backgroundImage: AssetImage(imageURL),
            radius: width * 0.08,
          ),
        ),
        SizedBox(
          height: 50,
          child: Text(
            title,
            style: const TextStyle(
                fontFamily: 'SofiaPro',
                fontWeight: FontWeight.bold,
                color: color2),
          ),
        )
      ],
    );
  }
}
