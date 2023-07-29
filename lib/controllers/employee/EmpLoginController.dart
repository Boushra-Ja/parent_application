import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';
import '../../models/Employee.dart';
import '../../views/Employe_App/EmployeHome.dart';

class EmpLoginController extends GetxController{
  final storage = const FlutterSecureStorage();
  late Employee employee;
  var isLoading = false.obs;
  var unique_number = null;
  final  loginFormkey = GlobalKey<FormState>() ;


  @override
  void onInit() {

    super.onInit();
  }

  Future<Employee?> loginEmployee({required unique_number, role}) async {

    var response = await http.post(Uri.parse('${MyApp.api}/api/Login_Other'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
            <String, dynamic>{"unique_number": unique_number, "role": role}));

    if (response.statusCode == 200 || response.statusCode == 201) {
      EmployeeModel employeeModel =
      EmployeeModel.fromJson(jsonDecode(response.body));
      employee = new Employee(
          id: employeeModel.data[0].id,
          name: employeeModel.data[0].name,
          unique_number: employeeModel.data[0].unique_number,
          points: employeeModel.data[0].points,
          task_count: employeeModel.data[0].task_count ,password: employeeModel.data[0].password);

      await storage.write(key: "type", value: '2');
      await storage.write(key: "name", value: '${employee.name}');
      await storage.write(key: "id", value: '${employee.id}');
      await storage.write(key: "points", value: '${employee.points}');
      await storage.write(key: "task_count", value: '${employee.task_count}');
      await storage.write(key: "islogin", value: 'true');
      await storage.write(key: "role", value: 'employee');


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
        var data = await loginEmployee(
            unique_number: this.unique_number, role: "Employee");

        if (data != null) {
          loginFormkey.currentState!.save();

          Get.to(EmployeHome());
        } else {
          Get.snackbar("Login", "problem in login");
        }
      } finally {
        isLoading(false);
      }
    }
  }
  void dispose() {

    super.dispose();
  }



}