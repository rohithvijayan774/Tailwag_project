import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/widgets/category_circle_tile.dart';
import 'package:tailwag/widgets/food_product_tile.dart';
import 'package:tailwag/widgets/shopbybrand_tile.dart';
import 'package:tailwag/widgets/top_pick_tile.dart';

class CatFood extends StatelessWidget {
  const CatFood({super.key});

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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FoodProductTile(
                          title: 'Mother &\nbaby',
                          imageURL: 'assets/images/dog_starter.png'),
                      FoodProductTile(
                          title: 'Kitten',
                          imageURL: 'assets/images/dog_puppy.png'),
                      FoodProductTile(
                          title: 'Adult',
                          imageURL: 'assets/images/dog_adult.png'),
                    ],
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
                          title: 'Dry Food',
                          imageURL: 'assets/images/dog_food1.png'),
                      CategoryCircleTile(
                          width: width,
                          onPressed: () {},
                          title: 'Wet Food',
                          imageURL: 'assets/images/dog_food2.png'),
                      CategoryCircleTile(
                          width: width,
                          onPressed: () {},
                          title: 'Skin care\nFoods',
                          imageURL: 'assets/images/dog_food3.png'),
                      CategoryCircleTile(
                          width: width,
                          onPressed: () {},
                          title: 'Treats',
                          imageURL: 'assets/images/dog_food4.png'),
                    ],
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
