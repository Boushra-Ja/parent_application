import 'package:alrazi_project/controllers/employee/BounsController.dart';
import 'package:alrazi_project/views/Employe_App/NotificationPages/BounsNotificationPage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class NotificationApi {
  static final FlutterLocalNotificationsPlugin _notifications =
  FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  static Future _notificationDetails() async => const NotificationDetails(
      android: AndroidNotificationDetails(
        "channel id",
        "channel name",
        channelDescription: "channel description",
        importance: Importance.max,
        icon: "@mipmap/ic_launcher",
        playSound: true,
      ),
      iOS: null
  );

  static Future<void> init({bool initScheduled = false}) async {
    final android = AndroidInitializationSettings("@mipmap/ic_launcher");
    //final ios = IOSInitializationSettings();
    final setting = InitializationSettings(android: android,iOS: null);


    await _notifications.initialize(
      setting,
      onDidReceiveBackgroundNotificationResponse: (payload) async {
        onNotifications.add("bbb");
        print (payload);
        navigateToNotificationDetails(payload);


      },

    );
  }

  static Future<void> showNotification({
    required int id,
    String? title,
    String? body,
    String? payload,

  }) async =>
      _notifications.show(
        id,
        title,
        body,
        await _notificationDetails(),
        payload: payload,
      );


  static void navigateToNotificationDetails(var payload) {

    print(payload) ;
    Get.to(BounsNotificationPage()) ;

  }
}