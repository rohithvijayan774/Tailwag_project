import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationServices {
  // late FlutterLocalNotificationsPlugin notificationPlugin;

  // NotificationServices() {
  //   notificationPlugin = FlutterLocalNotificationsPlugin();
  //   initNotification();
  // }

  // Future<void> initNotification() async {
  //   AndroidInitializationSettings initializationSettingsAndroid =
  //       const AndroidInitializationSettings('ic_launcher');

  //   var initializationSettings =
  //       InitializationSettings(android: initializationSettingsAndroid);
  //   await notificationPlugin.initialize(
  //     initializationSettings,
  //     onDidReceiveNotificationResponse:
  //         (NotificationResponse notificationResponse) async {},
  //   );
  // }

  // notificationDetails() {
  //   return const NotificationDetails(
  //     android: AndroidNotificationDetails('channelId', 'channelName',
  //         importance: Importance.max),
  //   );
  // }

  // Future showNotification({
  //   int id = 0,
  //   String? title,
  //   String? body,
  //   String? payLoad,
  // }) async {
  //   return notificationPlugin.show(
  //     id,
  //     title,
  //     body,
  //     await notificationDetails(),
  //   );
  // }

  // Future scheduleNotification({
  //   int id = 0,
  //   String? title,
  //   String? body,
  //   String? payLoad,
  //   required DateTime schedulNotificationDateTime,
  // }) async {
  //   print('*****Notification Scheduled');
  //   return notificationPlugin.zonedSchedule(
  //       id,
  //       title,
  //       body,
  //       tz.TZDateTime.from(schedulNotificationDateTime, tz.local),
  //       await notificationDetails(),
  //       uiLocalNotificationDateInterpretation:
  //           UILocalNotificationDateInterpretation.absoluteTime);
  // }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings androidInitializationSettings =
      AndroidInitializationSettings('logo_brown');

  void initialiseNotifications() async {
    print('Notification Initialized');
    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
    );
    await flutterLocalNotificationPlugin.initialize(initializationSettings);
    print('Notification Completed');
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max));
  }

  void sendNotification(
    String title,
    String body,
  ) async {
    try {
      AndroidNotificationDetails androidNotificationDetails =
          const AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
        priority: Priority.high,
      );
      NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
      );

      await flutterLocalNotificationPlugin.show(
        0,
        title,
        body,
        notificationDetails,
      );
      print('Notification Send');
    } catch (e) {
      print('NOtification Setting failed : $e');
    }
  }

  // Future scheduleNotification({
  //   int id = 0,
  //   String? title,
  //   String? body,
  //   String? payLoad,
  //   required DateTime schedulNotificationDateTime,
  // }) async {
  //   print('*****Notification Scheduled');
  //   return notificationPlugin.zonedSchedule(
  //       id,
  //       title,
  //       body,
  //       tz.TZDateTime.from(schedulNotificationDateTime, tz.local),
  //       await notificationDetails(),
  //       uiLocalNotificationDateInterpretation:
  //           UILocalNotificationDateInterpretation.absoluteTime);
  // }

  void scheduleNotification({
    String? title,
    String? body,
    String? payLoad,
    required DateTime? schedulNotificationDateTime,
  }) async {
    try {
      print('Entered notification schedule');
      // AndroidNotificationDetails androidNotificationDetails =
      //     const AndroidNotificationDetails(
      //   'channelId',
      //   'channelName',
      //   importance: Importance.max,
      //   priority: Priority.high,
      // );
      // NotificationDetails notificationDetails = NotificationDetails(
      //   android: androidNotificationDetails,
      // );
      print('Notification started');
      await flutterLocalNotificationPlugin.zonedSchedule(
          0,
          title,
          body,
          tz.TZDateTime.from(schedulNotificationDateTime!, tz.local),
          await notificationDetails(),
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime);
      print('Notification Send');
    } catch (e) {
      print('NOtification Setting failed : $e');
    }
  }
}
