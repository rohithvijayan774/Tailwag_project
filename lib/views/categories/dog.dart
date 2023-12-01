import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/admin_controller.dart';
import 'package:tailwag/views/care_categories/pet_hospitals.dart';
import 'package:tailwag/views/categories/accessories.dart';
import 'package:tailwag/views/categories/dog_food.dart';
import 'package:tailwag/views/categories/dog_treats.dart';
import 'package:tailwag/views/categories/health_and_hygiene.dart';
import 'package:tailwag/views/categories/pet_shops.dart';
import 'package:tailwag/widgets/categories_rectangle_tile.dart';
import 'package:tailwag/widgets/shop_list_tile.dart';
import 'package:tailwag/widgets/top_pick_tile.dart';

class Dog extends StatelessWidget {
  const Dog({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: color1,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
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
            Expanded(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoriesRectangleTile(
                        width: width,
                        imageURL: 'assets/images/FoodBG.png',
                        title: 'Food',
                        onPress: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => const DogFood(),
                          //   ),
                          // );

                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      FadeTransition(
                                opacity: animation,
                                child: const DogFood(),
                              ),
                            ),
                          );
                        },
                      ),
                      CategoriesRectangleTile(
                        width: width,
                        imageURL: 'assets/images/TreatsBG.png',
                        title: 'Treats',
                        onPress: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      FadeTransition(
                                opacity: animation,
                                child: const DogTreats(),
                              ),
                            ),
                          );
                        },
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
                        onPress: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      FadeTransition(
                                opacity: animation,
                                child: const HealthandHygiene(),
                              ),
                            ),
                          );
                        },
                      ),
                      CategoriesRectangleTile(
                        width: width,
                        imageURL: 'assets/images/AccessoriesBG.png',
                        title: 'Accessories',
                        onPress: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      FadeTransition(
                                opacity: animation,
                                child: const Accesories(),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Top picks',
                        style: TextStyle(
                            fontFamily: 'SofiaPro',
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(onPressed: () {}, child: const Text('See all'))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TopPickTile(
                        onPress: () {},
                        imageURL: 'assets/images/top_pick_1.png',
                        width: width,
                        title: 'HUFT Cat Mahi Fish Crunchies - 35 g',
                        description:
                            'Dehydrated, slow-cooked, gluten-free cat treats',
                        price: 199,
                      ),
                      TopPickTile(
                        onPress: () {},
                        imageURL: 'assets/images/top_pick_2.png',
                        width: width,
                        title:
                            'Applaws Tuna in Jelly For Kittens Wet Cat Food - 70 g',
                        description:
                            'Natural, human-grade, international cat food',
                        price: 155,
                      ),
                      TopPickTile(
                        onPress: () {},
                        imageURL: 'assets/images/top_pick_3.png',
                        width: width,
                        title: 'HUFT Eco-Friendly Cat Litter - 10 L (10kg)',
                        description:
                            'Chemical-free, flushable, super-absorbent & excellent odour control',
                        price: 1799,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Top Shops',
                        style: TextStyle(
                            fontFamily: 'SofiaPro',
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const PetShops(),
                            ),
                          );
                        },
                        child: const Text('See all'),
                      )
                    ],
                  ),
                  Consumer<AdminController>(
                    builder: (context, adminDogPageController, child) {
                      return Column(
                        children: [
                          adminDogPageController.shopsList.isEmpty
                              ? const Text('No Shops Found')
                              : ShopListTile(
                                  shopTitle: adminDogPageController
                                      .shopsList[0].shopName,
                                  shopLocation: adminDogPageController
                                      .shopsList[0].shopLocation,
                                  rating: adminDogPageController
                                      .shopsList[0].shopRating!,
                                  imageURL: adminDogPageController
                                      .shopsList[0].shopPhoto!,
                                )
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
