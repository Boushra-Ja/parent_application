import 'package:alrazi_project/models/Task.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../main.dart';

class MyTaskController extends GetxController {
  List<Task> taskList = <Task>[].obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMyTasks();
  }
  void deleteItem(int index) {
    taskList.removeAt(index);

    // Call update method to refresh the list
    update();
  }

  Future<void> fetchMyTasks() async {
    final prefs = await SharedPreferences.getInstance();
    var id = prefs.getString('id') ?? '';
    print(id);

    final response =
        await http.get(Uri.parse('${MyApp.api}/api/employee/tasks/${id}'));

    if (response.statusCode == 200) {
      TaskModel shopModel = TaskModel.fromJson(jsonDecode(response.body));
      taskList.assignAll(shopModel.data);

      isLoading.value = false;
    } else {
      print("errorrrrr");
    }
  }

  Future<void> terminate_task(int task_id , int index) async {
    final response = await http.post(
      Uri.parse('${MyApp.api}/api/task/terminate/${task_id}'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );

    if (response.statusCode == 200) {
     deleteItem(index);

      print("successs");
      Get.back();
      Get.snackbar("تمت العملية بنجاح", 'تم إنهاء المهمة وإخبار المدير بذلك..');
    }
  }
}
