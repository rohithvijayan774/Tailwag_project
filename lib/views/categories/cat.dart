import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/views/categories/accessories.dart';
import 'package:tailwag/views/categories/cat_food.dart';
import 'package:tailwag/views/categories/health_and_hygiene.dart';
import 'package:tailwag/widgets/categories_rectangle_tile.dart';
import 'package:tailwag/widgets/shop_list_tile.dart';
import 'package:tailwag/widgets/top_pick_tile.dart';

class Cat extends StatelessWidget {
  const Cat({super.key});

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
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      FadeTransition(
                                opacity: animation,
                                child: const CatFood(),
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
                                child: const CatFood(),
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
                    height: 30,
                  ),
                  const ShopListTile(
                    shopTitle: 'BowmeoW',
                    shopLocation: 'Perinthalmanna, Kerala',
                    rating: 4.8,
                    imageURL: 'assets/images/bowmweow.png',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const ShopListTile(
                    shopTitle: 'Baegopa Suhat',
                    shopLocation: 'Perinthalmanna, Kerala',
                    rating: 3.7,
                    imageURL: 'assets/images/baegopa.png',
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
