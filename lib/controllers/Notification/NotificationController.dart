import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../main.dart';
import '../../models/Notification.dart';

class NotificationController extends GetxController{

  final storage = const FlutterSecureStorage();
  var emp_id  , isLoading = false.obs  , token  ;
  String rule = '';
  List<Notification> notifications = <Notification>[].obs ;

  Future<void> fetch_notification() async {

    final response = await http
        .get(Uri.parse('${MyApp.api}/api/employee/notifications/$emp_id'),
        headers: {'Content-Type': 'application/json',
          'Accept': 'application/json', 'Authorization': 'Bearer $token'}
    );

    if (response.statusCode == 200) {
      NotificationModel notificationModel =
      NotificationModel.fromJson(jsonDecode(response.body));

      notifications.assignAll(notificationModel.data) ;
      print("success") ;
      isLoading.value = true ;

    }

  }

  init()async{
    emp_id = await storage.read(key: 'id');
    token = await storage.read(key: 'token');
    rule = (await storage.read(key: 'role'))!;

    await fetch_notification();
  }

  @override
  void onInit() {
    init() ;
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }


}