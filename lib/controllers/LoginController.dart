import 'dart:convert';
import 'package:alrazi_project/main.dart';
import 'package:alrazi_project/models/Child.dart';
import 'package:alrazi_project/models/Employee.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../views/Employe_App/EmployeHome.dart';
import '../views/Parent_App/FamilyHome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  late Employee employee;
  late Child child ;
  var unique_number = null;
  var isLoading = false.obs;
  final loginFormkey = GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();

  }

  Future<Employee?> loginEmployee({required unique_number, role}) async {
    final prefs = await SharedPreferences.getInstance();

    var response = await http.post(Uri.parse('${MyApp.api}/api/Login_Other'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
            <String, dynamic>{"unique_number": unique_number, "role": role}));

    if (response.statusCode == 200 || response.statusCode == 201) {
      EmployeeModel employeeModel = EmployeeModel.fromJson(jsonDecode(response.body)) ;
      employee = new Employee(id: employeeModel.data[0].id, name: employeeModel.data[0].name, unique_number: employeeModel.data[0].unique_number, points: employeeModel.data[0].points , task_count: employeeModel.data[0].task_count);

      prefs.setString('name', employee.name);
      prefs.setString('type', '2');
      prefs.setString('id', employee.id);
      prefs.setString('points', employee.points);
      prefs.setString('task_count', employee.task_count);
      return this.employee;
    } else
      return null;
  }

  Future<void> doLogin() async {
    bool isvalidate = loginFormkey.currentState!.validate();

    if (isvalidate) {
      isLoading.value = true;
      loginFormkey.currentState!.save();

      try {
        var data =
            await loginEmployee(unique_number: this.unique_number, role: "Employee");

        if (data != null) {
          loginFormkey.currentState!.save();
          Get.off(EmployeHome());
        } else {
          Get.snackbar("Login", "problem in login");
        }
      } finally {
        isLoading(false);
      }
    }
  }

  Future<void> doLoginParent()async{

      bool isvalidate = loginFormkey.currentState!.validate();

    if (isvalidate) {
      isLoading.value = true;
      loginFormkey.currentState!.save();

      try {
        var data =
        await loginParent(unique_number: this.unique_number);

        if (data != null) {
          loginFormkey.currentState!.save();
          Get.off(FamilyHome());
        } else {
          Get.snackbar("Login", "problem in login");
        }
      } finally {
        isLoading(false);
      }
    }
  }

  Future<Child?> loginParent({required unique_number})async{
    final prefs = await SharedPreferences.getInstance();

    var response = await http.post(Uri.parse('${MyApp.api}/api/parent/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
            <String, dynamic>{"unique_number": unique_number}));

    if (response.statusCode == 200 || response.statusCode == 201) {
      ChildModel employeeModel = ChildModel.fromJson(
          jsonDecode(response.body));
      child = new Child(id: employeeModel.data[0].id,
          name: employeeModel.data[0].name,
          unique_number: employeeModel.data[0].unique_number,
          age: employeeModel.data[0].age,
          infection: employeeModel.data[0].infection , section:employeeModel.data[0].section, phone_num: employeeModel.data[0].phone_num );

      prefs.setString('name', child.name);
      prefs.setString('type', '1');
      prefs.setString('id', '${child.id}');
      prefs.setString('infection', '${child.infection}');
      prefs.setString('section', '${child.section}');

      return this.child;

    }
    else
      return null;
  }

}

