import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/widgets/products_tile.dart';
import 'package:tailwag/widgets/shop_list_tile.dart';

class Grooming extends StatelessWidget {
  const Grooming({super.key});

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
                        const Text(
                          'Top Grooming Products',
                          style: TextStyle(
                              fontFamily: 'AbhayaLibre',
                              color: color2,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {}, child: const Text('See all'))
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductsTile(
                        onPress: () {},
                        imageURL: 'assets/images/grooming_1.png',
                        width: width,
                        title:
                            'Jumbo Green Glo Shampoo, Whitening and Color Enhancing, Conditioning, Anti-itching Green Apple Dog Shampoo (250 ml)',
                        description: '',
                        price: 215.0,
                      ),
                      ProductsTile(
                        onPress: () {},
                        imageURL: 'assets/images/grooming_2.png',
                        width: width,
                        title:
                            'Petlicious & More 1000 ml Bio Clean Neem Shampoo for Dog & Cats',
                        description: '',
                        price: 495.0,
                      ),
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
                        imageURL: 'assets/images/grooming_3.png',
                        width: width,
                        title: 'Petlicious & More Bio Clean 500 ml Fruit ',
                        description: '',
                        price: 310.0,
                      ),
                      ProductsTile(
                        onPress: () {},
                        imageURL: 'assets/images/grooming_4.png',
                        width: width,
                        title: 'Fifozone Bigboss Shampoo 200 ml for Dogs',
                        description: '',
                        price: 197.0,
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
                        'Top Grooming Center',
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
                      imageURL: 'assets/images/baegopa.png')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
