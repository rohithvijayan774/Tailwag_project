import 'package:flutter/material.dart';
import 'package:tailwag/const.dart';

class FoodProductTile extends StatelessWidget {
  final String title;
  final String imageURL;

  const FoodProductTile({
    super.key,
    required this.title,
    required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 90,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: 50,
              width: 85,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [color3, color2],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(10),
                  color: color3),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              imageURL,
              scale: 1.2,
            ),
          ),
          Positioned(
            left: 0,
            top: 35,
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                title,
                style: const TextStyle(
                    fontFamily: 'AbhayaLibre_regular', color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
