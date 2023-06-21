import 'dart:convert';

import 'package:alrazi_project/models/Report.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class ReportPageController extends GetxController {
  var name, id, user_type, var1, var2;

  var isLoading = false.obs;

  late Report report;

  @override
  void onInit() {
    inital();
    super.onInit();
  }

  void inital() async {
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name') ?? '';
    id = prefs.getString('id') ?? '';
    user_type = prefs.getString('type') ?? '';
    if (user_type == '1') {
      var1 = prefs.getString('infection') ?? '';
      var2 = prefs.getString('section') ?? '';
    }
    else {
      var1 = prefs.getString('points') ?? '';
      var2 = prefs.getString('tasks_count') ?? '';
    }
    get_tests();
  }

  void get_tests() async {
    final response = await http.get(
        Uri.parse('${MyApp.api}/api/child/test/${id}'));

    if (response.statusCode == 200) {
      ReportModel reportModel = ReportModel.fromJson(jsonDecode(response.body));
      report = new Report(test_date: reportModel.data[0].test_date,
          new_social_ratio: reportModel.data[0].new_social_ratio,
          old_social_ratio: reportModel.data[0].old_social_ratio,
          new_montor_ratio: reportModel.data[0].new_montor_ratio,
          old_montor_ratio: reportModel.data[0].old_montor_ratio,
          new_care_ratio: reportModel.data[0].new_care_ratio,
          old_care_ratio: reportModel.data[0].old_care_ratio,
          new_comm_ratio: reportModel.data[0].new_comm_ratio,
          old_comm_ratio: reportModel.data[0].old_comm_ratio,
          new_know_ratio: reportModel.data[0].new_know_ratio,
          old_know_ratio: reportModel.data[0].old_know_ratio);
      isLoading.value = true;
    } else {
      print("errorrrrr");
    }
  }

}