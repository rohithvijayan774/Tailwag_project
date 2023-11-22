import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/controller.dart';
import 'package:tailwag/views/categories/cat.dart';
import 'package:tailwag/views/categories/dog.dart';
import 'package:tailwag/widgets/categories_rectangle_tile.dart';
import 'package:tailwag/widgets/category_circle_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final homePageProvider = Provider.of<Controller>(context, listen: false);
    // final sitterProvider =
    //     Provider.of<SitterController>(context, listen: false);
    return Scaffold(
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
                        backgroundImage: homePageProvider.userModel.petPic ==
                                null
                            ? const AssetImage('assets/images/profile_pic.png')
                            : NetworkImage(homePageProvider.userModel.petPic!)
                                as ImageProvider<Object>,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Hey, ',
                        style: TextStyle(
                            fontFamily: 'AbhayaLibre_regular',
                            fontSize: 18,
                            color: color2),
                      ),
                      // Expanded(
                      //   child: Text(
                      //     provider.userModel.userName.isEmpty
                      //        ,
                      //     overflow: TextOverflow.ellipsis,
                      //     style: const TextStyle(
                      //         fontFamily: 'AbhayaLibre',
                      //         fontSize: 20,
                      //         color: color2),
                      //   ),
                      // ),
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
                            onPressed: () {},
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
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    width: width,
                    height: 150,
                    decoration: BoxDecoration(
                      color: color3.withOpacity(1),
                      borderRadius: BorderRadius.circular(10),
                      // image: DecorationImage(
                      //   fit: BoxFit.cover,
                      //   image: AssetImage('assets/images/Pattern.png'),
                      // ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: height,
                                width: width / 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Claim your\ndiscount 30%\ndaily now!',
                                      style: TextStyle(
                                          fontFamily: 'AbhayaLibre_regular',
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    ElevatedButton(
                                      style: const ButtonStyle(
                                        overlayColor:
                                            MaterialStatePropertyAll(color3),
                                        backgroundColor:
                                            MaterialStatePropertyAll(color2),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        'Shop now',
                                        style: TextStyle(
                                          fontFamily: 'AbhayaLibre',
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: height,
                                width: width / 3,
                                decoration: const BoxDecoration(
                                    // color: Colors.grey,
                                    image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/AAP_Product.png',
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Categories',
                    style: TextStyle(
                        fontFamily: 'SofiaPro',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryCircleTile(
                          width: width,
                          onPressed: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        FadeTransition(
                                  opacity: animation,
                                  child: const Dog(),
                                ),
                              ),
                            );
                          },
                          title: 'Dog',
                          imageURL: 'assets/images/Dog.png'),
                      CategoryCircleTile(
                          width: width,
                          onPressed: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        FadeTransition(
                                  opacity: animation,
                                  child: const Cat(),
                                ),
                              ),
                            );
                          },
                          title: 'Cat',
                          imageURL: 'assets/images/Cat.png'),
                      CategoryCircleTile(
                          width: width,
                          onPressed: () {},
                          title: 'Bird',
                          imageURL: 'assets/images/Bird.png'),
                      CategoryCircleTile(
                          width: width,
                          onPressed: () {},
                          title: 'Fish',
                          imageURL: 'assets/images/Fish.png'),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoriesRectangleTile(
                        width: width,
                        imageURL: 'assets/images/FoodBG.png',
                        title: 'Food',
                        onPress: () {},
                      ),
                      CategoriesRectangleTile(
                        width: width,
                        imageURL: 'assets/images/TreatsBG.png',
                        title: 'Treats',
                        onPress: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoriesRectangleTile(
                        width: width,
                        imageURL: 'assets/images/Health&HygieneBottleBG.png',
                        title: 'Health & Hygiene',
                        onPress: () {},
                      ),
                      CategoriesRectangleTile(
                        width: width,
                        imageURL: 'assets/images/AccessoriesBG.png',
                        title: 'Accessories',
                        onPress: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
