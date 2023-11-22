import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailwag/const.dart';
import 'package:tailwag/controller/controller.dart';

class AddReminder extends StatelessWidget {
  const AddReminder({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final addReminderProvider = Provider.of<Controller>(context, listen: false);
    return Scaffold(
      backgroundColor: color1,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(
              width: width,
              height: height / 7,
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
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: addReminderProvider.reminderFormKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: addReminderProvider.reminderTitleController,
                        textCapitalization: TextCapitalization.words,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '*this field is required';
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          filled: true,
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
                          hintText: 'Title',
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
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller:
                                  addReminderProvider.reminderDateController,
                              textCapitalization: TextCapitalization.words,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '*this field is required';
                                } else {
                                  return null;
                                }
                              },
                              onTap: () {
                                addReminderProvider.reminderSelectDate(context);
                              },
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.date_range),
                                filled: true,
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
                                hintText: 'Date',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide(color: color2),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller:
                                  addReminderProvider.reminderTimeController,
                              textCapitalization: TextCapitalization.words,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '*this field is required';
                                } else {
                                  return null;
                                }
                              },
                              onTap: () {
                                addReminderProvider.reminderSelectTime(context);
                              },
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.av_timer_sharp),
                                filled: true,
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
                                hintText: 'Time',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide(color: color2),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller:
                            addReminderProvider.reminderDescriptionController,
                        textCapitalization: TextCapitalization.words,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '*this field is required';
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          filled: true,
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
                          hintText: 'Description',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            borderSide: BorderSide(color: color2),
                          ),
                        ),
                        maxLines: 5,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: const ButtonStyle(
                          overlayColor: MaterialStatePropertyAll(color3),
                          backgroundColor: MaterialStatePropertyAll(color2),
                        ),
                        onPressed: () {
                          if (addReminderProvider.reminderFormKey.currentState!
                              .validate()) {
                            addReminderProvider
                                .saveReminder(
                                  '${addReminderProvider.reminderDateController.text}${addReminderProvider.reminderTitleController.text}',
                                  addReminderProvider
                                      .reminderDateController.text,
                                  addReminderProvider
                                      .reminderTimeController.text,
                                  addReminderProvider
                                      .reminderTitleController.text,
                                  addReminderProvider
                                      .reminderDescriptionController.text,
                                )
                                .then(
                                  (value) => Navigator.pop(context),
                                );
                          }
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(
                              fontFamily: 'AbhayaLibre_regular',
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
