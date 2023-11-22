import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/controller.dart';
import 'package:tailwag/views/sitter_profile.dart';

class Sitters extends StatelessWidget {
  const Sitters({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final sitterPageProvider = Provider.of<Controller>(context, listen: false);
    return Scaffold(
      backgroundColor: color1,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: FutureBuilder(
          future: sitterPageProvider.fetchSitters(),
          builder: (context, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return Column(
                children: [
                  SizedBox(
                    width: width,
                    height: height / 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_new_sharp,
                              ),
                            ),
                            Image.asset(
                              'assets/images/logo_brown.png',
                              scale: 2,
                            ),
                            CircleAvatar(
                              backgroundImage:
                                  sitterPageProvider.userModel.petPic == null
                                      ? const AssetImage(
                                          'assets/images/profile_pic.png')
                                      : NetworkImage(sitterPageProvider
                                          .userModel
                                          .petPic!) as ImageProvider<Object>,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const CupertinoSearchTextField(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          backgroundColor: Colors.white,
                          placeholder: 'Search shop, sitters or etc',
                          placeholderStyle:
                              TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                      child: Center(
                    child: CircularProgressIndicator(
                        strokeWidth: 3, color: color2),
                  )),
                ],
              );
            }

            return Column(
              children: [
                SizedBox(
                  width: width,
                  height: height / 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new_sharp,
                            ),
                          ),
                          Image.asset(
                            'assets/images/logo_brown.png',
                            scale: 2,
                          ),
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/profile_pic.png'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CupertinoSearchTextField(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        backgroundColor: Colors.white,
                        placeholder: 'Search shop, sitters or etc',
                        placeholderStyle:
                            TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Consumer<Controller>(
                  builder: (context, sitterPageController, _) {
                    return Expanded(
                      child: sitterPageController.sittersList.isEmpty
                          ? const Center(
                              child: Text(
                                'No sitters found!!!',
                                style: TextStyle(
                                    color: color2,
                                    fontFamily: 'SofiaPro',
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 20,
                              ),
                              itemCount:
                                  sitterPageController.sittersList.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            FadeTransition(
                                          opacity: animation,
                                          child: SitterProfile(
                                            proPicURL: sitterPageController
                                                .sittersList[index]
                                                .sitterProPic,
                                            sitterName: sitterPageController
                                                .sittersList[index].sitterName,
                                            sitterPlace: sitterPageController
                                                .sittersList[index].sitterPlace,
                                            sitterTitle: sitterPageController
                                                .sittersList[index].sitterTitle,
                                            sitterDetails: sitterPageController
                                                .sittersList[index]
                                                .sitterDetails,
                                            sitterCoverPic: sitterPageController
                                                .sittersList[index]
                                                .sitterCoverPic,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  leading: CircleAvatar(
                                    backgroundImage: sitterPageController
                                                .sittersList[index]
                                                .sitterProPic ==
                                            'null'
                                        ? const AssetImage(
                                            'assets/images/sitter_default_propic.jpg')
                                        : NetworkImage(sitterPageController
                                                .sittersList[index]
                                                .sitterProPic!)
                                            as ImageProvider<Object>,
                                    radius: 30,
                                  ),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        sitterPageController
                                            .sittersList[index].sitterName,
                                        style: const TextStyle(
                                            fontFamily: 'SofiaPro',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: color2),
                                      ),
                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 20,
                                          ),
                                          Text(
                                            '4.5',
                                            style: TextStyle(
                                                fontFamily: 'SofiaPro',
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  subtitle: Text(
                                    sitterPageController
                                        .sittersList[index].sitterPlace,
                                    style: const TextStyle(
                                        fontFamily: 'SofiaPro',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.grey),
                                  ),
                                  // trailing: Icon(
                                  //   Icons.star,
                                  //   color: Colors.amber,
                                  //   size: 20,
                                  // ),
                                );
                              },
                            ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
