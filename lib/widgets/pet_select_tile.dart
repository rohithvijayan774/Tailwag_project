import 'package:flutter/material.dart';

class PetSelectTile extends StatelessWidget {
  final double width;
  final String imageURL;
  final String title;
  final Function onPress;
  const PetSelectTile({
    super.key,
    required this.width,
    required this.imageURL,
    required this.title,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress();
      },
      child: Container(
        height: 100,
        width: width / 2.8,
        decoration: BoxDecoration(
          color: const Color(0xFF6E8F7A),
          image:
              DecorationImage(image: AssetImage(imageURL), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: 30,
                width: width / 2.8,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontFamily: 'AbhayaLibre_regular',
                          color: Colors.white,
                          fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
