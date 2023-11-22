import 'package:flutter/material.dart';

class ShopByBrandTile extends StatelessWidget {
  final String title;
  final String imageURL;
  final Color tileBG;
  final Function onPress;
  final double imgBottomPostn;
  final double imgleftPostn;

  const ShopByBrandTile({
    super.key,
    required this.title,
    required this.imageURL,
    required this.tileBG,
    required this.onPress,
    required this.imgBottomPostn,
    required this.imgleftPostn,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Column(
        children: [
          SizedBox(
            height: 90,
            width: 90,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 80,
                    width: 85,
                    decoration: BoxDecoration(
                      color: tileBG,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Positioned(
                  bottom: imgBottomPostn,
                  left: imgleftPostn,
                  child: Image.asset(
                    imageURL,
                    scale: 1,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'SofiaPro',
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
