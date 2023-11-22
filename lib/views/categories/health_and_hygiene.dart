import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/widgets/products_tile.dart';

class HealthandHygiene extends StatelessWidget {
  const HealthandHygiene({super.key});

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
                      ProductsTile(
                          onPress: () {},
                          imageURL: 'assets/images/product1.png',
                          width: width,
                          title: 'Drools 100% Vegetarian Adult Dry Dog Food',
                          description:
                              'Gluten-free, cruelty-free & preservative-free',
                          price: 0.0),
                      ProductsTile(
                          onPress: () {},
                          imageURL: 'assets/images/product2.png',
                          width: width,
                          title:
                              'Royal Canin Puppy Mini Wet Puppy Food (1-10kg) - 85 g packs',
                          description:
                              'Gluten-free, cruelty-free & preservative-free',
                          price: 115.0),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductsTile(
                          onPress: () {},
                          imageURL: 'assets/images/product3.png',
                          width: width,
                          title:
                              'Farmina N&D Pumpkin Lamb & Blueberry Grain Free Mini Breed Dry Puppy Food',
                          description:
                              'Gluten-free, cruelty-free & preservative-free',
                          price: 891.0),
                      ProductsTile(
                          onPress: () {},
                          imageURL: 'assets/images/top_pick_1.png',
                          width: width,
                          title: 'HUFT Cat Mahi Fish Crunchies - 35 g',
                          description:
                              'Dehydrated, slow-cooked, gluten-free cat treats',
                          price: 199.0),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductsTile(
                          onPress: () {},
                          imageURL: 'assets/images/top_pick_2.png',
                          width: width,
                          title:
                              'Applaws Tuna in Jelly For Kittens Wet Cat Food - 70 g',
                          description:
                              'Natural, human-grade, international cat food',
                          price: 155.0),
                      ProductsTile(
                          onPress: () {},
                          imageURL: 'assets/images/top_pick_3.png',
                          width: width,
                          title: 'HUFT Eco-Friendly Cat Litter - 10 L (10kg)',
                          description:
                              'Chemical-free, flushable, super-absorbent & excellent odour control',
                          price: 1799.0),
                    ],
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
