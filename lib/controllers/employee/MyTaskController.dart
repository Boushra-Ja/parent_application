import 'package:alrazi_project/Themes/Theme.dart';
import 'package:alrazi_project/models/Task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../main.dart';

class MyTaskController extends GetxController {
  List<Task> taskList = <Task>[].obs;

  var isLoading = true.obs;
  final  noteFormKey = GlobalKey<FormState>() ;
  late TextEditingController noteController ;
  final storage = const FlutterSecureStorage();


  @override
  void onInit() {
    noteController = TextEditingController();
    super.onInit();
    fetchMyTasks();
  }
  void deleteItem(int index) {
    taskList.removeAt(index);

    // Call update method to refresh the list
    update();
  }

  Future<void> fetchMyTasks() async {
    var id = await storage.read(key: 'id') ?? '';
    print(id);

    final response =
        await http.get(Uri.parse('${MyApp.api}/api/employee/tasks/${id}'));

    if (response.statusCode == 200) {
      TaskModel taskModel = TaskModel.fromJson(jsonDecode(response.body));
      taskList.assignAll(taskModel.data);

      isLoading.value = false;
    } else {
      print("errorrrrr");
    }
  }

  Future<void> terminate_task(int task_id , int index) async {

    bool isvalidate = noteFormKey.currentState!.validate();


    if(isvalidate)
      {
        noteFormKey.currentState!.save();

        var notes = noteController.text ;

        final response = await http.post(
            Uri.parse('${MyApp.api}/api/task/terminate/${task_id}'),
            headers: {'Content-Type': 'application/json',
              'Accept': 'application/json'},
            body:jsonEncode(<String, dynamic>{
              'notes' : notes
            })
        );
        if (response.statusCode == 200) {
          deleteItem(index);

          print("successs");
          Get.back();
          Get.snackbar(
            '',
            '',
            titleText: Text(
              'تمت العملية بنجاح', // Arabic text for message body
              textDirection: TextDirection.rtl, // Set text direction to right-to-left
              textAlign: TextAlign.right,
              style: Themes.headline1,// Set text alignment to right
            ),
            messageText: Text(
              'تم إنهاء المهمة وإخبار المدير بذلك..', // Arabic text for message body
              textDirection: TextDirection.rtl, // Set text direction to right-to-left
              textAlign: TextAlign.right,
              style: Themes.headline2,// Set text alignment to right
            ),
            snackPosition: SnackPosition.BOTTOM,

            duration: Duration(seconds: 2),
            backgroundColor: Colors.grey.withOpacity(0.4) ,
            colorText: Themes.white,
            borderRadius: 10,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            maxWidth: 500,
            animationDuration: Duration(milliseconds: 500),
            shouldIconPulse: true,
            icon: Icon(Icons.info_outline),

            isDismissible: true,
            forwardAnimationCurve: Curves.easeOutBack,
            reverseAnimationCurve: Curves.easeInBack,
            overlayBlur: 5,
            overlayColor: Colors.black54,
          );
        }
      }



  }
}
