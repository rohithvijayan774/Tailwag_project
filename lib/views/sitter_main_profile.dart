import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/bottomnavbar_controller.dart';
import 'package:tailwag/controller/sitter_controller.dart';
import 'package:tailwag/widgets/category_circle_tile.dart';

class SitterMainProfile extends StatelessWidget {
  const SitterMainProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final bottomProvider = Provider.of<BottomNavBarController>(context);
    // final sitterProvider = Provider.of<SitterController>(context, listen: false);
    return Scaffold(
      backgroundColor: color1,
      body: Consumer<SitterController>(builder: (context, sitterProvider, _) {
        return Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    width: width,
                    height: height / 3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: sitterProvider.sitterModel.sitterCoverPic ==
                                  null
                              ? const AssetImage(
                                  'assets/images/sitter_coverpic.jpg')
                              : NetworkImage(sitterProvider.sitterModel
                                  .sitterCoverPic!) as ImageProvider<Object>,
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
                    height: height / 3.5,
                    decoration: const BoxDecoration(color: color1),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Column(
                        children: [
                          Text(
                            sitterProvider.sitterModel.sitterName,
                            style: const TextStyle(
                                fontFamily: 'SofiaPro',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: color2),
                          ),
                          Text(
                            sitterProvider.sitterModel.sitterPlace,
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
                                sitterProvider.sitterModel.sitterRating
                                    .toString(),
                                style: const TextStyle(
                                    fontFamily: 'SofiaPro',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          Text(
                            sitterProvider.sitterModel.sitterTitle,
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
                                onPressed: () {},
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
                                onPressed: () {},
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
                                sitterProvider.sitterModel.sitterDetails,
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
                                    imageURL:
                                        'assets/images/house_sitting.png'),
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
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: sitterProvider.sitterModel.sitterProPic ==
                            null
                        ? const AssetImage(
                            'assets/images/sitter_default_propic.jpg')
                        : NetworkImage(sitterProvider.sitterModel.sitterProPic!)
                            as ImageProvider<Object>,
                    radius: 50,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: () async {
                        await sitterProvider.selectProPic(context).then(
                            (value) => sitterProvider
                                .uploadProPic(sitterProvider.proPic!));
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: height / 15,
              child: IconButton(
                onPressed: () async {
                  await sitterProvider.selectCoverPic(context).then((value) =>
                      sitterProvider.uploadCoverPic(sitterProvider.coverPic!));
                },
                icon: const Icon(
                  Icons.edit,
                ),
              ),
            ),
            Positioned(
              top: height / 15,
              right: 10,
              child: Consumer<BottomNavBarController>(
                  builder: (context, bottomProvider, _) {
                return IconButton(
                  onPressed: () {
                    sitterProvider.signOut(context);
                    bottomProvider.currentIndex = 2;
                  },
                  icon: const Icon(
                    Icons.logout_outlined,
                  ),
                );
              }),
            ),
          ],
        );
      }),
    );
  }
}
