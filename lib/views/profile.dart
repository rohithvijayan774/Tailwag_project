import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/controller.dart';
import 'package:tailwag/views/user_signup/pet_details.dart';
import 'package:tailwag/widgets/about_my_pet.dart';
import 'package:tailwag/widgets/profile_pet_data.dart';
import 'package:tailwag/widgets/profile_pet_owner_data.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final userProfileProvider = Provider.of<Controller>(context, listen: false);
    return Scaffold(
      backgroundColor: color1,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: height / 1.7,
                width: width,
                decoration: const BoxDecoration(
                  color: color3,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(100, 50),
                    bottomRight: Radius.elliptical(100, 50),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: height,
                  width: width,
                ),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 90,
                      backgroundImage: userProfileProvider.userModel.petPic ==
                              null
                          ? const AssetImage('assets/images/profile_pic.png')
                          : NetworkImage(userProfileProvider.userModel.petPic!)
                              as ImageProvider<Object>,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        onPressed: () async {
                          PermissionStatus galleryPermission =
                              await Permission.photos.request();
                          if (galleryPermission == PermissionStatus.granted) {
                            await userProfileProvider
                                .selectPetPic(context)
                                .then((value) => userProfileProvider
                                    .uploadPetPic(userProfileProvider.petPic!));
                          }
                        },
                        icon: const Icon(Icons.edit_square),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: height / 2,
                  width: width,
                  decoration: const BoxDecoration(
                    // color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: height,
                      width: width,
                      decoration: const BoxDecoration(
                        color: color1,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const PetDetails(),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.edit_note,
                                color: color2,
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Text(
                                      userProfileProvider.userModel.petName ==
                                              null
                                          ? '[Pet name]'
                                          : userProfileProvider
                                              .userModel.petName!,
                                      style: const TextStyle(
                                          fontFamily: 'AbhayaLibre',
                                          fontSize: 30,
                                          color: color2),
                                    ),
                                    Text(
                                      userProfileProvider.userModel.breedName ==
                                              null
                                          ? '[Breed name]'
                                          : userProfileProvider
                                              .userModel.breedName!,
                                      style: const TextStyle(
                                          fontFamily: 'AbhayaLibre',
                                          fontSize: 15,
                                          color: color2),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ProfilePetData(
                                          title: userProfileProvider
                                                      .userModel.petSex ==
                                                  null
                                              ? '[Sex]'
                                              : userProfileProvider
                                                  .userModel.petSex!,
                                        ),
                                        ProfilePetData(
                                          title: userProfileProvider
                                                      .userModel.petAge ==
                                                  null
                                              ? '[Age]'
                                              : userProfileProvider
                                                  .userModel.petAge!,
                                        ),
                                        ProfilePetData(
                                          title: userProfileProvider
                                                      .userModel.petWeight ==
                                                  null
                                              ? '[Weight]'
                                              : userProfileProvider
                                                  .userModel.petWeight!,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ProfilePetUserData(
                                        width: width,
                                        imageURL:
                                            'assets/images/owner_profile.png',
                                        ownerName: userProfileProvider
                                            .userModel.userName,
                                        ownerEmail: userProfileProvider
                                            .userModel.userEmail),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'About my Pet',
                                          style: TextStyle(
                                              fontFamily: 'AbhayaLibre',
                                              fontSize: 20,
                                              color: color2),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    AboutMyPet(
                                      width: width,
                                      description: userProfileProvider
                                                  .userModel.aboutPet ==
                                              null
                                          ? '[About your pet]'
                                          : userProfileProvider
                                              .userModel.aboutPet!,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: width,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back_ios_new_sharp,
                            color: color2,
                          ),
                        ),
                        Image.asset(
                          'assets/images/logo_brown.png',
                          scale: 2,
                        ),
                        Consumer<Controller>(
                          builder: (context, provider, _) {
                            return IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.settings_outlined,
                                color: color2,
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
