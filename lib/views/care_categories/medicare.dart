import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/controller.dart';
import 'package:tailwag/widgets/pet_tiny_avatar.dart';
import 'package:tailwag/widgets/shop_list_tile.dart';
import 'package:tailwag/widgets/top_pick_tile.dart';

class Medicare extends StatelessWidget {
  const Medicare({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final medicareController = Provider.of<Controller>(context);
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
                      PetTinyAvatar(
                        networkImageURL: medicareController.userModel.petPic,
                      )
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: () {}, child: const Text('See all'))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TopPickTile(
                          onPress: () {},
                          imageURL: 'assets/images/medicare_1.png',
                          width: width,
                          title:
                              'Praziquantel Pyrantel Pamoate & Febantel Tablets',
                          description: '',
                          price: 300.0),
                      TopPickTile(
                          onPress: () {},
                          imageURL: 'assets/images/medicare_2.png',
                          width: width,
                          title:
                              'Virbac Ipraz Deworming Tablets Ivermectin And Praziquantel',
                          description: '',
                          price: 107.0),
                      TopPickTile(
                          onPress: () {},
                          imageURL: 'assets/images/medicare_3.png',
                          width: width,
                          title:
                              'Fenbendazole & Praziquantel Vet Medicine Fentas Plus',
                          description: '',
                          price: 85.0),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TopPickTile(
                          onPress: () {},
                          imageURL: 'assets/images/medicare_4.png',
                          width: width,
                          title: 'BEAPHAR WOREX SUSPENSION',
                          description: '',
                          price: 95.0),
                      TopPickTile(
                          onPress: () {},
                          imageURL: 'assets/images/medicare_5.png',
                          width: width,
                          title: 'Marbomet marbofloxacin tablets for dogs',
                          description: '',
                          price: 355.0),
                      TopPickTile(
                          onPress: () {},
                          imageURL: 'assets/images/medicare_6.png',
                          width: width,
                          title: 'Skyworm® tablets for Cats',
                          description: '',
                          price: 355.0),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Top pharmacy',
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
