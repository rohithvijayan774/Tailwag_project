import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/controller.dart';
import 'package:tailwag/services/notification_sevices.dart';
import 'package:tailwag/views/care_categories/add_reminder.dart';
import 'package:tailwag/widgets/pet_tiny_avatar.dart';

class Reminder extends StatelessWidget {
  const Reminder({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final reminderProvider = Provider.of<Controller>(context, listen: false);
    DateTime todayDate = DateTime.now();
    final formattedSelectedDate = DateFormat('MMMM dd,yyyy').format(todayDate);
    var reminderDate = DateFormat('dd-MMM-yyyy').format(todayDate);
    // var reminderDate;
    // provider.fetchReminder(formattedReminderDateNow);

    NotificationServices notificationServices = NotificationServices();

    return Scaffold(
      backgroundColor: color1,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: FutureBuilder(
          future: reminderProvider.fetchReminder(reminderDate),
          builder: (context, snapshot) {
            return Column(
              children: [
                SizedBox(
                  width: width,
                  height: height / 2.7,
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
                            networkImageURL: reminderProvider.userModel.petPic,
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
                            'Today',
                            style: TextStyle(
                              fontSize: 25,
                              color: color2,
                            ),
                          ),
                          Text(
                            formattedSelectedDate,
                            style: const TextStyle(color: color2),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DatePicker(
                        DateTime.now(),
                        initialSelectedDate: DateTime.now(),
                        selectionColor: color2,
                        selectedTextColor: color1,
                        deactivatedColor: color2,
                        onDateChange: (selectedDate) {
                          reminderDate =
                              DateFormat('dd-MMM-yyyy').format(selectedDate);

                          reminderProvider.fetchReminder(reminderDate);
                          // print(reminderDate);
                          print(reminderDate);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'To Take',
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
                                  builder: (context) => const AddReminder(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.add, color: color1),
                            label: const Text(
                              'Add',
                              style: TextStyle(color: color1),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Consumer<Controller>(
                  builder: (context, reminderController, _) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: color2,
                          ),
                        ),
                      );
                    }
                    return Expanded(
                      child: Center(
                        child: reminderController.reminderList.isEmpty
                            ? const Text(
                                'No remider!!!',
                                style: TextStyle(color: color2, fontSize: 15),
                              )
                            : ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 10,
                                ),
                                itemCount:
                                    reminderController.reminderList.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(reminderController
                                          .reminderList[index].reminderTime),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: width,
                                          height: height / 8,
                                          decoration: const BoxDecoration(
                                              color: color3,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  reminderController
                                                      .reminderList[index]
                                                      .reminderTitle,
                                                  style: const TextStyle(
                                                      color: color2,
                                                      fontSize: 20,
                                                      fontFamily: 'SofiaPro',
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  reminderController
                                                      .reminderList[index]
                                                      .reminderDescription,
                                                  style: const TextStyle(
                                                      color: color2,
                                                      fontSize: 15,
                                                      fontFamily: 'SofiaPro',
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  reminderController
                                                      .reminderList[index]
                                                      .reminderTime,
                                                  style: const TextStyle(
                                                      color: color2,
                                                      fontSize: 15,
                                                      fontFamily: 'SofiaPro',
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                },
                              ),
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
