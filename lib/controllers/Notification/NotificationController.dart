import 'dart:convert';
import 'package:alrazi_project/models/Advice.dart';
import 'package:alrazi_project/models/Task.dart';
import 'package:alrazi_project/views/Employe_App/NotificationPages/AdvicNotificationPage.dart';
import 'package:alrazi_project/views/Employe_App/NotificationPages/BounsNotificationPage.dart';
import 'package:alrazi_project/views/Employe_App/TaskDetail.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../main.dart';
import '../../models/Notification.dart';
import '../../models/TaskPoint.dart';

class NotificationController extends GetxController{

  final storage = const FlutterSecureStorage();
  var emp_id  , isLoading = false.obs  , token  ;
  String rule = '';
  List<Notification> notifications = <Notification>[].obs ;

  Future<void> fetch_notification_employee() async {
    notifications = <Notification>[].obs;
    isLoading = false.obs;
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

  Future<void> fetch_notification_child() async {

    notifications = <Notification>[].obs;
    isLoading = false.obs ;
    final response = await http
        .get(Uri.parse('${MyApp.api}/api/parent/notifications/$emp_id'),
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
    print('dddddddddddddddddddddddddddddddd') ;
    print(rule) ;
    print('dddddddddddddddddddddddddddddddd') ;

    if(rule == "employee")
      await fetch_notification_employee();
    else
      await fetch_notification_child();
  }

  void move_page_deatils(index)async{
    if(rule == 'employee')
      {
        if(notifications.elementAt(index).type  == "اسناد مهمة")
          {
            Task? task = await fetch_task_detail(notifications.elementAt(index).need_id) ;
            Get.to(TaskDetail(task!)) ;

          }
        else if(notifications.elementAt(index).type ==  'اسناد نقاط')
          {
            await fetch_bouns_detail(notifications.elementAt(index).need_id) ;
          }

      }
    else{
      if(notifications.elementAt(index).type == "ارسال توجيه")
        {
          fetch_advice_detail(notifications.elementAt(index).need_id);
        }
      else {

      }
    }
  }

  Future<Task?> fetch_task_detail(id)async{
    final response = await http.get(Uri.parse('${MyApp.api}/api/task/details/${id}')) ;
    if(response.statusCode == 200)
      {
        TaskObjModel task = tableFromJson(response.body);
        Task task_obj = new Task(num: task.data.num, title: task.data.title, description: task.data.description, check: task.data.check, deliver_date: task.data.deliver_date, task_date: task.data.task_date, child_name: task.data.child_name, notes: task.data.notes, start: task.data.start, start_double: task.data.start_double) ;
        return task_obj ;
      }

    return null ;
  }

  Future<void>fetch_bouns_detail(id)async{
    final response = await http.get(Uri.parse('${MyApp.api}/api/details_ِbouns/${id}')) ;
    print("ssssssssssssssssssssss") ;
    print(id) ;
    if(response.statusCode == 200)
      {
        print("ssssssssssssssssssssss") ;
        print(response.body) ;
        TaskPointModel taskPointModel = tableFromJson2(response.body) ;
        TaskPoint taskPoint = new TaskPoint(task_name: taskPointModel.data.task_name, points: taskPointModel.data.points, task_id: taskPointModel.data.task_id);
        Task? task  = await fetch_task_detail(taskPoint.task_id) ;

        Get.to(BounsNotificationPage(task: task!, taskPoint: taskPoint)) ;
      }

  }

  Future<void>fetch_advice_detail(id)async{
    final response = await http.get(Uri.parse('${MyApp.api}/api/details_advice/${id}')) ;
    if(response.statusCode == 200)
    {
      AdviceModel adviceModel = AdviceModel.fromJson(jsonDecode(response.body)) ;
      Advice advice = new Advice(id: adviceModel.data[0].id, text: adviceModel.data[0].text, created_at: adviceModel.data[0].created_at);

      Get.to(AdviceNotificationPage(advice:advice)) ;
    }

  }

  @override
  void onInit() {
    super.onInit();
    init() ;
  }

  @override
  void dispose() {
    super.dispose();
  }


}