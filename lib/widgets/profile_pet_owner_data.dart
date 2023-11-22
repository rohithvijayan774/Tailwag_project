import 'package:flutter/material.dart';
import 'package:tailwag/const.dart';

class ProfilePetUserData extends StatelessWidget {
  final double width;
  final String imageURL;
  final String ownerName;
  final String ownerEmail;
  const ProfilePetUserData({
    super.key,
    required this.width,
    required this.imageURL,
    required this.ownerName,
    required this.ownerEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      decoration:
          BoxDecoration(color: color3, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: color2,
              child: Icon(
                Icons.person_outline_outlined,
                color: color1,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ownerName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'AbhayaLibre',
                    fontSize: 20,
                  ),
                ),
                Text(
                  ownerEmail,
                  style: const TextStyle(
                    color: color2,
                    fontFamily: 'SofiaPro',
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit_outlined,
                color: color2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
