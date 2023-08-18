import 'package:alrazi_project/views/Employe_App/NotificationPages/NotificationPage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationApi extends Bloc{
  static final FlutterLocalNotificationsPlugin _notifications =
  FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  NotificationApi() : super('');

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
        await onSelectNotification(payload.toString());

      },

    );
  }
  static Future<void> onSelectNotification(String payload) async {
    print('dddddddddddddddd') ;
    Get.to(NotificationPage() );

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



  @override
  Stream<String> mapEventToState(String event) async* {
    // إذا تم استلام الإشعار في الخلفية
    if (event.isNotEmpty) {
      // انتقال إلى صفحة تفاصيل الإشعار وتمرير البيانات المطلوبة
      Get.to(NotificationPage()) ;
    }
  }
  // استلام الإشعارات وتنفيذ العملية في الخلفية
  Future<void> onSelectNotification(String payload) async {
    if (payload != null) {
      // إرسال الإشعار إلى الـ Bloc لتنفيذ الانتقال إلى صفحة تفاصيل الإشعار
      BlocProvider.of<NotificationBloc>(context).add(payload);
    }
  }
}