import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/controller.dart';
import 'package:tailwag/controller/sitter_controller.dart';
import 'package:tailwag/widgets/category_circle_tile.dart';

class SitterProfile extends StatelessWidget {
  final String? proPicURL;
  final String sitterName;
  final String sitterPlace;
  final String sitterTitle;
  final String sitterDetails;
  final String? sitterCoverPic;
  final double sitterRating;
  const SitterProfile({
    super.key,
    this.proPicURL,
    required this.sitterName,
    required this.sitterPlace,
    required this.sitterTitle,
    required this.sitterDetails,
    this.sitterCoverPic,
    required this.sitterRating,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: color1,
      body: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  width: width,
                  height: height / 3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: sitterCoverPic == 'null'
                            ? const AssetImage(
                                'assets/images/sitter_coverpic.jpg')
                            : NetworkImage(sitterCoverPic!)
                                as ImageProvider<Object>,
                        fit: BoxFit.cover),
                    color: color2,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.elliptical(200, 100),
                      bottomRight: Radius.elliptical(200, 100),
                    ),
                  ),
                ),
                Container(
                  width: width,
                  height: height / 3,
                  decoration: const BoxDecoration(color: color1),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        Text(
                          sitterName,
                          style: const TextStyle(
                              fontFamily: 'SofiaPro',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: color2),
                        ),
                        Text(
                          sitterPlace,
                          style: const TextStyle(
                              fontFamily: 'SofiaPro',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.grey),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Text(
                              sitterRating.toString(),
                              style: const TextStyle(
                                  fontFamily: 'SofiaPro',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.grey),
                            ),
                            const VerticalDivider(
                              width: 10,
                              color: Colors.grey,
                              thickness: 5,
                              endIndent: 10,
                              indent: 10,
                            ),
                          ],
                        ),
                        Text(
                          sitterTitle,
                          style: const TextStyle(
                              fontFamily: 'SofiaPro',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: color2),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton.icon(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.white)),
                              onPressed: () async {
                                PermissionStatus phonePermission =
                                    await Permission.phone.request();
                                if (phonePermission ==
                                    PermissionStatus.granted) {}
                              },
                              icon: const Icon(
                                Icons.call_outlined,
                                color: color2,
                              ),
                              label: const Text(
                                'Call',
                                style: TextStyle(
                                    fontFamily: 'SofiaPro',
                                    color: color2,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            ElevatedButton.icon(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.white)),
                              onPressed: () async {
                                PermissionStatus smsPermission =
                                    await Permission.sms.request();
                                if (smsPermission ==
                                    PermissionStatus.granted) {}
                              },
                              icon: const Icon(
                                Icons.message_outlined,
                                color: color2,
                              ),
                              label: const Text(
                                'Message',
                                style: TextStyle(
                                    fontFamily: 'SofiaPro',
                                    color: color2,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        Consumer<SitterController>(
                          builder: (context, sitterRatingController, _) {
                            return RatingBar.builder(
                              minRating: 0,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                sitterRatingController.ratingUpdate(rating);
                                print(sitterRatingController.rating);
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Details',
                                style: TextStyle(
                                    fontFamily: 'SofiaPro',
                                    color: color2,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            child: Text(
                              sitterDetails,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: color2),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CategoryCircleTile(
                                  width: width,
                                  onPressed: () {},
                                  title: 'Pet Walking',
                                  imageURL: 'assets/images/Pet_walking.png'),
                              CategoryCircleTile(
                                  width: width,
                                  onPressed: () {},
                                  title: 'Day Care',
                                  imageURL: 'assets/images/day_care.png'),
                              CategoryCircleTile(
                                  width: width,
                                  onPressed: () {},
                                  title: 'House Sitting',
                                  imageURL: 'assets/images/house_sitting.png'),
                              CategoryCircleTile(
                                  width: width,
                                  onPressed: () {},
                                  title: 'Feeding',
                                  imageURL: 'assets/images/feeding.png'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: height / 4,
            left: width / 3,
            child: CircleAvatar(
              backgroundImage: proPicURL == 'null'
                  ? const AssetImage('assets/images/sitter_default_propic.jpg')
                  : NetworkImage(proPicURL!) as ImageProvider<Object>,
              radius: 50,
            ),
          ),
          Positioned(
            top: height / 15,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_sharp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
