import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/controller.dart';
import 'package:tailwag/views/care_categories/create_notes.dart';
import 'package:tailwag/widgets/pet_tiny_avatar.dart';

class RecordDatas extends StatelessWidget {
  const RecordDatas({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final notesController = Provider.of<Controller>(context, listen: false);
    return Scaffold(
      backgroundColor: color1,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: FutureBuilder(
          future: notesController.fetchNotes(),
          builder: (context, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              print('***** NOTES WAITING LIST ******');
              return Column(
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
                              networkImageURL: notesController.userModel.petPic,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'My Notes',
                              style: TextStyle(
                                fontSize: 25,
                                color: color2,
                              ),
                            ),
                            ElevatedButton.icon(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(color2)),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const CreateNotes(),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.add, color: color1),
                              label: const Text(
                                'Create',
                                style: TextStyle(color: color1),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                          strokeWidth: 3, color: color2),
                    ),
                  ),
                ],
              );
            }
            return Column(
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
                              networkImageURL: notesController.userModel.petPic)
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'My Notes',
                            style: TextStyle(
                              fontSize: 25,
                              color: color2,
                            ),
                          ),
                          ElevatedButton.icon(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(color2)),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const CreateNotes(),
                              ));
                            },
                            icon: const Icon(Icons.add, color: color1),
                            label: const Text(
                              'Create',
                              style: TextStyle(color: color1),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Consumer<Controller>(
                  builder: (context, provider, _) {
                    return Expanded(
                      child: provider.myNotesList.isEmpty
                          ? const Center(
                              child: Text(
                                'No notes found!!!',
                                style: TextStyle(
                                    color: color2,
                                    fontFamily: 'SofiaPro',
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 20,
                              ),
                              itemCount: provider.myNotesList.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: color3,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ListTile(
                                    leading: const CircleAvatar(
                                      backgroundColor: color2,
                                      backgroundImage:
                                          AssetImage('assets/images/Paw.png'),
                                      radius: 30,
                                    ),
                                    title: Text(
                                      provider.myNotesList[index].date,
                                      style: const TextStyle(
                                          fontFamily: 'SofiaPro',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          provider.myNotesList[index].title,
                                          style: const TextStyle(
                                              fontFamily: 'SofiaPro',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: color2),
                                        ),
                                        Text(
                                          provider
                                              .myNotesList[index].description,
                                          style: const TextStyle(
                                              fontFamily: 'SofiaPro',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: color2),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
