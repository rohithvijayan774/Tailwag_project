import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/controller.dart';
import 'package:tailwag/views/care_categories/grooming.dart';
import 'package:tailwag/views/care_categories/medicare.dart';
import 'package:tailwag/views/care_categories/record_datas.dart';
import 'package:tailwag/views/care_categories/reminder.dart';
import 'package:tailwag/widgets/shop_list_tile.dart';

import '../widgets/pet_select_tile.dart';

class Care extends StatelessWidget {
  const Care({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final carePagePeovider = Provider.of<Controller>(context, listen: false);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    final drawerItems = {
      'Home': Icon(Icons.home_outlined),
      'Profile': Icon(Icons.person_outline_outlined),
    };

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: color1,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(
              // color: color2,
              width: width,
              height: height / 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: carePagePeovider.userModel.petPic ==
                                null
                            ? const AssetImage('assets/images/profile_pic.png')
                            : NetworkImage(carePagePeovider.userModel.petPic!)
                                as ImageProvider<Object>,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Tailwag',
                        style: TextStyle(
                            fontFamily: 'AbhayaLibre',
                            fontSize: 30,
                            color: color2),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications_none_rounded,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.calendar_month_outlined,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // Scaffold.of(context).openDrawer();
                              scaffoldKey.currentState?.openEndDrawer();
                            },
                            icon: const Icon(
                              Icons.menu,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CupertinoSearchTextField(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    backgroundColor: Colors.white,
                    placeholder: 'Search menu, restaurant or etc',
                    placeholderStyle:
                        TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PetSelectTile(
                          width: width,
                          imageURL: 'assets/images/recordData.png',
                          title: 'Record Data',
                          onPress: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        FadeTransition(
                                  opacity: animation,
                                  child: const RecordDatas(),
                                ),
                              ),
                            );
                          }),
                      PetSelectTile(
                          width: width,
                          imageURL: 'assets/images/medicare.png',
                          title: 'Medicare',
                          onPress: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        FadeTransition(
                                  opacity: animation,
                                  child: const Medicare(),
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PetSelectTile(
                          width: width,
                          imageURL: 'assets/images/remainder.png',
                          title: 'Remainder',
                          onPress: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Reminder(),
                            ));
                          }),
                      PetSelectTile(
                          width: width,
                          imageURL: 'assets/images/groomig.png',
                          title: 'Grooming',
                          onPress: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        FadeTransition(
                                  opacity: animation,
                                  child: const Grooming(),
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 70,
                    width: width,
                    decoration: BoxDecoration(
                      color: color2,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: width / 2,
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(10),
                              bottomStart: Radius.circular(10),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Article',
                              style: TextStyle(
                                  fontFamily: 'AbhayaLibre_regular',
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/Article.png'),
                                  fit: BoxFit.cover),
                              color: Colors.grey,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Top Pet Hospitals',
                        style: TextStyle(
                            fontFamily: 'SofiaPro',
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(onPressed: () {}, child: const Text('See all'))
                    ],
                  ),
                  const ShopListTile(
                      shopTitle: 'June Martin',
                      shopLocation: 'Perinthalmanna, Kerala',
                      rating: 4.8,
                      imageURL: 'assets/images/bowmweow.png'),
                  const ShopListTile(
                      shopTitle: 'June Martin',
                      shopLocation: 'Perinthalmanna, Kerala',
                      rating: 4.8,
                      imageURL: 'assets/images/bowmweow.png'),
                ],
              ),
            )
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [color2, color3],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 50,
              top: 80,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('data'),
                  ],
                ),
                // SizedBox(
                //   height: 20,
                // ),
                Expanded(
                  child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                            width: width,
                            height: height * 0.07,
                            decoration: BoxDecoration(color: color3),
                            child: ListTile());
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
