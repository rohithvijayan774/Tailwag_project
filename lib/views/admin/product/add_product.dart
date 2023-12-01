import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/admin_controller.dart';
import 'package:tailwag/widgets/image_pick_tile.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Add Product',
          style:
              TextStyle(color: color2, fontFamily: 'AbhayaLibre', fontSize: 30),
        ),
        backgroundColor: color1,
      ),
      body: Consumer<AdminController>(
        builder: (context, productAddController, _) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: SingleChildScrollView(
              child: Form(
                key: productAddController.productAddKey,
                child: Column(
                  children: [
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      controller: productAddController.productNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*this field is required';
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        // filled: true,
                        fillColor: color1,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(color: color2),
                        ),
                        hintStyle: TextStyle(
                          color: color2,
                          fontFamily: 'AbhayaLibre_regular',
                          fontWeight: FontWeight.w600,
                        ),
                        hintText: 'Product Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(color: color2),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      maxLines: 3,
                      textCapitalization: TextCapitalization.words,
                      controller: productAddController.productDetailsController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*this field is required';
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        // filled: true,
                        fillColor: color1,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(color: color2),
                        ),
                        hintStyle: TextStyle(
                          color: color2,
                          fontFamily: 'AbhayaLibre_regular',
                          fontWeight: FontWeight.w600,
                        ),
                        hintText: 'Product Details',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(color: color2),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ImagePickTile(
                      onPressed: () {
                        productAddController.selectProductPic(context);
                      },
                      subtitile: productAddController.productPic == null
                          ? 'Nothing Selected'
                          : productAddController.productPic.toString(),
                      title: 'Product Photo',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      controller: productAddController.shopIDController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*this field is required';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                            hint: const Text(
                              'Select Shop',
                              style: TextStyle(
                                color: color2,
                                fontFamily: 'AbhayaLibre_regular',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            items: productAddController.shopsList.map((shop) {
                              return DropdownMenuItem(
                                  value: shop, child: Text(shop.shopName));
                            }).toList(),
                            onChanged: (value) {
                              productAddController.shopIDController.text =
                                  value!.shopName;
                            },
                          ),
                        ),
                        fillColor: color1,
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(color: color2),
                        ),
                        hintStyle: const TextStyle(
                          color: color2,
                          fontFamily: 'AbhayaLibre_regular',
                          fontWeight: FontWeight.w600,
                        ),
                        hintText: 'Shop ID',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(color: color2),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: width * 0.7,
                      height: 45,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          overlayColor: MaterialStatePropertyAll(color3),
                          backgroundColor: MaterialStatePropertyAll(color2),
                        ),
                        onPressed: () async {
                          if (productAddController.productAddKey.currentState!
                              .validate()) {
                            await productAddController.saveProductsToShop(
                                productAddController.productNameController.text,
                                productAddController
                                    .productDetailsController.text,
                                productAddController.shopIDController.text);

                            productAddController.uploadProductPhoto(
                              productAddController.productPic!,
                              productAddController.productNameController.text,
                              productAddController.shopIDController.text,
                            );
                            productAddController.clearProductField();
                            Navigator.of(context).pop();
                          }
                        },
                        child: const Text(
                          'Add',
                          style: TextStyle(
                              fontFamily: 'AbhayaLibre_regular',
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
