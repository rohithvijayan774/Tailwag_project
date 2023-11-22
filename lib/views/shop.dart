import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/controller.dart';
import 'package:tailwag/views/categories/cat.dart';
import 'package:tailwag/views/categories/dog.dart';
import 'package:tailwag/widgets/pet_select_tile.dart';
import 'package:tailwag/widgets/shopbybrand_tile.dart';
import 'package:tailwag/widgets/top_pick_tile.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final shopPageController = Provider.of<Controller>(context, listen: false);
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
                        backgroundImage: shopPageController.userModel.petPic ==
                                null
                            ? const AssetImage('assets/images/profile_pic.png')
                            : NetworkImage(shopPageController.userModel.petPic!)
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
                  const Text(
                    'Select your pet',
                    style: TextStyle(
                      fontFamily: 'AbhayaLibre',
                      color: color2,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PetSelectTile(
                          width: width,
                          imageURL: 'assets/images/select_pet_dog.png',
                          title: 'Dog',
                          onPress: () {
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
                          }),
                      PetSelectTile(
                          width: width,
                          imageURL: 'assets/images/select_pet_cat.png',
                          title: 'Cat',
                          onPress: () {
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
                          imageURL: 'assets/images/select_pet_bird.png',
                          title: 'Bird',
                          onPress: () {}),
                      PetSelectTile(
                          width: width,
                          imageURL: 'assets/images/select_pet_fish.png',
                          title: 'Fish',
                          onPress: () {}),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Shop by Brands',
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
                      ShopByBrandTile(
                        onPress: () {},
                        title: 'Royal Canin',
                        imageURL: 'assets/images/shopbybrand1.png',
                        tileBG: const Color(0xFFD26565),
                        imgBottomPostn: -15,
                        imgleftPostn: -15,
                      ),
                      ShopByBrandTile(
                        onPress: () {},
                        title: 'Pedigree',
                        imageURL: 'assets/images/shopbybrand2.png',
                        tileBG: const Color(0xFFE98B64),
                        imgBottomPostn: -10,
                        imgleftPostn: -20,
                      ),
                      ShopByBrandTile(
                        onPress: () {},
                        title: 'Drools',
                        imageURL: 'assets/images/shopbybrand3.png',
                        tileBG: const Color(0xFFD26565),
                        imgBottomPostn: 0,
                        imgleftPostn: 0,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
