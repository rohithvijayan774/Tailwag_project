import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/admin_controller.dart';
import 'package:tailwag/views/admin/shops/add_shops.dart';
import 'package:tailwag/widgets/shop_list_tile.dart';

class AdminShop extends StatelessWidget {
  const AdminShop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Shops',
          style:
              TextStyle(color: color2, fontFamily: 'AbhayaLibre', fontSize: 30),
        ),
        backgroundColor: color1,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddShops(),
                ),
              );
            },
            icon: const Icon(
              Icons.add_to_photos_outlined,
              color: color2,
            ),
          )
        ],
      ),
      body: Consumer<AdminController>(
        builder: (context, adminShopController, _) {
          return FutureBuilder(
            future: adminShopController.fetchShops(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: color2,
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: adminShopController.shopsList.isEmpty
                    ? const Center(
                        child: Text(
                          'No Shops Found',
                          style: TextStyle(
                              fontFamily: 'AbhayaLibre', color: color2),
                        ),
                      )
                    : ListView.separated(
                        itemCount: adminShopController.shopsList.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                        itemBuilder: (context, index) {
                          return ShopListTile(
                            shopTitle:
                                adminShopController.shopsList[index].shopName,
                            shopLocation: adminShopController
                                .shopsList[index].shopLocation,
                            rating: adminShopController
                                        .shopsList[index].shopRating !=
                                    null
                                ? adminShopController
                                    .shopsList[index].shopRating!
                                : 0,
                            imageURL:
                                adminShopController.shopsList[index].shopPhoto!,
                          );
                        },
                      ),
              );
            },
          );
        },
      ),
    );
  }
}
