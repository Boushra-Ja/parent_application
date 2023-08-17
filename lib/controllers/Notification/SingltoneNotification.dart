
import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:pusher_client/pusher_client.dart';
import 'NotificationApi.dart';


class EmpSingltoneNotification  extends GetxController{
  final storage = const FlutterSecureStorage();

  static final EmpSingltoneNotification _SingltonePusher =
  EmpSingltoneNotification._internal();

  factory EmpSingltoneNotification() {
    return _SingltonePusher;
  }
  var sender_id=''.obs;
  EmpSingltoneNotification._internal();
  PusherClient? pusher;
  Channel? channel;

  initPusher() {
    PusherOptions options = PusherOptions(
      cluster: "ap2",
    );

    pusher = PusherClient("f2c0c09b41262ac3f4ff", options,
      enableLogging: true, autoConnect: false,
    );
  }


  void subscribePusher() {

    channel = pusher!.subscribe("public-channel.${sender_id.value}");
    pusher!.onConnectionStateChange((state) {
      log("previousState: ${state!.previousState}, currentState: ${state.currentState}");
    });
    pusher!.onConnectionError((error) {
      log("error: ${error!.message}");
    });
    channel!.bind("NotificationEvent", (last) {
      final data = json.decode(last!.data.toString());
      NotificationApi.showNotification(id:0 ,payload:"sdsgdg" ,body:data['message'],title:data['title'] );

      if (last.data != null) {
        print(data["message"]);
        print(data["title"]);

      }
    });
  }

  void connectPusher() {
    pusher!.connect();
  }

  void disconnectPusher() async {
    await channel!.unbind("NotificationEvent");
    await pusher!.disconnect();
  }

  inti() async {
    sender_id.value=(await storage.read(key: 'id'))!;
    print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
    EmpSingltoneNotification().initPusher();
    EmpSingltoneNotification().connectPusher();
    EmpSingltoneNotification().subscribePusher();
  }

  void logout()async{
    EmpSingltoneNotification().disconnectPusher();

  }
  @override
  void onInit() {
    inti();
  }

}













