import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/admin_controller.dart';
import 'package:tailwag/views/admin/product/add_product.dart';
import 'package:tailwag/widgets/hospital_list_tile.dart';

class AdminProduct extends StatelessWidget {
  const AdminProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Products',
          style:
              TextStyle(color: color2, fontFamily: 'AbhayaLibre', fontSize: 30),
        ),
        backgroundColor: color1,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddProduct(),
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
        builder: (context, adminProductsController, _) {
          return FutureBuilder(
            future: adminProductsController.fetchProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: adminProductsController.hospitalsList.isEmpty
                    ? const Center(
                        child: Text('No Products Found'),
                      )
                    : ListView.separated(
                        itemCount: adminProductsController.productList.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                        itemBuilder: (context, index) {
                          return HospitalListTile(
                            hospitalTitle: adminProductsController
                                .productList[index].productName,
                            hospitalLocation: adminProductsController
                                .productList[index].productDetails,
                            rating: adminProductsController
                                        .productList[index].productRating !=
                                    null
                                ? adminProductsController
                                    .productList[index].productRating!
                                : 0,
                            imageURL: adminProductsController
                                .productList[index].productPhoto,
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
