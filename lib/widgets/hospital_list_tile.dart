import 'package:flutter/material.dart';
import 'package:tailwag/const.dart';

class HospitalListTile extends StatelessWidget {
  final String shopTitle;
  final String shopLocation;
  final double rating;
  final String? imageURL;
  const HospitalListTile(
      {super.key,
      required this.shopTitle,
      required this.shopLocation,
      required this.rating,
      required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: color2,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: imageURL != null
                    ? const AssetImage('assets/images/hospital_default_dp.jpg')
                    : imageURL as ImageProvider<Object>,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shopTitle,
                  style: const TextStyle(
                      fontSize: 20,
                      color: color2,
                      fontFamily: 'SofiaPro',
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  shopLocation,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontFamily: 'SofiaPro',
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 25,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '$rating',
                      style: const TextStyle(
                          fontFamily: 'SofiaPro',
                          fontSize: 20,
                          color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
