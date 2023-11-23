import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/bottomnavbar_controller.dart';
import 'package:tailwag/controller/controller.dart';
import 'package:tailwag/controller/hospital_controller.dart';
import 'package:tailwag/views/care_categories/grooming.dart';
import 'package:tailwag/views/care_categories/medicare.dart';
import 'package:tailwag/views/care_categories/pet_hospitals.dart';
import 'package:tailwag/views/care_categories/record_datas.dart';
import 'package:tailwag/views/care_categories/reminder.dart';
import 'package:tailwag/widgets/hospital_list_tile.dart';
import 'package:tailwag/widgets/shop_list_tile.dart';

import '../widgets/pet_select_tile.dart';

class Care extends StatelessWidget {
  const Care({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final carePageProvider = Provider.of<Controller>(context, listen: false);
    final bottomNavBarController =
        Provider.of<BottomNavBarController>(context, listen: false);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    void drawerList(int index) {
      switch (index) {
        case 0:
          bottomNavBarController.updateIndex(2);
          Navigator.of(context).pop();
          break;
        case 1:
          bottomNavBarController.updateIndex(4);
          Navigator.of(context).pop();
          break;
        case 2:
          // bottomNavBarController.updateIndex(2);
          Navigator.of(context).pop();
          break;
        case 3:
          bottomNavBarController.updateIndex(0);
          Navigator.of(context).pop();
          break;
        case 4:
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const PetHospitals(),
          ));
          break;
        case 5:
          bottomNavBarController.updateIndex(1);
          Navigator.of(context).pop();
          break;
        case 6:
          // bottomNavBarController.updateIndex(1);
          Navigator.of(context).pop();
          break;
        case 9:
          // bottomNavBarController.updateIndex(1);
          carePageProvider.signOut(context);
          bottomNavBarController.currentIndex = 2;
          break;
        default:
      }
    }

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
                        backgroundImage: carePageProvider.userModel.petPic ==
                                null
                            ? const AssetImage('assets/images/profile_pic.png')
                            : NetworkImage(carePageProvider.userModel.petPic!)
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
              child: Column(
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
                      Consumer<HospitalController>(
                          builder: (context, hospitalController, _) {
                        return TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const PetHospitals(),
                                ),
                              );
                            },
                            child: const Text('See all'));
                      })
                    ],
                  ),
                  Expanded(
                    child: Consumer<HospitalController>(
                      builder: (context, hospitalProvider, _) {
                        return ListView.builder(
                          itemCount: hospitalProvider.hospitalsList.isEmpty
                              ? 0
                              : hospitalProvider.hospitalsList.length == 1
                                  ? 1
                                  : 2,
                          itemBuilder: (context, index) {
                            return HospitalListTile(
                                shopTitle: hospitalProvider
                                    .hospitalsList[index].hospitalName,
                                shopLocation: hospitalProvider
                                    .hospitalsList[index].hospitalLocation,
                                rating: hospitalProvider
                                    .hospitalsList[index].hospitalRating,
                                imageURL: hospitalProvider
                                    .hospitalsList[index].hospitalPhoto);
                          },
                        );
                      },
                    ),
                  ),
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
              bottom: 20,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: carePageProvider.userModel.petPic == null
                          ? const AssetImage('assets/images/profile_pic.png')
                          : NetworkImage(carePageProvider.userModel.petPic!)
                              as ImageProvider<Object>,
                      radius: 40,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      carePageProvider.userModel.petName == null
                          ? '[Pet name]'
                          : carePageProvider.userModel.petName!,
                      style: const TextStyle(
                          fontFamily: 'AbhayaLibre',
                          fontSize: 20,
                          color: color1),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 20,
                // ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: index == 6 ? 60 : 10,
                    ),
                    itemCount: carePageProvider.drawerTitles.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: width,
                        height: height * 0.06,
                        decoration: const BoxDecoration(
                            color: color3,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Center(
                          child: ListTile(
                            leading: Icon(
                              carePageProvider.drawerIcons[index].icon,
                              color: color2,
                            ),
                            title: Text(
                              carePageProvider.drawerTitles[index],
                              style: const TextStyle(
                                color: color2,
                                fontFamily: 'AbhayaLibre',
                              ),
                            ),
                            onTap: () {
                              drawerList(index);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
