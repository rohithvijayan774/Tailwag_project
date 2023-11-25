import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/admin_controller.dart';
import 'package:tailwag/widgets/image_pick_tile.dart';

class AddShops extends StatelessWidget {
  const AddShops({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Add Shop',
          style:
              TextStyle(color: color2, fontFamily: 'AbhayaLibre', fontSize: 30),
        ),
        backgroundColor: color1,
      ),
      body: Consumer<AdminController>(
        builder: (context, shopAddController, _) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: SingleChildScrollView(
              child: Form(
                key: shopAddController.shopAddKey,
                child: Column(
                  children: [
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      controller: shopAddController.shopNameController,
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
                        hintText: 'Shop Name',
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
                      controller: shopAddController.shopDetailsController,
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
                        hintText: 'Shop Details',
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
                        shopAddController.selecthospitalPic(context);
                      },
                      subtitile: shopAddController.hospitalPic == null
                          ? 'Nothing Selected'
                          : shopAddController.hospitalPic.toString(),
                      title: 'Shop Photo',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      controller: shopAddController.shopLocationController,
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
                        hintText: 'Shop Location',
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
                      textCapitalization: TextCapitalization.words,
                      controller: shopAddController.shopServiceController,
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
                        hintText: 'Shop Services',
                        border: OutlineInputBorder(
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
                          if (shopAddController.shopAddKey.currentState!
                              .validate()) {
                            await shopAddController.saveShop(
                              shopAddController.shopNameController.text,
                              shopAddController.shopLocationController.text,
                              shopAddController.shopDetailsController.text,
                              shopAddController.shopServiceController.text,
                            );
                            shopAddController.uploadShopPhoto(
                                shopAddController.shopPic!,
                                shopAddController.shopNameController.text);
                            shopAddController.clearshopFields();
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
