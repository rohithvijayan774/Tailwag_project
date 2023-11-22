import 'package:flutter/material.dart';
import 'package:tailwag/const.dart';

class TopPickTile extends StatelessWidget {
  final Function onPress;
  final String imageURL;
  final double width;
  final String title;
  final String description;
  final double price;
  const TopPickTile(
      {super.key,
      required this.onPress,
      required this.imageURL,
      required this.width,
      required this.title,
      required this.description,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: width / 3,
            width: 95,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [color2, color3],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              color: color2,
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                  image: AssetImage('assets/images/top_pick_bg.png'),
                  fit: BoxFit.cover),
            ),
            child: Center(
              child: Image.asset(imageURL),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 95,
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'SofiaPro',
                color: color2,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 95,
            child: Text(
              description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.grey, fontFamily: 'SofiaPro', fontSize: 10),
            ),
          ),
          Text(
            '₹$price',
            style: const TextStyle(
              fontFamily: 'SofiaPro',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
